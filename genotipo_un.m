function gen = genotipo_un(x,prob,n_var)
tam_pob = size(x,1);
switch prob
    case 1
        long = (5.12-(-5.12))*10^3;
        tam_bin = ceil(log2(long));
        gen= zeros(tam_pob,n_var*tam_bin);
        gen=char(gen);
        for k=1:tam_pob
            for i = 1:n_var % cambiar n                                    
                %x(i) = rand()+10; % el trasladar el rango hasta -5 lo dejo en el decodificador
                tmp = dec2bin(round((2^tam_bin-1)*( (x(k,i)+5)*10^2 )/long)); 
                ds = size(tmp,2);
                if ds ~= tam_bin
                    for j=1:tam_bin-ds
                        tmp = strcat('0',tmp); 
                    end
                end
                gen(k,(i-1)*tam_bin+1:i*tam_bin) = tmp;
            end
        end
    case 2 
        long = (5-(-5))*10^3;
        tam_bin = ceil(log2(long));
        gen= zeros(tam_pob,n_var*tam_bin);
        gen=char(gen);
        for k=1:tam_pob
            for i = 1:2 % cambiar n                                    
                %x(i) = rand()+10; % el trasladar el rango hasta -5 lo dejo en el decodificador
                tmp = dec2bin(round((2^tam_bin-1)*( ( x(k,i)+5 )*10^2 )/long)); 
                ds = size(tmp,2);
                if ds ~= tam_bin
                    for j=1:tam_bin-ds
                        tmp = strcat('0',tmp); 
                    end
                end
                gen(k,(i-1)*tam_bin+1:i*tam_bin) = tmp;
            end
        end
    case 3
        long    = (5-(-5))*10^3;
        tam_bin = ceil(log2(long));
        gen     = zeros(tam_pob,n_var*tam_bin);
        gen     = char(gen);
        for k = 1:tam_pob
            for i = 1:n_var % cambiar n                                    
                %x(i) = rand()+10; % el trasladar el rango hasta -5 lo dejo en el decodificador
                tmp = dec2bin(round((2^tam_bin-1)*( (x(k,i)+5)*10^2 )/long),3); 
                ds = size(tmp,2);
                if ds ~= tam_bin
                    for j=1:tam_bin-ds
                        tmp = strcat('0',tmp); 
                    end
                end
                gen(k,(i-1)*tam_bin+1:i*tam_bin) = tmp;
            end
        end
    case 4
        long    = factorial(15);
        tam_bin = ceil(log2(long));
        gen     = zeros(tam_pob,n_var*tam_bin);
        gen     = char(gen);
        for k = 1:tam_pob
            for i = 1:n_var % cambiar n                                    
                %x(i) = rand()+10; % el trasladar el rango hasta -5 lo dejo en el decodificador
                tmp = dec2bin(round((2^tam_bin-1)*( (x(k,i)))/long),3); 
                ds = size(tmp,2);
                if ds ~= tam_bin
                    for j=1:tam_bin-ds
                        tmp = strcat('0',tmp); 
                    end
                end
                gen(k,(i-1)*tam_bin+1:i*tam_bin) = tmp;
            end
        end
end