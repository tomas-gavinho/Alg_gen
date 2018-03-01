function cal = evalua_pob_un( Individuos,restricciones,bin_real,prob,rango,n_var)
% recibe a individuos (fenotipo)
cal=[];
   switch bin_real
       case 'bin'
           nums = fenotipo_un(Individuos,bin_real,prob,rango,n_var); 
           if prob == 4
               cal = evalua_un(nums,prob,restricciones);
           else
               cal = evalua_un(nums,prob);
           end
           %pob_ev.prb(i) = 0.0;
       case 'real'
           if prob == 4
               [~, nums] = sort(Individuos,2);
               cal = evalua_un(nums,prob,restricciones);
           else
           cal = evalua_un(Individuos,prob);
           end
       case 'permutaciones'
           %todavía no
           
           %sud = fenotipo_un(Individuos,bin_real); % esto es para el sudoku, haciéndome bolas 
           cal = evalua_un(Individuos,prob,restricciones);
   
   end
   if ~cal
       cal=Inf;
   end
