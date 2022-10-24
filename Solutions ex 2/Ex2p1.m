%% Part 1: dice throws

% Set number of throws:
N_throws = 100;

% Generate random integers between 1 and 6:
dice = randi(6,N_throws,1);

% Display the correspondign histogram:
figure;
subplot(2,2,[1 2]);
plot(dice);
title('Line plot of the dice throws');

subplot(2,2,3);
histogram(dice,0.5:1:6.5);
title(['Histogram of ',num2str(N_throws),' dice throws']);



N_throws = 2000;
dice = randi(6,N_throws,1);

subplot(2,2,4);
histogram(dice,0.5:1:6.5);
title(['Histogram of ',num2str(N_throws),' dice throws']);



%% Part 2: y = tan(x)

x = linspace(-pi/2,pi/2,101);
y = tan(x);

figure;
subplot(1,2,1)
plot(x,y);
xlabel('x');
ylabel('y = tan(x)');
title('No axis limits');

subplot(1,2,2);
plot(x,y,'linestyle','--','linewidth',3,'color','r');
axis([min(x) max(x) -10 10]);
xlabel('x');
ylabel('y = tan(x)');
title('With axis limits');
