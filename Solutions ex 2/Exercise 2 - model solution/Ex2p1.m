%% Part 1: dice throws

% Set number of throws:
N_throws = 100;

% Generate random integers between 1 and 6:
dice = randi(6,N_throws,1); % randi(max value, first dimension, second dimension)
% OR 
%a = 0; b = 6;
%dice = rand(a + (b-a).*rand(N_throws,1);

% Display the corresponding histogram:
figure;
subplot(2,2,[1 2]);
plot(dice);
title('Line plot of the dice throws');

subplot(2,2,3);
histogram(dice,0.5:1:6.5); % like linspace but using the centre of the bins, ie 0.5 instead of 0
title(['Histogram of ',num2str(N_throws),' dice throws']);

% increase to 2000

N_throws = 2000;
dice = randi(6,N_throws,1);
% or 
%a = 0; b = 6;
%dice = rand(a + (b-a).*rand(N_throws,1);

subplot(2,2,4);
histogram(dice,0.5:1:6.5);
title(['Histogram of ',num2str(N_throws),' dice throws']);



%% Part 2: y = tan(x)

x = linspace(-pi/2,pi/2,101);
% or 
%step_size = pi/101;
%x = -pi/2:step_size:pi/2;
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
