# Income Prediction and Model Explainability using Random Forest, DALEX, and LIME

![adult](https://github.com/user-attachments/assets/99e1ef19-0b9f-4c98-9ffd-5959742dd933)

## Project Overview

This project aims to predict the income of individuals based on various demographic and employment-related features using machine learning techniques. A **Random Forest** model is used for classification, and two powerful explainability tools, **DALEX** and **LIME**, are employed to interpret and visualize the model's predictions. This helps in understanding which features are the most influential in determining the income class (e.g., ">50K" or "<=50K").

## Dataset

The dataset used in this project is the **Adult Income Dataset** (also known as the **Census Income Dataset**), which contains information about individuals and their income. The dataset includes the following columns:
- **age**: The age of the individual.
- **workclass**: The type of employment.
- **education**: The highest level of education attained.
- **marital.status**: Marital status of the individual.
- **occupation**: The occupation of the individual.
- **relationship**: Relationship status.
- **race**: The race of the individual.
- **sex**: The gender of the individual.
- **native.country**: The country of origin.
- **income**: The target variable, indicating if the individual earns more than 50K a year or not.

The dataset is pre-processed by handling missing values and converting categorical variables to factors.

## Libraries Used
- **tidyverse**: For data manipulation and visualization.
- **caret**: For model training and evaluation.
- **DALEX**: For model explainability and feature importance.
- **lime**: For local interpretable model-agnostic explanations.

## Steps Involved

1. **Data Loading and Preprocessing**:
   - The data is loaded from a CSV file, and the first few rows are displayed.
   - Missing values are checked, and categorical variables are converted into factors.

2. **Data Splitting**:
   - The dataset is split into training (70%) and testing (30%) sets.

3. **Model Training**:
   - A **Random Forest** model is trained using the `caret` package with 10-fold cross-validation to predict income.

4. **Model Evaluation**:
   - After the model is trained, predictions are made on the test set, and performance metrics such as **Confusion Matrix** are calculated.

5. **Model Explainability with DALEX**:
   - The DALEX package is used to explain the model's predictions. Feature importance is visualized to understand which features play a major role in predicting the income.

6. **Model Explainability with LIME**:
   - The LIME package provides local explanations for individual predictions. The explanation for the first five test instances is visualized, and the importance of features such as **gender** is also explored.

## Key Visualizations

- **Variable Importance**: This visualization shows the relative importance of each feature in predicting income.
- **LIME Explanations**: Local explanations for individual predictions show how specific features influence the outcome for individual data points.

## How to Run the Code

To run the code, follow these steps:

1. Install the required packages:
   ```r
   install.packages("tidyverse")
   install.packages("caret")
   install.packages("DALEX")
   install.packages("lime")
