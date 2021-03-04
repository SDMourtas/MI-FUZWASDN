function Y=predictN(X,M,W,A,fis)
% function for predicting

for i=1:M
X(:,i)=evalfis(fis,X(:,i));
end

Q=Qmatrix(X,M,size(X,1),A);
Y=Q*W; 

Y(Y>=-0.375)=1; % corresponds to 'B', 'BTT'
Y(Y<-0.375)=0;  % corresponds to 'M', 'HBT'