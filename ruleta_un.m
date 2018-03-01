function [Ind_nuev, Meta_sal] = ruleta_un(Individuos,Metadatos)
%recibe las calificaciones de individuos y regresa una con una selección de unos
%con mejor "fitness".
%suma_total = 0;
Meta_sal = Metadatos(:,1);
ctd = size(Metadatos,1);
Ind_nuev = Individuos;
x_raya = bsxfun(@rdivide,1,Metadatos(:,2));
suma_total = sum(x_raya);
% for i=1:ctd % si lo sé, mala práctica de programación, me he peleado bastante con los struct array y cell arrays
%     suma_total = 1/Metadatos(i,2) + suma_total;
% end
probabilidad_previa = 1.0;
for i=1:ctd
    probabilidad_previa = probabilidad_previa - 1/(suma_total*Metadatos(i,2));
    Metadatos(i,3) = probabilidad_previa;
end

for i=1:ctd
    p = rand();
    
    mayores = find(Metadatos(:,3)>p);
    menores = find(Metadatos(:,3)<p);
    Meta_sal ( i,1) = i;
        if isempty ( menores )
            Ind_nuev( i,:) = Individuos( Metadatos(ctd,1),: );            
        else
            if isempty( mayores )
                Ind_nuev(i,:) = Individuos( Metadatos(1,1),: );
            else             
                Ind_nuev(i,:) = Individuos( Metadatos(menores(1),1),: ); 
            end    
        end
   
end