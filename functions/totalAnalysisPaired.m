%% reset
clear;
%% calculate means of needed time until 90 % of food is eaten for social and asocial worms and plot results

%load data and save variables
load('time1gamma0.mat')
time1gamma0 = TimeAllEaten;
load('time1gamma1.mat')
time1gamma1 = TimeAllEaten;
load('time1gamma2.mat')
time1gamma2 = TimeAllEaten;
load('time1gamma3.mat')
time1gamma3 = TimeAllEaten;

load('time2gamma0.mat')
time2gamma0 = TimeAllEaten2;
load('time2gamma1.mat')
time2gamma1 = TimeAllEaten2;
load('time2gamma2.mat')
time2gamma2 = TimeAllEaten2;
load('time2gamma3.mat')
time2gamma3 = TimeAllEaten2;

%calculate mean and confidence interval 
means1(1) = mean(time1gamma0);
means1(2) = mean(time1gamma1);
means1(3) = mean(time1gamma2);
means1(4) = mean(time1gamma3);

medians1(1) = median(time1gamma0);
medians1(2) = median(time1gamma1);
medians1(3) = median(time1gamma2);
medians1(4) = median(time1gamma3);

std1(1) = std(time1gamma0);
std1(2) = std(time1gamma1);
std1(3) = std(time1gamma2);
std1(4) = std(time1gamma3);

CI1(1) = 1.96*(std(time1gamma0)/sqrt(length(time1gamma0)));
CI1(2) = 1.96*(std(time1gamma1)/sqrt(length(time1gamma1)));
CI1(3) = 1.96*(std(time1gamma2)/sqrt(length(time1gamma2)));
CI1(4) = 1.96*(std(time1gamma3)/sqrt(length(time1gamma3)));

means2(1) = mean(time2gamma0);
means2(2) = mean(time2gamma1);
means2(3) = mean(time2gamma2);
means2(4) = mean(time2gamma3);

medians2(1) = median(time2gamma0);
medians2(2) = median(time2gamma1);
medians2(3) = median(time2gamma2);
medians2(4) = median(time2gamma3);

std2(1) = std(time2gamma0);
std2(2) = std(time2gamma1);
std2(3) = std(time2gamma2);
std2(4) = std(time2gamma3);

CI2(1) = 1.96*(std(time2gamma0)/sqrt(length(time2gamma0)));
CI2(2) = 1.96*(std(time2gamma1)/sqrt(length(time2gamma1)));
CI2(3) = 1.96*(std(time2gamma2)/sqrt(length(time2gamma2)));
CI2(4) = 1.96*(std(time2gamma3)/sqrt(length(time2gamma3)));

% plot means with error bars
figure('pos',[0 0 1240 1748]);
x = 0:3;
p = plot(x,means1,'--ob');
hold on
p2 = plot(x,means2,'--or');
p.LineWidth = 3;
p.MarkerSize = 26;
p.MarkerFaceColor = 'b';
p2.LineWidth = 3;
p2.MarkerSize = 26;
p2.MarkerFaceColor = 'r';
lgd = legend('social worms','solitary worms');
lgd.FontSize = 34;
xticks(x)
axis([0 3 0 1800])
set(gca,'FontSize',42)
ax = gca;
ax.LineWidth = 5;
xlabel('degree of food clustering determined by \gamma')
ylabel('mean time steps')
box off

%plot medians
figure;
x = 0:3;
plot(x,medians1,'-ok',x,medians2,'-or')
legend('social worms','solitary worms')
xticks(x)
title('Medians of time steps needed to eat 90% of food')
xlabel('gamma')
xlabel('median of time steps needed')

%% analyse the food pieces eaten by worms individually and calculate the basic statistics

% calculate the sum of food pieces eaten by every worm per simulation
load('food1gamma0.mat')
targets1gamma0 = targetsEaten;
targetsWorm1gamma0 = zeros(40,1,500);
targEff1gamma0 = zeros(40,1,500);

for ii = 1:500
    summedTargets = sum(targets1gamma0(:,1:time1gamma0(ii),ii),2);
    targEff = sum(targets1gamma0(:,2:time1gamma0(ii),ii),2);
    targetsWorm1gamma0(:,:,ii) = summedTargets;
    targEff1gamma0(:,:,ii) = targEff;
end
targetsWorm1gamma0 = reshape(targetsWorm1gamma0,[40*500,1]);
targEff1gamma0 = reshape(targEff1gamma0,[40*500,1]);


%social worms gamma 1
load('food1gamma1.mat')
targets1gamma1 = targetsEaten;
targetsWorm1gamma1 = zeros(40,1,500);
targEff1gamma1 = zeros(40,1,500);

for ii = 1:500
    summedTargets = sum(targets1gamma1(:,1:time1gamma1(ii),ii),2);
    targEff = sum(targets1gamma1(:,2:time1gamma1(ii),ii),2);
    targetsWorm1gamma1(:,:,ii) = summedTargets;
    targEff1gamma1(:,:,ii) = targEff;
end
targetsWorm1gamma1 = reshape(targetsWorm1gamma1,[40*500,1]);
targEff1gamma1 = reshape(targEff1gamma1,[40*500,1]);

%social worms gamma2
load('food1gamma2.mat')
targets1gamma2 = targetsEaten;
targetsWorm1gamma2 = zeros(40,1,500);
targEff1gamma2 = zeros(40,1,500);

for ii = 1:500
    summedTargets = sum(targets1gamma2(:,1:time1gamma2(ii),ii),2);
    targEff = sum(targets1gamma2(:,2:time1gamma2(ii),ii),2);
    targetsWorm1gamma2(:,:,ii) = summedTargets;
    targEff1gamma2(:,:,ii) = targEff;
end
targetsWorm1gamma2 = reshape(targetsWorm1gamma2,[40*500,1]);
targEff1gamma2 = reshape(targEff1gamma2,[40*500,1]);


%social worms gamma3
load('food1gamma3.mat')
targets1gamma3 = targetsEaten;
targetsWorm1gamma3 = zeros(40,1,500);
targEff1gamma3 = zeros(40,1,500);

for ii = 1:500
    summedTargets = sum(targets1gamma3(:,1:time1gamma3(ii),ii),2);
    targEff = sum(targets1gamma3(:,2:time1gamma3(ii),ii),2);
    targetsWorm1gamma3(:,:,ii) = summedTargets;
    targEff1gamma3(:,:,ii) = targEff;
end
targetsWorm1gamma3 = reshape(targetsWorm1gamma3,[40*500,1]);
targEff1gamma3 = reshape(targEff1gamma3,[40*500,1]);


%solitary worms gamma0
load('food2gamma0.mat')
targets2gamma0 = targetsEaten2;
targetsWorm2gamma0 = zeros(40,1,500);
targEff2gamma0 = zeros(40,1,500);

for ii = 1:500
    summedTargets = sum(targets2gamma0(:,1:time2gamma0(ii),ii),2);
    targEff = sum(targets2gamma0(:,2:time2gamma0(ii),ii),2);
    targetsWorm2gamma0(:,:,ii) = summedTargets;
    targEff2gamma0(:,:,ii) = targEff;
end
targetsWorm2gamma0 = reshape(targetsWorm2gamma0,[40*500,1]);
targEff2gamma0 = reshape(targEff2gamma0,[40*500,1]);


%solitary worms gamma1
load('food2gamma1.mat')
targets2gamma1 = targetsEaten2;
targetsWorm2gamma1 = zeros(40,1,500);
targEff2gamma1 = zeros(40,1,500);

for ii = 1:500
    summedTargets = sum(targets2gamma1(:,1:time2gamma1(ii),ii),2);
    targEff = sum(targets2gamma1(:,2:time2gamma1(ii),ii),2);
    targetsWorm2gamma1(:,:,ii) = summedTargets;
    targEff2gamma1(:,:,ii) = targEff;
end
targetsWorm2gamma1 = reshape(targetsWorm2gamma1,[40*500,1]);
targEff2gamma1 = reshape(targEff2gamma1,[40*500,1]);


%solitary worms gamma2
load('food2gamma2.mat')
targets2gamma2 = targetsEaten2;
targetsWorm2gamma2 = zeros(40,1,500);
targEff2gamma2 = zeros(40,1,500);

for ii = 1:500
    summedTargets = sum(targets2gamma2(:,1:time2gamma2(ii),ii),2);
    targEff = sum(targets2gamma2(:,2:time2gamma2(ii),ii),2);
    targetsWorm2gamma2(:,:,ii) = summedTargets;
    targEff2gamma2(:,:,ii) = targEff;
end
targetsWorm2gamma2 = reshape(targetsWorm2gamma2,[40*500,1]);
targEff2gamma2 = reshape(targEff2gamma2,[40*500,1]);


%solitary worms gamma3 
load('food2gamma3.mat')
targets2gamma3 = targetsEaten2;
targetsWorm2gamma3 = zeros(40,1,500);
targEff2gamma3 = zeros(40,1,500);

for ii = 1:500
    summedTargets = sum(targets2gamma3(:,1:time2gamma3(ii),ii),2);
    targEff = sum(targets2gamma3(:,2:time2gamma3(ii),ii),2);
    targetsWorm2gamma3(:,:,ii) = summedTargets;
    targEff2gamma3(:,:,ii) = targEff;
end
targetsWorm2gamma3 = reshape(targetsWorm2gamma3,[40*500,1]);
targEff2gamma3 = reshape(targEff2gamma3,[40*500,1]);

%% plot histograms for eaten targets

edges = 0:10:800;

%plot normalized combined histogram for social worms
H1_0 = histogram(targetsWorm1gamma0,'BinEdges',edges,'Normalization','probability');
values1_0 = H1_0.Values;
H1_1 = histogram(targetsWorm1gamma1,'BinEdges',edges,'Normalization','probability');
values1_1 = H1_1.Values;
H1_2 = histogram(targetsWorm1gamma2,'BinEdges',edges,'Normalization','probability');
values1_2 = H1_2.Values;
H1_3 = histogram(targetsWorm1gamma3,'BinEdges',edges,'Normalization','probability');
values1_3 = H1_3.Values;

%plot only lines of histogram
figure('pos',[0 0 1240 1748]);
values1_0(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = edges(nn):edges(nn+1);
    y = ones(1,11).*values1_0(nn);
    p1_0 = plot(x,y,'r');
    p1_0.LineWidth = 5;
    l = line([edges(nn+1) edges(nn+1)],[values1_0(nn) values1_0(nn+1)],'Color','r','LineWidth',5);
end

l2 = line([edges(1) edges(1)],[0 values1_0(1)],'Color','r','LineWidth',5);


values1_1(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = edges(nn):edges(nn+1);
    y = ones(1,11).*values1_1(nn);
    p1_1 = plot(x,y,'k');
    p1_1.LineWidth = 5;
    l = line([edges(nn+1) edges(nn+1)],[values1_1(nn) values1_1(nn+1)],'Color','k','LineWidth',5);
end
l2 = line([edges(1) edges(1)],[0 values1_1(1)],'Color','k','LineWidth',5);



values1_2(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = edges(nn):edges(nn+1);
    y = ones(1,11).*values1_2(nn);
    p1_2 = plot(x,y,'b');
    p1_2.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values1_2(nn) values1_2(nn+1)],'Color','b','LineWidth',5);
  
end

l2 = line([edges(1) edges(1)],[0 values1_2(1)],'Color','b','LineWidth',5);


values1_3(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = edges(nn):edges(nn+1);
    y = ones(1,11).*values1_3(nn);
    p1_3 = plot(x,y,'g');
    p1_3.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values1_3(nn) values1_3(nn+1)],'Color','g','LineWidth',5);
    
end

l2 = line([edges(1) edges(1)],[0 values1_3(1)],'Color','g','LineWidth',5);


p1_0legend = plot(0:10,ones(1,11).*values1_0(1),'r');
p1_1legend = plot(0:10,ones(1,11).*values1_1(1),'k');
p1_2legend = plot(0:10,ones(1,11).*values1_2(1),'b');
p1_3legend = plot(0:10,ones(1,11).*values1_3(1),'g');

[lgd,hobj] = legend([p1_0legend p1_1legend p1_2legend p1_3legend],{'\gamma = 0','\gamma = 1',...
    '\gamma = 2','\gamma = 3'});
hL = findobj(hobj,'type','line');  % get the lines, not text
set(hL,'linewidth',6) 
set(lgd,'FontSize',70)
hT = findobj(hobj,'type','text');
set(hT,'FontSize',34)
ax = gca;
ax.FontSize = 42;
ax.LineWidth = 5; 
ylim([0 0.30])
ylabel('relative frequency')
xlabel('individually eaten food units')

%% plot same for solitary worms 
%plot normalized combined histogram for social worms
H2_0 = histogram(targetsWorm2gamma0,'BinEdges',edges,'Normalization','probability');
values2_0 = H2_0.Values;
H2_1 = histogram(targetsWorm2gamma1,'BinEdges',edges,'Normalization','probability');
values2_1 = H2_1.Values;
H2_2 = histogram(targetsWorm2gamma2,'BinEdges',edges,'Normalization','probability');
values2_2 = H2_2.Values;
H2_3 = histogram(targetsWorm2gamma3,'BinEdges',edges,'Normalization','probability');
values2_3 = H2_3.Values;

%plot only lines of histogram
figure('pos',[0 0 1240 1748]);
values2_0(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = edges(nn):edges(nn+1);
    y = ones(1,11).*values2_0(nn);
    p2_0 = plot(x,y,'r');
    p2_0.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values2_0(nn) values2_0(nn+1)],'Color','r','LineWidth',5);
   
end

l2 = line([edges(1) edges(1)],[0 values2_0(1)],'Color','r','LineWidth',5);


values2_1(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = edges(nn):edges(nn+1);
    y = ones(1,11).*values2_1(nn);
    p2_1 = plot(x,y,'k');
    p2_1.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values2_1(nn) values2_1(nn+1)],'Color','k','LineWidth',5);
    
end

l2 = line([edges(1) edges(1)],[0 values2_1(1)],'Color','k','LineWidth',5);


values2_2(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = edges(nn):edges(nn+1);
    y = ones(1,11).*values2_2(nn);
    p2_2 = plot(x,y,'b');
    p2_2.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values2_2(nn) values2_2(nn+1)],'Color','b','LineWidth',5);
 
end

l2 = line([edges(1) edges(1)],[0 values2_2(1)],'Color','b','LineWidth',5);


values2_3(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = edges(nn):edges(nn+1);
    y = ones(1,11).*values2_3(nn);
    p2_3 = plot(x,y,'g');
    p2_3.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values2_3(nn) values2_3(nn+1)],'Color','g','LineWidth',5);
    
end

l2 = line([edges(1) edges(1)],[0 values2_3(1)],'Color','g','LineWidth',5);


p2_0legend = plot(0:10,ones(1,11).*values2_0(1),'r');
p2_1legend = plot(0:10,ones(1,11).*values2_1(1),'k');
p2_2legend = plot(0:10,ones(1,11).*values2_2(1),'b');
p2_3legend = plot(0:10,ones(1,11).*values2_3(1),'g');

[lgd,hobj] = legend([p2_0legend p2_1legend p2_2legend p2_3legend],{'\gamma = 0','\gamma = 1',...
    '\gamma = 2','\gamma = 3'});
hL = findobj(hobj,'type','line');  % get the lines, not text
set(hL,'linewidth',6) 
set(lgd,'FontSize',70)
hT = findobj(hobj,'type','text');
set(hT,'FontSize',34)
ax = gca;
ax.FontSize = 42;
ax.LineWidth = 5; 
ylim([0 0.30])
ylabel('relative frequency')
xlabel('individually eaten food units')
%% calculate efficiencies 

% upload steps and sum them up 

%social and gamma0
load('steps1gamma0.mat')
steps1gamma0 = allSteps;
stepsWorm1gamma0 = zeros(40,1,500);
for ii = 1:500
    summedSteps = sum(steps1gamma0(:,1:time1gamma0(ii)-1,ii),2);
    stepsWorm1gamma0(:,:,ii) = summedSteps;
end
stepsWorm1gamma0 = reshape(stepsWorm1gamma0,[40*500,1]);

%social and gamma1
load('steps1gamma1.mat')
steps1gamma1 = allSteps;
stepsWorm1gamma1 = zeros(40,1,500);
for ii = 1:500
    summedSteps = sum(steps1gamma1(:,1:time1gamma1(ii)-1,ii),2);
    stepsWorm1gamma1(:,:,ii) = summedSteps;
end
stepsWorm1gamma1 = reshape(stepsWorm1gamma1,[40*500,1]);

%social and gamma2
load('steps1gamma2.mat')
steps1gamma2 = allSteps;
stepsWorm1gamma2 = zeros(40,1,500);
for ii = 1:500
    summedSteps = sum(steps1gamma2(:,1:time1gamma2(ii)-1,ii),2);
    stepsWorm1gamma2(:,:,ii) = summedSteps;
end
stepsWorm1gamma2 = reshape(stepsWorm1gamma2,[40*500,1]);

%social and gamma3 
load('steps1gamma3.mat')
steps1gamma3 = allSteps;
stepsWorm1gamma3 = zeros(40,1,500);
for ii = 1:500
    summedSteps = sum(steps1gamma3(:,1:time1gamma3(ii)-1,ii),2);
    stepsWorm1gamma3(:,:,ii) = summedSteps;
end
stepsWorm1gamma3 = reshape(stepsWorm1gamma3,[40*500,1]);

%solitary and gamma0
load('steps2gamma0.mat')
steps2gamma0 = allSteps2;
stepsWorm2gamma0 = zeros(40,1,500);
for ii = 1:500
    summedSteps = sum(steps2gamma0(:,1:time2gamma0(ii)-1,ii),2);
    stepsWorm2gamma0(:,:,ii) = summedSteps;
end
stepsWorm2gamma0 = reshape(stepsWorm2gamma0,[40*500,1]);

%solitary and gamma1
load('steps2gamma1.mat')
steps2gamma1 = allSteps2;
stepsWorm2gamma1 = zeros(40,1,500);
for ii = 1:500
    summedSteps = sum(steps2gamma1(:,1:time2gamma1(ii)-1,ii),2);
    stepsWorm2gamma1(:,:,ii) = summedSteps;
end
stepsWorm2gamma1 = reshape(stepsWorm2gamma1,[40*500,1]);

%solitary and gamma2
load('steps2gamma2.mat')
steps2gamma2 = allSteps2;
stepsWorm2gamma2 = zeros(40,1,500);
for ii = 1:500
    summedSteps = sum(steps2gamma2(:,1:time2gamma2(ii)-1,ii),2);
    stepsWorm2gamma2(:,:,ii) = summedSteps;
end
stepsWorm2gamma2 = reshape(stepsWorm2gamma2,[40*500,1]);

%solitary and gamma3
load('steps2gamma3.mat')
steps2gamma3 = allSteps2;
stepsWorm2gamma3 = zeros(40,1,500);
for ii = 1:500
    summedSteps = sum(steps2gamma3(:,1:time2gamma3(ii)-1,ii),2);
    stepsWorm2gamma3(:,:,ii) = summedSteps;
end
stepsWorm2gamma3 = reshape(stepsWorm2gamma3,[40*500,1]);

%compute the efficiency 
efficiency1gamma0 = targEff1gamma0./stepsWorm1gamma0;
efficiency1gamma1 = targEff1gamma1./stepsWorm1gamma1;
efficiency1gamma2 = targEff1gamma2./stepsWorm1gamma2;
efficiency1gamma3 = targEff1gamma3./stepsWorm1gamma3;
efficiency2gamma0 = targEff2gamma0./stepsWorm2gamma0;
efficiency2gamma1 = targEff2gamma1./stepsWorm2gamma1;
efficiency2gamma2 = targEff2gamma2./stepsWorm2gamma2;
efficiency2gamma3 = targEff2gamma3./stepsWorm2gamma3;

%calculate interquartil ranges of efficiency
iqr1(1) = iqr(efficiency1gamma0);
iqr1(2) = iqr(efficiency1gamma1);
iqr1(3) = iqr(efficiency1gamma2);
iqr1(4) = iqr(efficiency1gamma3);
iqr2(1) = iqr(efficiency2gamma0);
iqr2(2) = iqr(efficiency2gamma1);
iqr2(3) = iqr(efficiency2gamma2);
iqr2(4) = iqr(efficiency2gamma3);

%% plot histograms of social animals for efficiencies
edges = 0:0.01:1;
%plot normalized combined histogram for social worms
E1_0 = histogram(efficiency1gamma0,'BinEdges',edges,'Normalization','probability');
values1_0 = E1_0.Values;
E1_1 = histogram(efficiency1gamma1,'BinEdges',edges,'Normalization','probability');
values1_1 = E1_1.Values;
E1_2 = histogram(efficiency1gamma2,'BinEdges',edges,'Normalization','probability');
values1_2 = E1_2.Values;
E1_3 = histogram(efficiency1gamma3,'BinEdges',edges,'Normalization','probability');
values1_3 = E1_3.Values;

%plot only lines of histogram
figure('pos',[0 0 1240 1748]);
values1_0(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = [edges(nn) edges(nn+1)];
    y = ones(1,2).*values1_0(nn);
    p1_0 = plot(x,y,'r');
    p1_0.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values1_0(nn) values1_0(nn+1)],'Color','r','LineWidth',5);
    
end

l2 = line([edges(1) edges(1)],[0 values1_0(1)],'Color','r','LineWidth',5);


values1_1(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = [edges(nn) edges(nn+1)];
    y = ones(1,2).*values1_1(nn);
    p1_1 = plot(x,y,'k');
    p1_1.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values1_1(nn) values1_1(nn+1)],'Color','k','LineWidth',5);
   
end

l2 = line([edges(1) edges(1)],[0 values1_1(1)],'Color','k','LineWidth',5);


values1_2(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = [edges(nn) edges(nn+1)];
    y = ones(1,2).*values1_2(nn);
    p1_2 = plot(x,y,'b');
    p1_2.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values1_2(nn) values1_2(nn+1)],'Color','b','LineWidth',5);
   
end

l2 = line([edges(1) edges(1)],[0 values1_2(1)],'Color','b','LineWidth',5);


values1_3(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = [edges(nn) edges(nn+1)];
    y = ones(1,2).*values1_3(nn);
    p1_3 = plot(x,y,'g');
    p1_3.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values1_3(nn) values1_3(nn+1)],'Color','g','LineWidth',5);
   
end

l2 = line([edges(1) edges(1)],[0 values1_3(1)],'Color','g','LineWidth',5);


p1_0legend = plot([0 0.01],ones(1,2).*values1_0(1),'r');
p1_1legend = plot([0 0.01],ones(1,2).*values1_1(1),'k');
p1_2legend = plot([0 0.01],ones(1,2).*values1_2(1),'b');
p1_3legend = plot([0 0.01],ones(1,2).*values1_3(1),'g');

[lgd,hobj] = legend([p1_0legend p1_1legend p1_2legend p1_3legend],{'\gamma = 0','\gamma = 1',...
    '\gamma = 2','\gamma = 3'});
hL = findobj(hobj,'type','line');  % get the lines, not text
set(hL,'linewidth',6) 
set(lgd,'FontSize',70)
hT = findobj(hobj,'type','text');
set(hT,'FontSize',34)
ax = gca;
ax.FontSize = 42;
ax.LineWidth = 5; 
ylim([0 0.13])
ylabel('relative frequency')
xlabel('individual foraging efficiency')
%% plot efficiency histos of solitary worms 
%plot normalized combined histogram for social worms
H2_0 = histogram(efficiency2gamma0,'BinEdges',edges,'Normalization','probability');
values2_0 = H2_0.Values;
H2_1 = histogram(efficiency2gamma1,'BinEdges',edges,'Normalization','probability');
values2_1 = H2_1.Values;
H2_2 = histogram(efficiency2gamma2,'BinEdges',edges,'Normalization','probability');
values2_2 = H2_2.Values;
H2_3 = histogram(efficiency2gamma3,'BinEdges',edges,'Normalization','probability');
values2_3 = H2_3.Values;

%plot only lines of histogram
figure('pos',[0 0 1240 1748]);
values2_0(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = [edges(nn) edges(nn+1)];
    y = ones(1,2).*values2_0(nn);
    p2_0 = plot(x,y,'r');
    p2_0.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values2_0(nn) values2_0(nn+1)],'Color','r','LineWidth',5);
    
end

l2 = line([edges(1) edges(1)],[0 values2_0(1)],'Color','r','LineWidth',5);


values2_1(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = [edges(nn) edges(nn+1)];
    y = ones(1,2).*values2_1(nn);
    p2_1 = plot(x,y,'k');
    p2_1.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values2_1(nn) values2_1(nn+1)],'Color','k','LineWidth',5);
    
end

l2 = line([edges(1) edges(1)],[0 values2_1(1)],'Color','k','LineWidth',5);


values2_2(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = [edges(nn) edges(nn+1)];
    y = ones(1,2).*values2_2(nn);
    p2_2 = plot(x,y,'b');
    p2_2.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values2_2(nn) values2_2(nn+1)],'Color','b','LineWidth',5);
    
end

l2 = line([edges(1) edges(1)],[0 values2_2(1)],'Color','b','LineWidth',5);


values2_3(end+1) = 0;
for nn = 1:length(edges)-1
    hold on
    x = [edges(nn) edges(nn+1)];
    y = ones(1,2).*values2_3(nn);
    p2_3 = plot(x,y,'g');
    p2_3.LineWidth = 2.5;
    l = line([edges(nn+1) edges(nn+1)],[values2_3(nn) values2_3(nn+1)],'Color','g','LineWidth',5);
   
end

l2 = line([edges(1) edges(1)],[0 values2_3(1)],'Color','g','LineWidth',5);


p2_0legend = plot([0 0.01],ones(1,2).*values2_0(1),'r');
p2_1legend = plot([0 0.01],ones(1,2).*values2_1(1),'k');
p2_2legend = plot([0 0.01],ones(1,2).*values2_2(1),'b');
p2_3legend = plot([0 0.01],ones(1,2).*values2_3(1),'g');

[lgd,hobj] = legend([p2_0legend p2_1legend p2_2legend p2_3legend],{'\gamma = 0','\gamma = 1',...
    '\gamma = 2','\gamma = 3'});
hL = findobj(hobj,'type','line');  % get the lines, not text
set(hL,'linewidth',6) 
set(lgd,'FontSize',70)
hT = findobj(hobj,'type','text');
set(hT,'FontSize',34)
ax = gca;
ax.FontSize = 42;
ax.LineWidth = 5; 
ylim([0 0.13])
ylabel('relative frequency')
xlabel('individual foraging efficiency')