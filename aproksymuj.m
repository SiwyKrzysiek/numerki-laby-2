function wielomian = aproksymuj(x, y, stopienWyniku)
    n = length(x);

    wielomian = [2 1 1];
    
    X = zeros(stopienWyniku);
    
    %Prostrze przejscie, ale z wielokrotnym liczeniem tego samego
%     for r = 1:stopienWyniku
%        for k = 1:stopienWyniku
%            if r == 1 && k == 1
%                X(r, k) = n;
%                
%            else
%                potega = r-1 + k-1;
%                suma = 0;
%                for i = 1:n
%                    suma = suma + x(i)^potega;
%                end
%                
%                X(r, k) = suma;
%            end
%        end
%     end
    
    %Pierwszy rzad razem z propagacja na ukos
    X(1, 1) = n;
    for i = 2:stopienWyniku
       potega = i-1;
       suma = 0;
       for j = 1:n
           suma = suma + x(j)^potega;
       end
       
       r = 1;
       for k = i:-1:1
           X(r, k) = suma;
           
           r = r + 1;
       end
    end
    
    %Ostatnia kolumna wraz z popagacja na ukos
    for i = 2:stopienWyniku
       potega = i-2 + stopienWyniku;
       suma = 0;
       for j = 1:n
           suma = suma + x(j)^potega;
       end
       
       k = stopienWyniku;
       for r = i:stopienWyniku
           X(r, k) = suma;
           
           k = k - 1;
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

