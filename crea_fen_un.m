function nums = crea_fen_un(prob,rango,n_pob,n_var,bin_real)
%No importa si es real o binario, es fenotipo
switch prob
    case 1 
        nums= rand(n_pob,n_var)*(rango(2)-rango(1))+rango(1);
    
    case 2
        nums= rand(n_pob,2)*(rango(2)-rango(1))+rango(1);
    
    case 3 %Tarea 2
        nums= rand(n_pob,n_var)*(rango(2)-rango(1))+rango(1);
   
    case 4 % Tarea 3, permutaciones
        if strcmp(bin_real ,'real')
            nums=rand(n_pob,n_var)*n_var;
        else
            nums = zeros(n_pob,n_var);
            for i = 1:n_pob
                nums(i,:) = randperm(n_var);
            end
        end
        
end