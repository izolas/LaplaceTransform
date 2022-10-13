clear all;
clc;
clf;

syms x y t s
% y = sin(x);
% z= [t, sin(t)];
% laplace(z);
% Y = laplace(y);
% y1 = ilaplace(Y);
% y2 = ilaplace(Y,x)

%%%%%%% YÜKSEK MERTEBEDEN SABİT KATSAYILI DİFERANSİYEL DENKLEM İÇERN BAŞLANGIÇ DEĞER PROBLEMLERİ %%%%%%

%{ Ornek1.1
g11=sin(t);
A11=[1 2 1];  % Yani y''+2y'+y=sint
conds11 = [0 1];
Y11=laplace1(A11,conds11,g11)

%Ornek1.2
g12=exp(3*t)*t^2;
A12=[1 -6 9];  %  Yani y''-6y'+9y=exp(3*t)*t^2
conds12 = [2 6];
Y12=laplace1(A12,conds12,g12)

%Ornek1.3
g13=exp(-t);
A13=[2 3 -3 -2];  % Yani 2y'''+3y'-3y'-2y=exp(-t)
conds13 = [0 0 1];
Y13=laplace1(A13,conds13,g13)

%Ornek1.4
g14 = 0;
A14 = [1 0 0 0 -1];  % Yani y^(4)-y=0
conds14 = [1 0 -1 0];
Y14 = laplace1(A14,conds14,g14)
%}
%%%%%%% SABİT KATSAYILI 1. MERTEBEDEN DİFERANSİYEL DENKLEM SİSTEMİ İÇERN BAŞLANGIÇ DEĞER PROBLEMLERİ %%%%%%

% Ornek2.1 - Diferansiyel Denklem Sistemi şu şekilde verilsin:
% y1'=2y1-3y2-6t
% y2'=-y1+2y2+t

g21=transpose([-6*t t]);
A21=[2 -3 ;-1 2]; 
conds21 = transpose([0 1]);
Y21=laplace2(A21,conds21,g21)

%%%%%%% YÜKSEK MERTEBEDEN SABİT KATSAYILI DİFERANSİYEL DENKLEMLERİN İNDİRGEMESİ ÖRNEKLERİ %%%%%%
%{ Ornek3.1
g31=sin(t);
A31=[1 2 1];  % Yani y''+2y'+y=sint
conds31 = [0 1];
Y31 = laplace3(A31,conds31,g31)

%Ornek3.2
g32=exp(3*t)*t^2;
A32=[1 -6 9];  %  Yani y''-6y'+9y=exp(3*t)*t^2
conds32 = [2 6];
Y32 = laplace3(A32,conds32,g32)

%Ornek3.3
g33=exp(-t);
A33=[2 3 -3 -2];  % Yani 2y'''+3y'-3y'-2y=exp(-t)
conds33 = [0 0 1];
Y33 = laplace3(A33,conds33,g33)

%Ornek3.4
g34 = 0;
A34 = [1 0 0 0 -1];  % Yani y^(4)-y=0
conds34 = [1 0 -1 0];
Y34 = laplace3(A34,conds34,g34)
%}