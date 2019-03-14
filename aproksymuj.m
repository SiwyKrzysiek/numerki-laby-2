function wielomian = aproksymuj(x, y, stopienWyniku)
    n = length(x);

    wielomian = [2 1 1];
    
    X = zeros(stopienWyniku);
    
    for r = 1:stopienWyniku
       for k = 1:stopienWyniku
           if r == 1 && k == 1
               X(r, k) = n;
               
           else
               potega = r-1 + k-1;
               suma = 0;
               for i = 1:n
                   suma = suma + x(i)^potega;
               end
               
               X(r, k) = suma;
           end
       end
    end
    
    Y = zeros(stopienWyniku, 1);
    
    for i = 1:stopienWyniku
       suma = 0;
       for j = 1:n
           suma = suma + y(j) * x(j)^(i-1);
       end
       
       Y(i) = suma;
    end
    
    A = (X\Y)'
    
    wielomian = fliplr(A);
end

