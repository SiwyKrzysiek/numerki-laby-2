clc

load("dane_apx0.mat");
% s %Wypisanie danych

x = s(:, 1)';
y = s(:, 2)';

%Wykres wczytanych danych
plot(x, y, ".");

plot(x, y, "x");
hold on;

wielomian = aproksymuj(x, y, 3);

a = min(x);
b = max(x);

X = linspace(a, b, 1000);
Y = arrayfun(@(x) polyval(wielomian, x), X);

plot(X, Y, "-");

legend("dane punkty", "aproksymacja");

%% Test
clc;

x = [0 0.5 1 1.5 2];
y = [0 0.19 0.26 0.29 0.31];

plot(x, y, "x");
hold on;

wielomian = aproksymuj(x, y, 3);

a = min(x);
b = max(x);

X = linspace(a, b, 1000);
Y = arrayfun(@(x) polyval(wielomian, x), X);

plot(X, Y, "-");

legend("dane punkty", "aproksymacja");



