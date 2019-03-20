%% Przyklad 1
clc
clf
clear
load("dane_apx0.mat");

x = s(:, 1)';
y = s(:, 2)';

wielomianAproksymujacy = aproksymuj(x, y, 2)
blad = bladSredniokwadratowy(x, y, @(x) polyval(wielomianAproksymujacy, x))

% Przykladowe parametry
konkretnaWartosc = polyval(wielomianAproksymujacy, 10)
punkPrzecieciaOX = wielomianAproksymujacy(2)
katNachylenia = atan(wielomianAproksymujacy(1))

%Wykres punktow
plot(x, y, "*");
grid on;
hold on;

a = min(x);
b = max(x);

X = linspace(a, b, 100);
Y = arrayfun(@(x) polyval(wielomianAproksymujacy, x), X);

%Wykres aproksymacji
plot(X, Y, "-");
title("Aproksymacja wielomianem ax + b");
xlabel("x");
ylabel("y");

legend("Dane punkty", "Funkcja aproksymuj¹ca");

%% Przyklad 2
clc
clf
clear
load("dane_apx3.mat");

x = s(:, 1)';
y = s(:, 2)';

wielomianAproksymujacy = aproksymuj(x, y, 3)
blad = bladSredniokwadratowy(x, y, @(x) polyval(wielomianAproksymujacy, x))

% Przykladowe parametry
konkretnaWartoscWielomianu = polyval(wielomianAproksymujacy, 19)
delta = wielomianAproksymujacy(2) - 4*wielomianAproksymujacy(1)*wielomianAproksymujacy(3);
wieszcholekParaboliX = -wielomianAproksymujacy(2)/(2*wielomianAproksymujacy(3))
wieszcholekParaboliY = -delta/(4*wielomianAproksymujacy(3))

%Wykres punktow
plot(x, y, "*");
grid on;
hold on;

a = min(x);
b = max(x);

X = linspace(a, b, 100);
Y = arrayfun(@(x) polyval(wielomianAproksymujacy, x), X);

%Wykres aproksymacji
plot(X, Y, "-");
title("Aproksymacja wielomianem ax^2 + bx + c");
xlabel("x");
ylabel("y");

legend("Dane punkty", "Funkcja aproksymuj¹ca");

%% Testy
clc
clf

load("dane_apx0.mat");
% s %Wypisanie danych

x = s(:, 1)';
y = s(:, 2)';

%Wykres wczytanych danych
plot(x, y, "*");
hold on;

wielomian = aproksymuj(x, y, 3);

a = min(x);
b = max(x);

X = linspace(a, b, 100);
Y = arrayfun(@(x) polyval(wielomian, x), X);

plot(X, Y, "-");

legend("dane punkty", "aproksymacja");

blad = bladSredniokwadratowy(x, y, @(x) polyval(wielomian, x))

%% Test
clc;

x = [0 0.5 1 1.5 2];
y = [0 0.19 0.26 0.29 0.31];

plot(x, y, "x");
hold on;

wielomian = aproksymuj(x, y, 3);

a = min(x);
b = max(x);

X = linspace(a, b, 100);
Y = arrayfun(@(x) polyval(wielomian, x), X);

plot(X, Y, "-");

legend("dane punkty", "aproksymacja");



