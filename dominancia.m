function vec_dom = dominancia(max_min,matriz)
[a,b] = size(matriz);
vec_dom = zeros(a,1);

for i = 1:a
    tmp1=0;tmp2=0;
    for j = 1:a-i
        for k=1:b
            if max_min(k) == 1
                if matriz(i,k)>=matriz(j,k)
                    if matriz(i,k)~=matriz(j,k)
                        tmp1 = tmp1+1;               
                    end
                else
                    tmp2 = tmp2+1;
                end
            else
                if matriz(i,k)<=matriz(j,k)
                    if matriz(i,k)~=matriz(j,k)
                        tmp1 = tmp1+1;               
                    end
                else
                    tmp2 = tmp2+1;
                end
            end
        end
        if tmp1 == 0 && tmp2 >0
            vec_dom(i) = vec_dom(i)+1;
        end
        if tmp2 == 0 && tmp1 >0
            vec_dom(j) = vec_dom(j)+1;
        end
    end
end