function eval=evalua_un(nums,prob,restricciones)
switch nargin
    case 2
    switch prob
        case 1
            A=10;
            x_raya = nums.^2 - A * cos(2 * nums * pi );       
            eval = A*size(nums,2)+sum(x_raya,2);

        case 2
            eval = -20*exp(-.2*sqrt(.5*(nums(:,1).^2+nums(:,2).^2)))-exp(.5*cos( 2*pi*nums(:,1) )+.5*cos( 2*pi*nums(:,2) ))+exp(1)+20;

        case 3        
            x_raya =100*( ( nums(:,2:end) - nums(:,1:end-1).^2 ).^2 )+( 1 - nums(:,1:end-1)).^2; 
            eval = sum(x_raya,2);
            
    end
    case 3
       % tarea 3 de momento no estoy haciendo sudoku
%         if prob == 4
%             tp = size(nums,1);
%             cv = size(nums,1);
%             eval=zeros(tp,1);
%             for i = 1:tp
%                 comb = inv_factoradic(nums(i),15);
%                 x_raya=0;
%                 for j=1:cv-1
%                     x_raya = x_raya + restricciones(comb(1,j),comb(1,j+1));
%                 end
%                 eval(i)=x_raya;
%             end
%         else
            
            [tp ,cv] = size(nums);
            eval=zeros(tp,1);
            for i=1:tp
                x_raya=0;
                for j=1:cv-1
                    x_raya = x_raya + restricciones(nums(i,j),nums(i,j+1));
                end
                eval(i)=x_raya;
            end
end
        
