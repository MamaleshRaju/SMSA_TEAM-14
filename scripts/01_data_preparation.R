# ===============================
# DATA PREPARATION (FINAL)
# ===============================

library(dplyr)
library(readr)

# Load dataset
data <- read_csv("data/social_media_engagement.csv", show_col_types = FALSE)

# Remove missing values
data <- na.omit(data)

# Convert categorical columns
data$platform <- as.factor(data$platform)
data$day_of_week <- as.factor(data$day_of_week)
data$sentiment_label <- as.factor(data$sentiment_label)
data$emotion_type <- as.factor(data$emotion_type)
data$topic_category <- as.factor(data$topic_category)
data$brand_name <- as.factor(data$brand_name)
data$product_name <- as.factor(data$product_name)
data$campaign_name <- as.factor(data$campaign_name)
data$campaign_phase <- as.factor(data$campaign_phase)

# Convert numeric columns safely
numeric_cols <- c("sentiment_score", "toxicity_score",
                  "likes_count", "shares_count", "comments_count",
                  "impressions", "engagement_rate",
                  "user_past_sentiment_avg",
                  "user_engagement_growth", "buzz_change_rate")

data[numeric_cols] <- lapply(data[numeric_cols], as.numeric)

# Save cleaned data
write_csv(data, "data/cleaned_data.csv")

cat("✅ Data preparation completed\n")
