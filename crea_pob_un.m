function [ Individuos, Metadatos] = crea_pob_un(prob,bin_real,rango,tam_pob,n_var)
%individuos = matriz de fenotipos de individuos;
%metadatos = vector de mapeo a matriz, calificaciones y probabilidades de seleccionar cada individuo;
%tam_pob = 90;
%restricciones = [];
Metadatos      = zeros(tam_pob,3); 
Metadatos(:,1) = (1:tam_pob);
Individuos     = crea_fen_un(prob,rango,tam_pob,n_var,bin_real);
switch  bin_real 
    case 'bin'
        if prob == 4
            copia = Individuos;
            Individuos = zeros(tam_pob,1);
            for i = 1:tam_pob
                Individuos(i) = factoradic(copia(i,:),n_var);
            end
            n_var=1;
        end
        Individuos = genotipo_un(Individuos,prob,n_var);
    %case 'permutaciones'
        
end

 

