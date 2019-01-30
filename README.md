# PhenoTip.PrePredictor
<b>PhenoTip</b> is component that will give predictions of computational weights of each micro model of Huxley model using machine learning techniques.
This repo contains R scripts that will be used as first step before training ML model and predicting. R scripts use different machine learning techniques for preforming feature selection, calculating training set size and finding appropriate machine learning model that will be used in predictions. 
<hr/>
Project contains 4 folders:
<ol>
  <li>input files - files that contain data for training and testing machine learning models</li>
  <li>data set size - R scripts to test each model for different set sizes</li>
  <li>feature selection - R scripts to analyze features and select best ones</li>
  <li>predictions - R scripts to analyze predictions for each ML model</li>
</ol>

Enviroment used in this analysis:
R version: 3.3.1
Platform: x86_64-pc-linux-gnu (64-bit)

R packages used in this analysis:
<ul>
  <li>class</li>
  <li>randomForest</li>
  <li>Metrics</li>
  <li>neuralnet</li>
  <li>caret</li>
  <li>FSelector</li>
</ul>
