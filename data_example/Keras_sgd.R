###############################################
# Install Keras and Tensorflow
# this script is based on the R tutorial of Keres in RStudio

library(zeallot)
library(magrittr)

################################################
# Download the data set and split the data

boston_housing <- keras::dataset_boston_housing()
# boston housing has 506 observations in total. Not a big dataset
# this data has training x y and test x y

c(train_data, train_labels) %<-% boston_housing$train
# %<-% is a function in the packge `zeallot`
# 'label` is the dependent variable y

c(test_data, test_labels) %<-% boston_housing$test






# library(tibble) # a package for data fame
column_names <- c('CRIM', 'ZN', 'INDUS', 'CHAS', 'NOX', 'RM', 'AGE',
                  'DIS', 'RAD', 'TAX', 'PTRATIO', 'B', 'LSTAT')
# give names to the feature dataset

train_df <- tibble::as_tibble(train_data)
colnames(train_df) <- column_names   # Make it a data frame





###################################################
# Model Building

build_model <- function() {
  
  # this is a sequential model that allows the user to add one layer after another
  model <- keras::keras_model_sequential() %>%
    keras::layer_dense(units = 1, activation = "linear")
  
  model %>% keras::compile(
    loss = "mse",
    optimizer = keras::optimizer_sgd(),
    metrics = list("mean_absolute_error")
  )
  
  model
}


# at this step, it is all about the model
# no data is feed yet

model <- build_model()


# There are some pre trained models, but mainly for image classification
# See https://tensorflow.rstudio.com/keras/articles/applications.html
########################################
# Model fitting


# below sends the model to the training data
history <- model %>% keras::fit(
  train_data,
  train_labels,
  epochs = 500,
  verbose = 1,
  validation_split = 0.2
)
# verbose=0 -> Silent when fitting
# epochs = number of epochs to train the model (An epoch is one iteration over the entire input data)


model %>% summary()   # # Show the summary of the model
library(ggplot2)

# the underlying method is "plot.keras_training_history
plot(history, metrics = "mean_absolute_error", smooth = FALSE)#  +  coord_cartesian(ylim = c(0, 5))

########################################
# Prediction and evaluation

test_predictions <- model %>% predict(test_data)
test_predictions
# Predict test data

# the underlying function is  "evalaute.keras.engine.training.model"
test_evaluation= model %>% keras::evaluate(test_data,test_labels)
test_evaluation

# Get the loss and mean absolute error of the model on predicting test data
#########################################
