function perm = inv_factoradic(num,n_var)
%de un número decimal lo convierte a la combinación que es

n_t=num;
fact=zeros(1,n_var);
i=1;
while num ~= 0
    fact(i) = mod(num,i);
    num     = floor(num/i);
    i       = i+1;
end
base = (1:n_var);
perm = base;
fact = flip(fact);
for j=1:(i-1)
    if size(base,2)<fact(j)+1
        disp('error atrapado');
        disp(fact);
    end
    perm(j)= base(fact(j)+1);
    base(fact(j)+1) = [];
end
