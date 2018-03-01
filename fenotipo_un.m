function nums = fenotipo_un(Individuos,bin_real,prob,rango,n_var)
% Individuos matriz con el genotipo del individuo
% ctd la cantidad de variables del problema
% el tamaño de la codificación a binario de cada variable (# de bits)
% el inicio del rango de la variable
tam_pob = size(Individuos,1);
nums = zeros(tam_pob,n_var);
switch bin_real
    case 'bin'       
        if prob == 4
            long    = factorial(n_var);
            tam_bin = ceil(log2(long));
            for j = 1:tam_pob
                comb = round(bin2dec( Individuos(j,:))*long/(2^tam_bin-1));
                nums(j,:) = inv_factoradic(comb,n_var);
               
            end
            if any(nums > 15)
               k = find(nums>15);
               disp(k);
            end
        else    
            rango_int = rango(2)-rango(1);
            long = (rango_int)*10^3;%¿Agregar los números de decimales de precisión? Cambiar aqui y en decode
            tam_bin = ceil(log2(long));
        
            for j = 1:tam_pob
                for i =1:n_var
                    nums(j,i) = rango(1) + (rango_int* bin2dec( Individuos(j, (i-1)*tam_bin+1 : i*tam_bin)) )*10/(2^tam_bin-1);
                end
            end
        end
    case 'permutaciones'
        sud=[];
        %comprobando que den los valores correctos
        %c=inv_factoradic(bin_decode(bin(1:19)));
        %sud(1)=inv_factoradic(bin_decode(bin(1:19)));
        for i=0:8
            ini = (i*19+1); fin = (i+1)*19;
            sud(9-i,1:9)=inv_factoradic(bin_decode(bin(ini:fin)));
        end
end