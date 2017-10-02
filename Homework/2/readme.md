#### Assignment 2  
<br>
<br>
%% 1.
```bash 
a=1: a = 1                         %Gives variable "a" a value of 1
b='x': b = x                       %Gives variable "b" a string value of 'x'
c=true: c = logical 1              %Gives var. "c" a logical value of 1
(whos a b c):
Name      Size            Bytes  Class      Attributes

  a         1x1                 8  double               
  b         1x1                 2  char                 
  c         1x1                 1  logical
                                   %Gives information about the variables
a==c: ans = logical 1              %Verifies that var "a" and "c" are equal
a+c: ans = 2                       %Sum of the two variables
d=[1 2 3 4]: d =   1   2   3   4   %Creates an array with the given values
e=['a' 'b' 'c' 'd']: e =  abcd     %Creates a string with given strings
f=['abcd']: f =  abcd              %Creates the same string
g={'a' 'b' 'c' 'd'}: g = 1×4 cell array  'a'  'b'  'c'  'd'
                                   %Creates an array with strings
h={ a b c d}: h =  1×4 cell array [1]    'x'    [1]    [1×4 double]
                                   %Creates an array out of the given variables
(whos d e f g h):
Name      Size            Bytes  Class     Attributes

  d         1x4                32  double              
  e         1x4                 8  char                
  f         1x4                 8  char                
  g         1x4               456  cell                
  h         1x4               491  cell                
                                   % Lists information about the variables
```

%% 2.
```bash
% When you store a larger or smaller integer than allowed in int8
%it automatically changes the value to its maximum limits.
intmax('int16'): ans =  int16    32767
intmin('int16'): ans =  int16   -32768

intmax('int32'): ans =  int32    2147483647
intmin('int32'): ans =  int32   -2147483648
```

%% 3.
```
1\2: ans =  2         %Quotient of 2 and 1
1/2: ans =  0.5000    %Quotient of 1 and 2
int8(1/2): ans =  1   %Quotient of 1 and 2 as an integer rounded up
int8(1/3): ans =  0   %Quotient of 1 and 3 as interger rounded down
-5^2: ans =  -25      %Interpreted as -(5^2)
(-5)^2: ans =  25     % -5 * -5 so negatives cancel this time
10-6/2: ans =  7      %Follows order of operations and multiplies first
5*4/2*3: ans =  30    %Interpreted as (5*4*3)/2
```

%% 4(a).
```bash
a=[1 0;2 1]
a =

     1     0
     2     1

b=[-1 2;0 1]
b =

    -1     2
     0     1

c=[3 2]'
c =

     3
     2

d=5
d =

     5
```

% 4(b).
```bash
a+b  %Sum of each element with its counterpart in the other array
ans =

     0     2
     2     2

a.*b %Product of each element with its counterpart
ans = 

    -1     0
     0     1

a*b %Performs matrix multiplication which multiplies rows of
ans =               %a with columns of b

    -1     2
    -2     5

a*c %Performs matrix multiplication between a and c
ans =

     3
     8

a+c %Sum of both columns in a with the single column in c
ans =

     4     3
     4     3

a+d %Adds 5 to each term in the array
ans =

     6     5
     7     6

a.*d %Multiplies each term in array by 5
ans =

     5     0
    10     5

a*d
ans = 

     5     0
    10     5
%Performs the same as a.*d


%% 5.

v=[2 2 2];

a=diag(v)

a =

     2     0     0
     0     2     0
     0     0     2
     
b=eye(3);

a=2*b
     
a =

     2     0     0
     0     2     0
     0     0     2
     
c=zeros(3);

v=[2 2 2];

c+diag(v)

c = 

     2     0     0
     0     2     0
     0     0     2
	 
```

%% 8. 
```bash
%Trying to run this script from a different directory causes
%it to be an undefined function because it only searches the 
%current directory
```

