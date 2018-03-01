function ganadores = torneo(pob,metadatos,bin_real)

[ctd,ctd2] = size(pob);
ganadores=zeros(ctd,ctd2);

if strcmp(bin_real, 'bin')
    ganadores = char(ganadores);
end

orig = (1:ctd);
perm = randperm(ctd);
for i=1:ctd
   if metadatos(orig(i),2) < metadatos(perm(i),2) 
       ganadores(i,:)= pob(i,:);
   else
       ganadores(i,:)= pob(perm(i),:);
   end
end