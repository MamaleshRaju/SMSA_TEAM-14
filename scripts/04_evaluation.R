# ===============================
# MODEL EVALUATION (FINAL + EXTRA)
# ===============================

library(caret)
library(pROC)
library(randomForest)
library(e1071)
# Load data
data <- read.csv("data/cleaned_data.csv")

# Ensure correct type
data$sentiment_label <- as.factor(data$sentiment_label)

model_data <- data[, c("likes_count", "shares_count", "comments_count",
                       "impressions", "engagement_rate", "sentiment_label")]

model_data <- na.omit(model_data)

# Split
set.seed(123)
trainIndex <- createDataPartition(model_data$sentiment_label, p = 0.8, list = FALSE)
train <- model_data[trainIndex, ]
test <- model_data[-trainIndex, ]

# Load models
log_model <- readRDS("results/log_model.rds")
rf_model <- readRDS("results/rf_model.rds")
svm_model <- readRDS("results/svm_model.rds")

# -------------------------------
# Predictions
# -------------------------------
# -------------------------------
# Predictions (FIXED)
# -------------------------------

pred_log <- predict(log_model, newdata = test)
pred_rf <- predict(rf_model, newdata = test)
pred_svm <- predict(svm_model, newdata = test)

# -------------------------------
# Confusion Matrices
# -------------------------------
cm_log <- confusionMatrix(pred_log, test$sentiment_label)
cm_rf <- confusionMatrix(pred_rf, test$sentiment_label)
cm_svm <- confusionMatrix(pred_svm, test$sentiment_label)

# -------------------------------
# Results Table
# -------------------------------
results <- data.frame(
  Model = c("Logistic Regression", "Random Forest", "SVM"),
  Accuracy = c(cm_log$overall["Accuracy"],
               cm_rf$overall["Accuracy"],
               cm_svm$overall["Accuracy"])
)

# -------------------------------
# Create folders (IMPORTANT FIX)
# -------------------------------
if (!dir.exists("results/tables")) {
  dir.create("results/tables", recursive = TRUE)
}

if (!dir.exists("results/figures")) {
  dir.create("results/figures", recursive = TRUE)
}

# Save results
write.csv(results, "results/tables/model_performance.csv", row.names = FALSE)

# -------------------------------
# ROC CURVE (Multi-class One-vs-All)
# -------------------------------

# Get probabilities from Random Forest
rf_probs <- predict(rf_model, test, type = "prob")

classes <- levels(test$sentiment_label)

png("results/figures/roc_curve.png")

plot(roc(test$sentiment_label == classes[1], rf_probs[,1]),
     col = "blue", main = "ROC Curve (One-vs-All)")

for (i in 2:length(classes)) {
  plot(roc(test$sentiment_label == classes[i], rf_probs[,i]),
       col = i+1, add = TRUE)
}

legend("bottomright", legend = classes, col = 2:(length(classes)+1), lwd = 2)

dev.off()

# -------------------------------
# FEATURE IMPORTANCE
# -------------------------------

png("results/figures/feature_importance.png")

varImpPlot(rf_model, main = "Feature Importance")

dev.off()

# -------------------------------
# Print results
# -------------------------------
print(results)

cat("✅ Evaluation + ROC + Feature Importance completed!\n")
