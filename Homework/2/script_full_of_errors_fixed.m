a = 2; %Variable names must start with a letter
b = 3;
a1 = b; %Variable b was not defined
x = 2;
y = X + 4; % This is equal to 6
pi = 4 * atan(1); %Random ; in multiplication
disp(pi)
pi = '3.14159'; % character " did not match ' at the end
disp(tan(3.14159)); %pi is now defined as a class character with no number 
c = 4^3^2^3;        %value
a11 = ((c-78564)/c + 32); %Lacked variable to define and had extra )
year = 2017;
Z=['This year is ', num2str(year)];
disp(Z); % It did not diplay the year, it was no consistent in class within the disp funtion.
stuff = {'a' 'b' '4' '21' 'c'}; %values in array must all be same class          
beginning = stuff(1); %array values start at 1
ending = stuff(5); %end is a logical argument so cannot be used as variable 
discount = 12; % the '%' symbol has the function of denoting comments
AMOUNT = 120; %random characters with number
amount = ['$',num2str(AMOUNT)];%can't insert a character alone with number
duck = 77;
and = duck; %duck was undefined
class = 'INF1100, gr 2'; %didn't have matching quotes
continue_ = x > 0;
grass = fox == false; % false used for logical comparison was only given 
wolf = fox == true;   % one term
Persian = ['Persian' ' is ' 'a' ' human ' 'language']; % , and ; made matrix dimensions
Spanish = {'Spanish ' 'is ' 'another '  'language'}; % extra }
disp('Persian is not the same as Spanish'); % values must be same class
% The first one is a single string
% The second is a 1x4 array of strings
% The third is also a single string