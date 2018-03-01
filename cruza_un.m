function Pob_cruza = cruza_un(Pob,bin_real,pcruza,rango)
%realiza el algoritmo cruza 
ctd_iter = size(Pob,1);
m_iter   = floor(ctd_iter/2);
comb     = (1:ctd_iter); Pob_cruza=Pob;
num      = zeros(m_iter,2);
tam      = size(Pob,2);
for i = 1:m_iter
    prim       = randi(size(comb));
    num(i,1)   = comb(prim);
    comb(prim) = [];
    seg        = randi(size(comb));
    num(i,2)   = comb(seg);
    comb(seg)  = [];
end


switch bin_real
    case 'bin'       
        %genero las combinaciones a cruzar
        for i= 1:m_iter
            p=rand();
            if p < pcruza
                corte = randi(tam-1)+1;
                char_tmp                              = Pob( num(i,1) , 1:corte    );
                Pob_cruza( 2*(i-1)+1 , 1:corte    )   = char_tmp;
                Pob_cruza( 2*(i-1)+1 , corte+1:tam)   = Pob( num(i,2) , corte+1:end);
    
                Pob_cruza( 2*(i-1)+2 , 1:corte    )   = Pob( num(i,2) , 1:corte    );
                Pob_cruza( 2*(i-1)+2 , corte+1:tam)   = Pob( num(i,1) , corte+1:end);
            else
                Pob_cruza( 2*(i-1)+1 , :)             = Pob( num(i,2) , :          );
                Pob_cruza( 2*(i-1)+2 , :)             = Pob( num(i,1) , :          );
            end
        end
                
    case 'real'
        for i= 1:m_iter
            Pob_cruza( 2*(i-1)+1 , : ) = Pob( num(i,1) , : );
            Pob_cruza( 2*(i-1)+2 , : ) = Pob( num(i,2) , : );
            if rand()<pcruza        
                for j=1:tam
                    alfa  = rand();
                    %falta poner un if si la diferencia es 0
                    dif   =     abs( Pob( num(i,2), j ) - Pob( num(i,1) , j));
%                     if dif == 0
%                        dif = alfa*Pob( num(i,1) , j);
%                     end
                    inf1  = min( Pob( num(i,2), j ),  Pob( num(i,1) ,j )) - 0.5 * dif;
                    inf2  = max( Pob( num(i,2), j ),  Pob( num(i,1) ,j )) + 0.5 * dif;
                    n1    = max( inf1              ,  rango(1));
                    n2    = min( inf2              ,  rango(2));
                    
                    Pob_cruza( 2*(i-1)+1 , j ) = n1*alfa+n2*(1-alfa);
                    Pob_cruza( 2*(i-1)+2 , j ) = n2*alfa+n1*(1-alfa);
                end
            end

        end
    case 'permutaciones'
        tmp2 = zeros(1,tam);
        tmp1 = zeros(1,tam);
        for i= 1:m_iter
            Pob_cruza( 2*(i-1)+1 , : ) = Pob( num(i,1) , : );
            Pob_cruza( 2*(i-1)+2 , : ) = Pob( num(i,2) , : );
%             if size(unique(Pob( num(i,1) , : ))) ~= tam
%                 disp('error de antes 1')
%             end
%              if size(unique(Pob( num(i,2) , : ))) ~= tam
%                 disp('error de antes2')
%             end
            if rand()<pcruza        
                alfa = randi(tam-2);
                beta = randi(tam-alfa);
                
                tmp1(1,alfa:alfa+beta) = Pob( num(i,1),alfa:alfa+beta);
                tmp2(1,alfa:alfa+beta) = Pob( num(i,2),alfa:alfa+beta);
                iter1 = 0; iter2=0;
                
                for j=1:(tam)
                   
                    if  ~any(tmp1==Pob(num(i,2) ,j))
                        
                        if iter1 ~= alfa-1
                            iter1=iter1+1;
                        else
                            iter1 = iter1 + beta + 2 ;
                        end
                        tmp1( 1,iter1)=Pob(num(i,2) ,j);
                    end
                end   
                for k = 1:(tam)    
                    if  ~any(tmp2==Pob(num(i,1) ,k))
                        
                        if iter2 ~= alfa-1
                            iter2=iter2+1;
                        else
                            iter2 = iter2 + beta + 2 ;
                        end
                        tmp2( 1,iter2)=Pob(num(i,1) ,k);
                    end
                    
                end
%                 if any( tmp2== 0) || any( tmp1 == 0)
%                     disp('error');
%                     disp(Pob( num(i,1) , : ));
%                     disp(Pob( num(i,2) , : ));
%                     Pob_cruza( 2*(i-1)+2 , : ) = randperm(tam);
%                     Pob_cruza( 2*(i-1)+1 , : ) = randperm(tam);
%                     continue;
%                 end
%                 if size (tmp1,2) ~= tam || size (tmp2,2) ~= tam
%                     disp('error tamaño');
%                     disp(Pob( num(i,1) , : ));disp(size(tmp1,2));
%                     disp(Pob( num(i,2) , : ));disp(size(tmp2,2));
%                     Pob_cruza( 2*(i-1)+2 , : ) = randperm(tam);
%                     Pob_cruza( 2*(i-1)+1 , : ) = randperm(tam);
%                     continue;
%                 end
%                 if size(unique(tmp1)) ~= tam
%                     disp('error atrapado 1')
%                 end
%                 if size(unique(tmp1)) ~= tam
%                     disp('error atrapado 2')
%                 end
                Pob_cruza( 2*(i-1)+2 , : ) = tmp2;
                Pob_cruza( 2*(i-1)+1 , : ) = tmp1;
                tmp2 = 0*tmp2;
                tmp1 = 0*tmp1;
            end
        end
end

