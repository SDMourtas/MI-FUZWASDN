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
%               Cancer Prediction," (submitted)                     %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

% Choose modeling problem (for x = 1 to 2)
x=1;
[X_train,Y_train,X_test,Y_test,p,fis,Nmax]=problem(x);
[K,M]=size(X_train);

%% Neuronet model Training
tic
[W,Em,A,E]=FUZ_WASD(X_train,Y_train,K,M,p,fis,Nmax); % optimal hidden-layer structure
toc

%% Predict
pred=predictN(X_test,M,W,A,fis); % data prediction

Et=error_pred(pred,Y_test); % Error of test data

%% Figures
[k,ind]=sort(Y_test);

figure
plot(1:length(Y_test),pred(ind),'o','Color',[0.4940 0.1840 0.5560])
hold on
plot(1:length(Y_test),k,'.','Color',[0.4660 0.6740 0.1880],'MarkerSize',12)
xlabel('Test Samples');ylabel('Diagnosis of Breast Tissues')
yticks(0:1);
if x==1
    yticklabels({'M','B'})
else
    yticklabels({'HBT','BTT'})
end
legend('Predicted Diagnosis','Actual Diagnosis')
hold off

figure
semilogy(1:length(E),E,'Color',[0.4660 0.6740 0.1880],...
    'DisplayName','Training Error')
hold on
semilogy(A,E(A),'.','Color',[0.4940 0.1840 0.5560],...
    'MarkerSize',20,'DisplayName','Optimal Powers')
semilogy(find(E==Em),Em,'h','Color',[0.8500 0.3250 0.0980],...
    'MarkerSize',12,'DisplayName','Minimum Point')
xlabel('N');
ylabel('MAE')
legend
hold off