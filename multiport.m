function output = multiport(a,b,choice)
% multiport switch.
switch choice
    case 1
        output = a + b;
    case 2
        output = a-b;
    case 3 
        output = a*b;
    otherwise
end
end