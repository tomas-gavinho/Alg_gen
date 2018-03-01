function Pob_mut = muta_DEx( Pob, bin_real,t_muta ,alfa,rango,M )
Pob_mut  = Pob;
ctd_iter = size(Pob,1);
sz       = size(Pob,2);
switch bin_real
    
    case 'bin'
        for i=1:ctd_iter    
            for j=1:sz
                al = rand();
                if al < (1/(sz))*alfa            
                    Pob_mut(i,j) = num2str(~logical( str2double(Pob( i,j ))));
                end
            end
        end
        
    case 'real'
        for i=1:ctd_iter
            for j=1:sz
                sel = rand();
                prb = (1/sz)*alfa;
                if sel < prb
                    p_n = randi(2);
                    if p_n > 1
                        Pob_mut( i,j ) = min( Pob_mut ( i,j )+M*rand(), rango(2));
                    else
                        Pob_mut( i,j ) = max( Pob_mut ( i,j )-M*rand(), rango(1));
                    end
                end
            end
        end
    case 'permutaciones'
        switch t_muta
            case 'swap'
                for i=1:ctd_iter    

                    al = rand();
                    if al < (1/(ctd_iter))*alfa   
                        m1 = randi(sz);
                        m2 = randi(sz);           
                        tmp = Pob(i,:);
                        tmp([m1,m2])=tmp([m2,m1]);
                        Pob_mut(i,:) = tmp;
                    end
                end
            case 'ins'
                for i=1:ctd_iter    
                    al = rand();
                    if al < (1/(ctd_iter))*alfa 
                         m1 = randi(sz-2);
                        m2 = randi(sz-m1);           
                        tmp = Pob(i,m1+m2);
                        Pob_mut(i,m1+1:m1+m2)=Pob(i,m1:m1+m2-1);
                        Pob_mut(i,m1) = tmp;
                    end
                end
        end
        
end