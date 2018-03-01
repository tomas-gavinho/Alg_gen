function dec = factoradic(comb,n_var)
% recibe una combinación y regresa el número en base 10
a = size(comb,2);

    %para todos los casos dónde no todos los números sean permutados
    base = 1:n_var;
    for i=n_var:-1:1
        if base(i)==comb(i)
            comb(i)=[];
        else
            break;
        end
    end
p=size(comb,2);
b=zeros(p,2);
b=char(b);
for i=1:size(comb,2)
   c = find(base==comb(i))-1;
   b2 = num2str(c);
   c3 = size(b2,2);
   b(i,1:c3) = b2;
   %comb(c+1)=[];   
   base(c+1)=[];
end
%disp(b);
nums = size(b,1);
dec = 0;
for i=1:nums-1
    dec = dec + str2num(b(i,:))*factorial(nums-i) ;
end
