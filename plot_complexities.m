%% plot Rademacher complexity
% Load data


comp=NaN(4,30);
n=[ 50 100 200 500];

for i=1:4
    filename= ['complexity_n' num2str(n(i)) '.txt'];
    comp(i,:)=load(filename);
    i=i+1;
end

%% plot

close(figure(1))
f1=figure(1);
mark={'--*' '--+' '--.' '--<'};
for i=1:4
    plot(1:30,comp(i,:),mark{i},'DisplayName',num2str(n(i)),'Color','k')
    hold on
end
xlabel('Polynomial degree')
ylabel('Rademacher complexity')
set(gca,'FontSize',12)

grid on;
l=legend('show');
l.Location='NorthWest';

%% print

opt_print=0;
if opt_print
    f1.PaperPositionMode='auto';
    f1.Renderer='Painter';
    print -f1 -dpng -r300 complexities.png
end