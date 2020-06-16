% This program calculates the minimum monthly payment towards the RESP

clc;clear
%Defining the inital values
bal = input('Enter the initial starting balance($): ');
nbal = bal;
mBal = 0;
iRate = 0.0625/12;
iRateT = 0.07;
%Allows the user to choose the faculty
fSelection = input('Please select a faculty: 1. Arts; 2. Sciences; 3. Engineering: ');
switch fSelection
    case 1
        balA = 5550;
        for yg = 2:22
            balA(yg) = balA(yg-1) + (balA(yg-1)*iRateT);
        end
        fBalA = balA(19) + balA(20) + balA(21) + balA(22);
        final_balance = fBalA;
    case 2
        balS = 6100;
        for yg = 2:22
            balS(yg) = balS(yg-1) + (balS(yg-1)*iRateT);
        end
        fBalS = balS(19) + balS(20) + balS(21) + balS(22);
        final_balance = fBalS;
    case 3
        balENG = 6550;
        for yg = 2:22
            balENG(yg) = balENG(yg-1) + (balENG(yg-1)*iRateT);
        end
        fBalENG = balENG(19) + balENG(20) + balENG(21) + balENG(22);
        final_balance = fBalENG;
end
%Debug counter (helped to figure out what I was doing)
counter = 0;
%Guess and check while loop
while nbal<final_balance
    counter = counter + 1;
    nbal = bal;
    mBal = mBal + 10;
    for m = 2:216
        nbal= nbal + (nbal*iRate) + mBal;
    end
end
fprintf('The 4-year tuition fee is $%.2f\n',final_balance')
fprintf('You will need to save $%.2f each month to reach the goal\n',mBal)