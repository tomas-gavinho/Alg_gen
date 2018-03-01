function res = alg_gen_un(prob,restricciones,bin_real,tam_pob,p_cruza,p_muta,n_var)
%versión beta1
% prob = problema de la tarea 2 (Ackley, rosenbrock, etc, el 4 reservado
%   para TSP y 5 para sudoku
% restricciones = 0, ahi pienso ingresar el sudoku inicial
% bin_real= método por el que se quiere resolver opciones =
%               'bin','real','permutaciones'
% tam_pob = tamaño de la población
% p_cruza = probabilidad de cruza
% p_muta = probabilidad de mutación
% n_var = cuantas variables para determinado problema. No aplica para 2 y 5
%   Tal vez en algún futuro generalize el sudoku a n. Tal vez, bastante
%   improbable
    switch prob
        case 1
            rango = [-5.12,5.12];
        case 2
            rango = [-5,5];
        case 3
            rango = [-5,5];
        case 4
            rango = [0,n_var];
    end
    [Pob_sel, Metadatos] = crea_pob_un(prob,bin_real,rango,tam_pob,n_var);
    Metadatos(:,2)       = evalua_pob_un(Pob_sel,restricciones,bin_real,prob,rango,n_var);
    %Metadatos(:,2) = evalua_pob_un(Pob_in,prob,n_var);
    
%     vec_min = min(Metadatos,[],1);
%     cal_elite = vec_min(2);
%     pos_elite = find ( Metadatos(:,2)== cal_elite );
%     elite = Pob_sel( Metadatos( pos_elite,1 ),:);
    
    [elite, cal_elite] = elitismo(Pob_sel, Metadatos);
    ctd_ciclos         = 2000;
    x                  = zeros(ctd_ciclos,1);
    for t = 1:ctd_ciclos
        %[Pob_sel, Metadatos(:,1) ] = ruleta_un     (   Pob_sel , Metadatos   );
        Pob_sel                    = torneo     (   Pob_sel , Metadatos,bin_real   );
        Pob_sel                    = cruza_un      (   Pob_sel, bin_real, p_cruza ,rango  );
        Pob_sel                    = muta_un       (   Pob_sel, bin_real, p_muta  ,rango , 2  );
        Metadatos(:,2)             = evalua_pob_un (   Pob_sel,restricciones ,bin_real,prob, rango,n_var ); 
       
        vec_min                    = min           ( Metadatos,[],1 );
        cal_pob                    = vec_min(2);

        if cal_elite < cal_pob
           Pob_sel(tam_pob,:)   = elite(1,:);
           x(t)           = cal_elite;    
%           x(t) = cal_pob;
        else
            cal_elite = cal_pob;
            pos_elite = find ( Metadatos(:,2) == cal_elite );
            elite     = Pob_sel( Metadatos( pos_elite(1),1 ),:);
            x(t)      = cal_pob;
        end




    end

   % cal_elite = cal_pob;
    pos_elite = find ( Metadatos(:,2) == cal_elite );
    elite     = Pob_sel( Metadatos( pos_elite(1),1 ),:);
    plot(x(100:end));
    tit1= ['Calificación mejor =', num2str(cal_elite)];
    disp(tit1);
    tit2= 'Y los individuos fueron [';
    if strcmp(bin_real,'bin')
        elite = fenotipo_un(elite,bin_real,prob,rango,n_var);
    end
    tit3=  num2str(elite);

    disp(tit2);
    disp(tit3);
    res=x;
end

function [elite, cal_elite] =  elitismo(Pob_sel, Metadatos)
    vec_min = min(Metadatos,[],1);
    cal_elite = vec_min(2);
    pos_elite = find ( Metadatos(:,2)== cal_elite );
    elite = Pob_sel( Metadatos( pos_elite,1 ),:);
end
