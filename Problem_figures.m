function Problem_figures(pred,Y_test,E,Em,A,x,y)
[k,ind]=sort(Y_test);
k_pr=pred(ind);
k_def=find(k==1);

figure
b1=k_def(1)-1;      % actual false, "0"
b3=sum(k_pr(1:b1)); % predicted true, "1", in comparison with the actual false
b2=b1-b3;           % predicted false, "0", in comparison with the actual false
b4=sum(k);          % actual true, "1"
b5=sum(k_pr(b1+1:end)); % predicted true, "1", in comparison with the actual true
b6=b4-b5;           % predicted false, "0", in comparison with the actual true
b=[b1 b2 b3;b4 b5 b6];
Bar=bar([1 2],b);
ctr=zeros(3,2);ydt=ctr;
for i = 1:3
    ctr(i,:)=bsxfun(@plus, Bar(i).XData, Bar(i).XOffset'); 
    ydt(i,:)=Bar(i).YData;                                  
end
for i=1:2
    text(ctr(:,i),ydt(:,i),sprintfc('%d',ydt(:,i)),...
        'horiz','center', 'vert','bottom')
end
set(Bar(1),'FaceColor',[0.4940 0.1840 0.5560]) ;
set(Bar(2),'FaceColor',[0.4660 0.6740 0.1880]) ;
set(Bar(3),'FaceColor',[0.8500 0.3250 0.0980]) ;
box on
ylabel('Test Samples')
xlabel('Diagnosis of Breast Tissues')
if x==1
    xticklabels({'M','B'})
else
    xticklabels({'HBT','BTT'})
end
legend('Actual Diagnosis','Correct Predicted Diagnosis','Incorrect Predicted Diagnosis')

if y==1
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
end