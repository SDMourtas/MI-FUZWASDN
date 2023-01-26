# Multi-Input FUZWASD Neuronet
Implementation of a fast 5-layer feed-forward neuronet model for classification that was trained using a fuzzy WASD (weights-and-structure-determination) algorithm called FUZWASD.\
The purpose of this package is to predict whether the breast cancer is benign or malignant. By considering this problem's approach through neuronet and by using the weight direct determination (WDD) method, the FUZWASD algorithm uses a fuzzy logic controller (FLC) to map the input data into a specific interval that enhances the accuracy of the WDD method. In this way, the FUZWASD algorithm detects the optimal weights and structure of the multi-input FUZWASD neuronet (MI-FUZWASDN) using a power softplus activation function and while handling the model fitting and validation.\
The main articles used are the followings:
*	T.E. Simos, V.N.Katsikis, S.D.Mourtas, "A Fuzzy WASD Neuronet with Application in Breast Cancer Prediction," Neural Computing and Applications, 34, 3019–3031 (2021)

Also, the kit includes the following two datasets:
*	Wisconsin diagnostic breast cancer (WDBC), taken from https://www.kaggle.com/uciml/breast-cancer-wisconsin-data
*	Tumor microRNA breast cancer detection (TmiRNABCD), taken from https://www.kaggle.com/rhostam/primary-breast-cancer-vs-normal-breast-tissue

# M-files Description
*	Main_MI_FUZWASDN.m: the main function
*	problem.m: input data and parameters of the MI-FUZWASDN
*	problem_figures.m: figures illustrating the problem's findings
*	FUZWASD.m: function for finding the optimal number of hidden-layer neurons, along with the optimal activation function power at each hidden-layer neuron
*	Qmatrix.m: function for calculating the matrix Q
*	predictN.m: function for predicting
*	error_pred.m: function for calculating the mean absolute error (MAE) of the prediction
*	flc_1.fis: fuzzy logic controller for the WDBC dataset
*	flc_2.fis: fuzzy logic controller for the TmiRNABCD dataset
*	trainedmodel1.mat: trained neural network model under linear SVM method for the WDBC dataset
*	trainedmodel2.mat: trained neural network model under fine KNN method for the WDBC dataset
*	trainedmodel3.mat: trained neural network model under linear SVM method for the TmiRNABCD dataset
*	trainedmodel4.mat: trained neural network model under fine KNN method for the TmiRNABCD dataset

# Installation
*	Unzip the file you just downloaded and copy the MI-FUZWASDN directory to a location,e.g.,/my-directory/
*	Run Matlab/ Octave, Go to /my-directory/MI-FUZWASDN/ at the command prompt
*	run 'Main_MI_FUZWASDN (Matlab/Octave)

# Results
After running the 'Main_MI_FUZWASDN.m file, the package outputs are the following:
*	The optimal number of hidden-layer neurons.
*	The optimal activation function power of each hidden-layer neuron.
*	The prediction and MAE of the testing samples.
*	The graphic illustration of the testing and predicting performance.

# Environment
The MI-FUZWASDN kit has been tested in Matlab 2018b on OS: Windows 10 64-bit.
