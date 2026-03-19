# Social Media Analytics Data Warehouse with Opinion Mining

## Team Members
NADINDLA MAHABUB MAHHEN – 2023BCS0111  
GADDAM SUJAN – 2023BCD0027  
MOHAMMED SABEEH K – 2023BCS0108  
VONTEDDU MAMALESH RAMANA RAJU – 2023BCS0081  

---

## Problem Statement
Social media platforms generate massive volumes of unstructured data daily. Organizing this data and extracting meaningful insights such as public sentiment and engagement patterns is challenging. This project aims to build a structured data warehouse integrated with opinion mining techniques to analyze social media data efficiently.

---

## Objectives
- Build a structured data warehouse for social media data  
- Analyze engagement metrics such as likes, shares, and comments  
- Perform sentiment analysis (positive, negative, neutral)  
- Identify trends and patterns in social media data  
- Support data-driven decision making  

---

## Abstract
This project focuses on building a Social Media Analytics Data Warehouse integrated with opinion mining techniques. The main problem addressed is the difficulty of organizing large volumes of social media data and extracting meaningful public sentiment from it. We use a Kaggle dataset containing social media posts, engagement metrics, and sentiment-related features. The expected outcome is a structured system that supports efficient storage, querying, and analysis of social media trends along with sentiment classification.

---

## Dataset

**Dataset Name:** Social Media Engagement Dataset  

**Source:**  
https://www.kaggle.com/datasets/subashmaster0411/social-media-engagement-dataset  

**Number of Observations:**  
(UPDATE after checking dataset, e.g., ~10,000 rows)  

**Number of Variables:**  
26  

---

### **Attributes Description**

- post_id → Unique identifier of each post  
- timestamp → Time of post  
- day_of_week → Day the post was created  
- platform → Social media platform (Instagram, Twitter, etc.)  
- user_id → Unique user identifier  
- location → User location  
- language → Language of post  
- text → Content of the post  
- hashtags → Hashtags used  
- mentions → Mentions in the post  
- keywords → Important keywords  
- topic → Topic category  
- sentiment_score → Numeric sentiment value  
- sentiment → Positive / Negative / Neutral  
- emotion → Emotion type (Happy, Angry, Sad, etc.)  
- toxicity → Toxicity score  
- likes_count → Number of likes  
- shares_count → Number of shares  
- comments_count → Number of comments  
- impressions → Total reach  
- engagement_rate → Engagement level  
- brand_name → Associated brand  
- product → Product name  
- campaign → Campaign type  
- user_age → Age of user  
- user_gender → Gender of user  
- buzz_change_rate → Change in trend/buzz  

---

**Note:**  
Dataset is not uploaded due to size/public availability. Refer to `data/dataset_description.md`.

---

## Methodology

### Data Preprocessing
- Handling missing values  
- Removing duplicates  
- Converting categorical variables  
- Data cleaning and formatting  

---

### Exploratory Data Analysis
- Distribution of sentiment  
- Engagement analysis (likes, shares, comments)  
- Platform-wise comparison  
- Correlation analysis  

---

### Models Used
- Logistic Regression  
- Random Forest  
- Support Vector Machine (SVM)  

---

### Evaluation Methods
- Accuracy  
- Precision  
- Recall  
- F1 Score  

---

## Results

The models were evaluated using classification metrics. Random Forest showed better performance in predicting sentiment compared to other models. Engagement-related features such as likes, shares, and impressions were found to strongly influence sentiment patterns.

---

## Key Visualizations

- Sentiment distribution chart  
- Engagement metrics analysis  
- Correlation heatmap  
- Feature importance plot  

(All visualizations are available in `results/figures/`)

---

## How to Run the Project

1. Download dataset from the Kaggle link  
2. Place dataset inside the `data/` folder  
3. Install required packages using `requirements.R`  
4. Run scripts in order:

   - 01_data_preparation.R  
   - 02_exploratory_analysis.R  
   - 03_modeling.R  
   - 04_evaluation.R  

---

## Folder Organization

- `data/` → dataset description  
- `scripts/` → R scripts  
- `results/figures/` → plots  
- `results/tables/` → evaluation tables  
- `presentation/` → slides  

---

## Conclusion

This project demonstrates how social media data can be structured into a data warehouse and analyzed using opinion mining techniques. It provides insights into user engagement, sentiment trends, and campaign effectiveness, enabling better decision-making.

---

## Contribution

2023BCS0111 | Data preprocessing, initial EDA  
2023BCD0027 | Model development and evaluation  
2023BCS0108 | Visualization and report writing  
2023BCS0081 | Model integration and coordination  

---

## References
- Kaggle Dataset  
- Research papers on sentiment analysis  
- R Documentation  
