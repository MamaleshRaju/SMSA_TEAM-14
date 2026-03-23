# ===============================
# MODEL BUILDING (FINAL FIXED)
# ===============================

library(caret)
library(randomForest)
library(e1071)
library(nnet)  # Needed for multinom

# Load data
data <- read.csv("data/cleaned_data.csv")

# Ensure the target is a factor
data$sentiment_label <- as.factor(data$sentiment_label)

# Select relevant features and target
model_data <- data[, c("likes_count", "shares_count", "comments_count",
                       "impressions", "engagement_rate", "sentiment_label")]

# Remove any remaining NAs
model_data <- na.omit(model_data)

# Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(model_data$sentiment_label, p = 0.8, list = FALSE)
train <- model_data[trainIndex, ]
test <- model_data[-trainIndex, ]

# -------------------------------
# Logistic Regression (Multinomial)
# -------------------------------
log_model <- train(sentiment_label ~ ., data = train, method = "multinom", trace = FALSE)

# -------------------------------
# Random Forest
# -------------------------------
rf_model <- randomForest(sentiment_label ~ ., data = train)

# -------------------------------
# Support Vector Machine (SVM)
# -------------------------------
svm_model <- svm(sentiment_label ~ ., data = train)

# Save trained models for evaluation step
saveRDS(log_model, "results/log_model.rds")
saveRDS(rf_model, "results/rf_model.rds")
saveRDS(svm_model, "results/svm_model.rds")

cat("✅ Model training completed successfully!\n")
