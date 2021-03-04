function Q=Qmatrix(Xz,M,K,A)
% function for calculating the matrix Q

d=length(A);
Q=zeros(K,M*d); 
for i=1:d    
    r=exp(Xz.^(A(i)-1));
    Q(:,M*(i-1)+1:M*i)=log(1+r); % power softplus activation function
end