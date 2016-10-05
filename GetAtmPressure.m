function P = GetAtmPressure(h)

% For the calculation of ISP
% Setting the atmospheric pressure model

    g       =       9.8067;
    M       =       0.028964;
    R       =       8.3144;

if h >= 0 && h < 11000
    Pb      =       101325;
    Tb      =       288.15;
    Lb      =       -0.0065;
    hb      =       0;
    P       =       Pb*(Tb/(Tb+Lb*(h-hb)))^(g*M/R/Lb);
elseif h >= 11000 && h < 20000
    Pb      =       22632;
    Tb      =       216.65;
    Lb      =       0.00;
    hb      =       11000;
    P       =       Pb*exp(-g*M*(h-hb)/R/Tb);
elseif h >= 20000 && h < 32000
    Pb      =       5474;
    Tb      =       216.65;
    Lb      =       0.001;
    hb      =       20000;
    P       =       Pb*(Tb/(Tb+Lb*(h-hb)))^(g*M/R/Lb);
elseif h >= 32000 && h < 47000
    Pb      =       868;
    Tb      =       228.65;
    Lb      =       0.0028;
    hb      =       32000;
    P       =       Pb*(Tb/(Tb+Lb*(h-hb)))^(g*M/R/Lb);
elseif h >= 47000 && h < 51000
    Pb      =       110;
    Tb      =       270.65;
    Lb      =       0.00;
    hb      =       47000;
    P       =       Pb*exp(-g*M*(h-hb)/R/Tb);
elseif h >= 51000 && h < 71000
    Pb      =       66;
    Tb      =       270.65;
    Lb      =       -0.0028;
    hb      =       51000;
    P       =       Pb*(Tb/(Tb+Lb*(h-hb)))^(g*M/R/Lb);
elseif h >= 71000 && h <= 170000
    Pb      =       4;
    Tb      =       214.65;
    Lb      =       -0.002;
    hb      =       71000;
    P       =       Pb*(Tb/(Tb+Lb*(h-hb)))^(g*M/R/Lb);
else
    P       =       0;
    
end