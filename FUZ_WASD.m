function [W,Em,A,E]=FUZ_WASD(X,Y,K,M,p,fis,Nmax)
% function for finding the optimal hidden-layer neurons weights of the
% neuronet

for i=1:M
X(:,i)=evalfis(fis,X(:,i));
end
Y(Y==1)=-0.25; % corresponds to 'B', 'BTT'
Y(Y==0)=-0.5;  % corresponds to 'M', 'HBT'

% Initialization
A=[]; % the neurons number of the hidden layer (i.e., hidneurons)
Em=inf; E=zeros(Nmax,1);
K1=round(p*K); % size of data fitting
K2=K-K1; % size of data validation

for r=1:Nmax
% WDD Method
Q=Qmatrix(X,M,K,[A;r]);
W=pinv(Q(1:K1,:))*Y(1:K1); 
E(r)=1/K2*sum(abs(Q(K1+1:K,:)*W-Y(K1+1:K))); % MAE
if E(r)<Em
    Em=E(r);A=[A;r];
end
end

% output
Q=Qmatrix(X,M,K,A);
W=pinv(Q)*Y; 