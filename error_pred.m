function E=error_pred(X,Y)

R=X-Y;
E=1/length(R)*sum(abs(R)); % MAE
fprintf('The test data MAE is: %f \n',E)