## Handling missing values in database

#### Ways to handle missing values
# Missing values are common when working with real-world datasets – not the cleaned ones available on Kaggle, for example.
# Missing data could result from a human factor (for example, a person deliberately failing to respond to a survey question), a problem in electrical sensors, or other factors. And when this happens, you can lose significant information.
# Now, there is no perfect way to handle missing values that will give you an accurate result as to what the missing value is. But there are several techniques that you can leverage that will give you decent performance.
# In this article, we will look at how to handle missing data in the right way (the right way meaning selecting the appropriate technique for whatever scenario our data set might represent).
# Remember that none of these methods are perfect – they still introduce some biases, such as favoring one class over another – but they are useful.
# Before we begin, I'd like to start with a quote from George Box to back up the preceding statement:

# Now without further ado let’s get started.

# What Types of Missing Data Are There?
# You may be wondering if missing values have types. Yes, they do – and in the real world, these missing values can be divided into three categories.
# Understanding these categories will give you with some insights into how to approach the missing value(s) in your dataset.
# Among the categories are:

# Missing Completely at Random (MCAR).
# Missing at Random (MAR).
# Not Missing at Random (NMAR).

# Missing Data that's Missing Completely at Random (MCAR)
# These are data that are missing completely at random. That is, the missingness is independent from the data. There is no discernible pattern to this type of data missingness.
# This means that you cannot predict whether the value was missing due to specific circumstances or not. They are just completely missing at random.

# Missing Data that's Missing at Random (MAR)
# These types of data are missing at random but not completely missing. The data's missingness is determined by the data you see.
# Consider for instance that you built a smart watch that can track people's heart rates every hour. Then you distributed the watch to a group of individuals to wear so you can collect data for analysis.
# After collecting the data, you discovered that some data were missing, which was due to some people being reluctant to wear the wristwatch at night. As a result, we can conclude that the missingness was caused by the observed data.

# Missing Data that's Not Missing at Random (NMAR)
# These are data that are not missing at random and are also known as ignorable data. In other words, the missingness of the missing data is determined by the variable of interest.
# A common example is a survey in which students are asked how many cars they own. In this case, some students may purposefully fail to complete the survey, resulting in missing values.

# How Should You Handle Missing Data?
# As we just learned, these techniques cannot be that precise in determining the missing value. They appear to have some biases.
# Handling missing values falls generally into two categories. We will look at the most common in each category. The two categories are as follows:

# Deletion
# Imputation

# How to Handle Missing Data with Deletion
# One of the most prevalent methods for dealing with missing data is deletion. And one of the most commonly used methods in the deletion approach is using the list wise deletion method.

# What is List-Wise Deletion?
# In the list-wise deletion method, you remove a record or observation in the dataset if it contains some missing values.
# You can perform list-wise deletion on any of the aforementioned missing value categories, but one of its disadvantages is potential information loss.
# The general rule of thumb for when to perform list-wise deletion is when the number of observations with missing values exceeds the number of observations without missing values. This is because the dataset does not have a lot of information to feed the missing values, so it is better to drop those values or discard the dataset entirely.
# You can implement list-wise deletion in Python by simply using the Pandas .dropna method like this:

# df.dropna(axis=1, inplace=True)

# How to Handle Missing Data with Imputation
# Another frequent general method for dealing with missing data is to fill in the missing value with a substituted value.
# This methodology encompasses various methods, but we will focus on the most prevalent ones here.

# Prior knowledge of an ideal number
# This method entails replacing the missing value with a specific value. To use it, you need to have domain knowledge of the dataset. You use this to populate the MAR and MCAR values.
# To implement it in Python, you use the .fillna method in Pandas like this:

# df.fillna(inplace=True)

# Regression imputation
# The regression imputation method includes creating a model to predict the observed value of a variable based on another variable. Then you use the model to fill in the missing value of that variable.
# This technique is utilized for the MAR and MCAR categories when the features in the dataset are dependent on one another. For example using a linear regression model.

# Simple Imputation
# This method involves utilizing a numerical summary of the variable where the missing value occurred (that is using the feature or variable's central tendency summary, such as mean, median, and mode).
# When you use this strategy to fill in the missing values, you need to evaluate the variable's distribution to determine which central tendency summary to apply.
# You use this method in the MCAR category. And you implement it in Python using the SimpleImputer transformer in the Scikit-learn library.

# from sklearn.impute import SimpleImputer
# Specify the strategy to be the median class
# fea_transformer = SimpleImputer(strategy="median")
# values = fea_transformer.fit_transform(df[["Distance"]])
# pd.DataFrame(values)

# KNN Imputation
# KNN imputation is a fairer approach to the Simple Imputation method. It operates by replacing missing data with the average mean of the neighbors nearest to it.
# You can use KNN imputation for the MCAR or MAR categories. And to implement it in Python you use the KNN imputation transformer in ScikitLearn, as seen below:

# from sklearn.impute import KNNImputer
# I specify the nearest neighbor to be 3 
# fea_transformer = KNNImputer(n_neighbors=3)
# values = fea_transformer.fit_transform(df[["Distance"]])
# pd.DataFrame(values)

# How to Use Learning Algorithms
# The final strategy we'll mention in this post is using machine learning algorithms to handle missing data.
# Some learning algorithms allow us to fit the dataset with missing values. The dataset algorithm then searches for patterns in the dataset and uses them to fill in the missing values. Such algorithms include XGboost, Gradient Boosting, and others. But further discussion is out of the scope of this article.

# Conclusion and Learning More
# In this article, we've covered some of the most prevalent techniques you'd use on a daily basis to handle missing data.
# But the learning does not end here. There are several other techniques available to assist us in filling our dataset, but the key is to grasp the underlying mechanisms in those