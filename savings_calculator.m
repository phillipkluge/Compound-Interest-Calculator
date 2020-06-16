%This program tells you if you have saved enough for a 4-year degree using
%user defined inputs.

clc;clear
%Defining the inital variables
bal = input('Enter the starting balance($): ');
mBal = input('Enter the monthly contributions($): ');
iRate = 0.0625/12;

%Calculate the savings
for m = 2:216
    bal(m) = bal(m-1) + (bal(m-1)*iRate) + mBal;
end
fSelection = input('Please select a faculty: 1. Arts; 2. Sciences; 3. Engineering: ');

%Arts Tution Calculator
iRateT = 0.07;
balA = 5550;
for yg = 2:22
    balA(yg) = balA(yg-1) + (balA(yg-1)*iRateT);
end
fBalA = balA(19) + balA(20) + balA(21) + balA(22);

%Sciences Tution Calculator
balS = 6100;
for yg = 2:22
    balS(yg) = balS(yg-1) + (balS(yg-1)*iRateT);
end
fBalS = balS(19) + balS(20) + balS(21) + balS(22);

%Engineering Tution Calculator
balENG = 6550;
for yg = 2:22
    balENG(yg) = balENG(yg-1) + (balENG(yg-1)*iRateT);
end
fBalENG = balENG(19) + balENG(20) + balENG(21) + balENG(22);

%Comparing the different savings vs. cost
fprintf('At the end of 18 years you will have saved $%.2f\n',bal(216));
switch fSelection
    case 1
        fprintf('The cost of a 4-year college tution fee is $%.2f\n',fBalA')
        if fBalA<=bal(216)
            disp('Congratulations!!!! You have saved enough.')
            r = bal(216) - fBalA;
            %%fprintf('You are over by $%f\n',r);
        elseif fBalA>bal(216)
            r = fBalA - bal(216);
            %%disp('Based on your selection, you do no have enough!')
            fprintf('The saving is $%.2f short.\n',r);
        end
    case 2
        if fBalS<=bal(216)
            disp('Congratulations!!!! You have saved enough.')
            r = bal(216) - fBalS;
            %%fprintf('You are over by $%f\n',r);
        elseif fBalS>bal(216)
            r = fBalS - bal(216);
            %%disp('Based on your selection, you do not have enough!')
            fprintf('The saving is $%.2f short.\n',r);
        end
    case 3
        if fBalENG<=bal(216)
            r = bal(216) - fBalENG;
            %%fprintf('You are over by $%f\n',r);
            fprintf('Congratulations!!!! You have saved enough.')
        elseif fBalENG>bal(216)
            r = fBalENG - bal(216);
            %%disp('Based on your selection, you do not have enough!')
            fprintf('The saving is $%.2f short.\n',r);
        end
end

%Plotting the results
if fSelection == 1
    z = fBalA;
elseif fSelection == 2
    z = fBalS;
elseif fSelection == 3
    z = fBalENG;
end
x = (1:216)/12;
y = bal;
plot(x,y,x,(ones(1,216))*z)
title('College Savings vs. Tution Fee')
xlabel('Year')
ylabel('Balance')