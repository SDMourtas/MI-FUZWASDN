function [X_train,Y_train,X_test,Y_test,p,fis,Nmax]=problem(x)
% Input of the training and testing data for the MI-FUZWASDN model
warning off

if x==1
    filename='data.csv';     % Example 1
    data=readtable(filename,'ReadVariableNames',true,...
        'ReadRowNames' ,true,'TreatAsEmpty' ,'-');
    p=0.8;
    y=data{:,1};  % y: response
    y=double(strcmp(y,'B')); % string conversion to double
    % set rows and columns
    col=2:size(data,2);
    row=1:size(data,1);
    % training-testing data: 50-50%
    train_row=row(1:2:length(row)); 
    test_row=row(2:2:length(row)-1);
    % Input fuzzy controler
    fis = readfis('flc_1');
    Nmax=40; % maximum number of hidden-layer
else
    filename='GSE58606_data.csv';  % Example 2
    T=readtable(filename,'ReadVariableNames',true,...
        'ReadRowNames' ,false,'TreatAsEmpty' ,'-');
    data=T(:,[end-1 1:end-2]);  
    p=0.8;
    y=data{:,1};  % y: response
    % set rows and columns
    col=2:size(data,2);
    row=1:size(data,1);
    % training-testing data: 50-50%
    train_row=row(2:2:length(row)-1);
    test_row=row(1:2:length(row)); 
    % Input fuzzy controler
    fis = readfis('flc_2');
    Nmax=10; % maximum number of hidden-layer
end

X_train=data{train_row,col}; 
Y_train=y(train_row);
X_test=data{test_row,col}; 
Y_test=y(test_row);