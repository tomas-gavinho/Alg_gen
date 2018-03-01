function anova =  llama_gen(n)
anova = [];
matriz = load('matriz_d.mat');
matriz = matriz.matriz_d;
%tratamientos = [50,100,300,500;0.1,0.3,0.5,0.7;0.5,1,10,30];
%demasiado ambicioso

tratamientos = { 'ruleta','torneo';'swap','ins'};
[n_trat, nivel] = size(tratamientos);
for j=1:n_trat
   
    for i=1:nivel
        anova((j-1)*2+i).fila    = tratamientos(1,j);
        anova((j-1)*2+i).columna = tratamientos(2,i);
        for k = 1:n
            %anova((j-1)*2+i).freq{i}(k) = alg_gen_DEx(4,matriz,'permutaciones',100,.7,10,15,tratamientos{2,i},tratamientos{1,j});
            anova((j-1)*2+i).freq{i}(k) = alg_gen_DEx(4,matriz,'permutaciones',100,.5,5,15,tratamientos{2,i},tratamientos{1,j});

        end
    end
end