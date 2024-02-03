# On AutoML for NYC Taxi Trip Duration Prediction

Simple project to demo AutoML on NYC taxi trip duration prediction.

While explaining [Optuna](https://optuna.org/) to a client in the context of hyperparameter tuning, and performing more research on the topic,
I came across [AutoGluon](https://auto.gluon.ai/stable/index.html) to perform "[AutoML](https://www.automl.org/automl/) for images, text, and tabular data".
After a quick scan of the documentation, I decided to give it a try and see how it performs on a simple project.

I always loved the Kaggle competition [NYC Taxi Trip Duration](https://www.kaggle.com/c/nyc-taxi-trip-duration), as the data has spatial, temporal
and other traditional attribute information, and is a great dataset to test various models and feature engineering techniques.

I used a local [Apache Spark](https://spark.apache.org/) instance (as it is my go to ETL engine) to perform some feature engineering before letting AutoGluon do its magic.
As a quick proof of concept, the results are quite impressive, and below are the steps to reproduce the project and visualize the result.

## Setup and Usage
### Clone the Repository
```
git clone https://github.com/mraad/auto_ml_nyc.git
```
### Install Required Packages
```
cd auto_ml_nyc
conda env create
conda activate auto_ml_nyc
```
### Data and Server
- Download the [train.csv](https://www.kaggle.com/c/nyc-taxi-trip-duration/data) file from Kaggle and place it in the same folder as this project, so it can be locally referenced.
- Download [Apache Spark 3.4.2](https://spark.apache.org/downloads.html). In my case, I placed the unzipped folder in my home folder. 

### Start a local Spark instance and jupyter lab instance
```
./auto_ml_nyc.sh
```

### Run the notebook
- In your browser, navigate to http://localhost:8989/lab
- Load and run the `auto_ml_nyc.ipynb` notebook.

Happy AutoMLing, and ff you find this project informative, consider giving it a ⭐ on GitHub!

### References

- https://developer.nvidia.com/blog/three-approaches-to-encoding-time-information-as-features-for-ml-models/
- https://towardsdatascience.com/cyclical-features-encoding-its-about-time-ce23581845ca
- https://feature-engine.trainindata.com/en/latest/index.html
- https://nalepae.github.io/pandarallel/