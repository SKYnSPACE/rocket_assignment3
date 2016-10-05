%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculation of ISP (RSE Presentation #3)
% MinHyun Cho, AE Dept, 20163603
% Seongheon Lee, AE Dept., 20165234
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;

%%
% Common parameters
g0                  =   9.8067;
H                   =   0:100:200000;

% Setting Zero 
AtmPressure         =   zeros(size(H));

Isp_PAP             =   zeros(size(H));
Isp_PAL             =   zeros(size(H));
Isp_L220            =   zeros(size(H));
Isp_L33             =   zeros(size(H));
Isp_H10             =   zeros(size(H));

Thrust_PAP          =   zeros(size(H));
Thrust_PAL          =   zeros(size(H));
Thrust_L220         =   zeros(size(H));
Thrust_L33          =   zeros(size(H));
Thrust_H10          =   zeros(size(H));

%%
% PAP Solid Boosters
Tvac_PAP            =   689990;
mdot_PAP            =   267.5249;
Ae_PAP              =   0.388384;

% PAL Liquid Boosters
Tvac_PAL            =   752003;
mdot_PAL            =   275.8366;
Ae_PAL              =   0.774205;

% L220 First Stage
Tvac_L220           =   3034100;
mdot_L220           =   1112.916;
Ae_L220             =   3.231393;

% L33 Second Stage
Tvac_L33            =   804998;
mdot_L33            =   277.3194;
Ae_L33              =   2.308261;

% H10 Third Stage
Tvac_H10            =   62703;
mdot_H10            =   14.30401;
Ae_H10              =   0.189664;

%%
for i = 1:length(H)
    
    AtmPressure(i) = GetAtmPressure(H(i));

    Thrust_PAP(i)       = Tvac_PAP - Ae_PAP * GetAtmPressure(H(i));
    Thrust_PAL(i)       = Tvac_PAL - Ae_PAL * GetAtmPressure(H(i));
    Thrust_L220(i)      = Tvac_L220 - Ae_L220 * GetAtmPressure(H(i));
    Thrust_L33(i)       = Tvac_L33 - Ae_L33 * GetAtmPressure(H(i));
    Thrust_H10(i)       = Tvac_H10 - Ae_H10 * GetAtmPressure(H(i));
    
    Isp_PAP(i)          = Thrust_PAP(i)/mdot_PAP/g0;
    Isp_PAL(i)          = Thrust_PAL(i)/mdot_PAL/g0;
    Isp_L220(i)         = Thrust_L220(i)/mdot_L220/g0;
    Isp_L33(i)          = Thrust_L33(i)/mdot_L33/g0;
    Isp_H10(i)          = Thrust_H10(i)/mdot_H10/g0;
    
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
set(gcf,'color','w')
[ax, h1, h2] = plotyy(H/1000, [Isp_PAP; Isp_PAL; Isp_L220; Isp_L33; Isp_H10], H/1000, AtmPressure/1000,'plot');
hold(ax(1),'on');
hold(ax(2),'on');
plot(ax(1),8*ones(100),1:10:1000,'k--','linewidth',1.5);
plot(ax(1),39*ones(100),1:10:1000,'k--','linewidth',1.5);
plot(ax(1),72*ones(100),1:10:1000,'k--','linewidth',1.5);
plot(ax(1),150*ones(100),1:10:1000,'k--','linewidth',1.5);
grid on;
grid(ax(2),'on')
set(h1,'LineWidth',1.5)
set(h2,'LineWidth',1.5)

xlabel('Height[km]');
title('Isp variation w.r.t Altitude','Fontsize',15);
set(get(ax(1), 'Ylabel'), 'String', 'Specific Impulse[sec]');
set(get(ax(2), 'Ylabel'), 'String', 'Atmospheric Pressure[kPa]');
legend(ax(1),'Solid Boosters','Liquid boosters','1st Stage', '2nd Stage', '3rd Stage')
legend(ax(2),'AtmP')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
set(gcf,'color','w')
[ax, h1, h2] = plotyy(H/1000, [Thrust_PAP; Thrust_PAL; Thrust_L220; Thrust_L33; Thrust_H10]/1000, H/1000, AtmPressure/1000,'plot');
hold(ax(1),'on');
hold(ax(2),'on');
plot(ax(1),8*ones(100),1:100:10000,'k--','linewidth',1.5);
plot(ax(1),39*ones(100),1:100:10000,'k--','linewidth',1.5);
plot(ax(1),72*ones(100),1:100:10000,'k--','linewidth',1.5);
plot(ax(1),150*ones(100),1:100:10000,'k--','linewidth',1.5);
grid on;
grid(ax(2),'on')
set(h1,'LineWidth',1.5)
set(h2,'LineWidth',1.5)

xlabel('Height[km]');
title('Thrust variation w.r.t Altitude','Fontsize',15);
set(get(ax(1), 'Ylabel'), 'String', 'Thrust[kN]');
set(get(ax(2), 'Ylabel'), 'String', 'Atmospheric Pressure[kPa]');
legend(ax(1),'Solid Boosters','Liquid boosters','1st Stage', '2nd Stage', '3rd Stage')
legend(ax(2),'AtmP')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%