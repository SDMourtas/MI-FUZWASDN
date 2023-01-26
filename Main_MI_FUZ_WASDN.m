%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  A 5-layer feed-forward neuronet model, trained by a FUZWASD      %
%  algorithm. (version 1.0 )                                        %
%                                                                   %
%  Developed in MATLAB R2018b                                       %
%                                                                   %
%  Author and programmer: T.E. Simos, V.N.Katsikis, S.D.Mourtas     %
%                                                                   %
%   e-Mail: tsimos.conf@gmail.com                                   %
%           vaskatsikis@econ.uoa.gr                                 %
%           spirosmourtas@gmail.com                                 %
%                                                                   %
%   Main paper: T.E. Simos, S.D.Mourtas, V.N.Katsikis,              %
%               "A Fuzzy WASD Neuronet with Application in Breast   %
%               Cancer Prediction," Neural Computing and            %
%               Applications, 34, 3019–3031 (2021)                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

% Choose modeling problem (for x = 1 to 2)
x=1;
% Choose between Fuzzy WASD algorithm (y=1), 
% linear SVM (y=2) and fine KNN (y=3)
y=1;
[X_train,Y_train,X_test,Y_test,p,fis,Nmax]=problem(x);
[K,M]=size(X_train);

%% Neuronet model Training

if y==1
tic
[W,Em,A,E]=FUZ_WASD(X_train,Y_train,K,M,p,fis,Nmax); % optimal hidden-layer structure
toc
else
if y==2 && x==1
load('trainedmodel1.mat')
elseif y==3 && x==1
load('trainedmodel2.mat')
elseif y==2 && x==2
load('trainedmodel3.mat')
elseif y==3 && x==2
load('trainedmodel4.mat')
end
end

%% Predict
if y==1
pred=predictN(X_test,M,W,A,fis); % data prediction
else
pred = trainedModel.predictFcn(X_test);
E=[];Em=[];A=[];
end

Et=error_pred(pred,Y_test); % Error of test data

%% Figures

Problem_figures(pred,Y_test,E,Em,A,x,y)
