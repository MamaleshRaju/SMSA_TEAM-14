# ===============================
# EXPLORATORY DATA ANALYSIS (FINAL)
# ===============================

library(ggplot2)
library(dplyr)

# Load data
data <- read.csv("data/cleaned_data.csv")

# -------------------------------
# Sentiment Distribution
# -------------------------------
p1 <- ggplot(data, aes(x = sentiment_label)) +
  geom_bar(fill = "steelblue") +
  ggtitle("Sentiment Distribution")

ggsave("results/figures/sentiment_distribution.png", plot = p1)

# -------------------------------
# Likes Distribution
# -------------------------------
p2 <- ggplot(data, aes(x = likes_count)) +
  geom_histogram(bins = 30, fill = "green") +
  ggtitle("Likes Distribution")

ggsave("results/figures/likes_distribution.png", plot = p2)

# -------------------------------
# Engagement by Platform
# -------------------------------
p3 <- ggplot(data, aes(x = platform, y = engagement_rate)) +
  geom_boxplot(fill = "orange") +
  ggtitle("Engagement by Platform")

ggsave("results/figures/platform_engagement.png", plot = p3)

# -------------------------------
# Correlation Heatmap
# -------------------------------
numeric_data <- data %>%
  select(likes_count, shares_count, comments_count, impressions, engagement_rate)

cor_matrix <- cor(numeric_data)

png("results/figures/correlation_matrix.png")
heatmap(cor_matrix)
dev.off()

cat("✅ EDA completed\n")
