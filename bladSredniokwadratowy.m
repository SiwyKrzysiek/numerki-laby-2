function blad = bladSredniokwadratowy(x, y, f)
% bladSredniokwadratowy Oblicza blad sredniokwadratowy miedzy podana
% funkcja a danymi punktami

    blad = 0;
    
    for i = 1:length(x) 
        blad = blad + (f(x(i)) - y(i))^2;
    end

end

