clear all
clc
cd 'C:\Users\tommy\OneDrive\Documents\Things I know\Physics_Research\BioPhysics\HenryCoeffCode\POPS_chol_in_NaCl_water'

ZSS10  = xlsread("POPS_Chol_in_10mM_NaCl(aq).xlsx","ZS (Sonic)")   ;
ZPS10  = xlsread("POPS_Chol_in_10mM_NaCl(aq).xlsx","ZP (Sonic)")   ;
ZSPS10 = xlsread("POPS_Chol_in_10mM_NaCl(aq).xlsx","ZS (Presonic)");
ZPPS10 = xlsread("POPS_Chol_in_10mM_NaCl(aq).xlsx","ZP (Presonic)");

ZSS100 = xlsread("POPS_Chol in 100mM NaCl.xlsx"   ,"ZS (Sonic)")   ;
ZPS100 = xlsread("POPS_Chol in 100mM NaCl.xlsx"   ,"ZP (Sonic)")   ;
ZSPS100= xlsread("POPS_Chol in 100mM NaCl.xlsx"   ,"ZS (Presonic)");
ZPPS100= xlsread("POPS_Chol in 100mM NaCl.xlsx"   ,"ZP (Presonic)");

ZPS00  = xlsread("POPS_Chol in Pure DI Water.xlsx" ,"ZP (Sonic)");
ZSS00  = xlsread("POPS_Chol in Pure DI Water.xlsx" ,"ZS (Sonic)");

ZSS50 = xlsread("POPS_Chol in 50mM NaCl.xlsx"   ,"ZS (Sonic)")   ;
ZPS50 = xlsread("POPS_Chol in 50mM NaCl.xlsx"   ,"ZP (Sonic)")   ;
ZSPS50= xlsread("POPS_Chol in 50mM NaCl.xlsx"   ,"ZS (Presonic)");
ZPPS50= xlsread("POPS_Chol in 50mM NaCl.xlsx"   ,"ZP (Presonic)");

%%

% 0 - Potential
ZetaPotS00   = ZPS00(:,7);
ZetaPotS00   = ZetaPotS00(isfinite(ZetaPotS00(:, 1)), :);
ZetaPotS00SD = ZPS00(:,17);
ZetaPotS00SD = ZetaPotS00SD(isfinite(ZetaPotS00SD(:, 1)), :);

% 10 - Potential
ZetaPotPS10  = ZPPS10(:,7);
ZetaPotS10   = ZPS10(:,7) ;
ZetaPotPS10  = ZetaPotPS10(isfinite(ZetaPotPS10(:,1)), :);
ZetaPotS10   = ZetaPotS10(isfinite(ZetaPotS10(:,1)), :);

ZetaPotPS10SD = ZPPS10(:,17);
ZetaPotPS10SD = ZetaPotPS10SD(isfinite(ZetaPotPS10SD(:, 1)), :);
ZetaPotS10SD = ZPS10(:,17);
ZetaPotS10SD = ZetaPotS10SD(isfinite(ZetaPotS10SD(:, 1)), :);

% 100 - Potential
ZetaPotPS100 = ZPPS100(:,8);
ZetaPotS100  = ZPS100(:,8);
ZetaPotPS100 = ZetaPotPS100(isfinite(ZetaPotPS100(:,1)), :);
ZetaPotS100  = ZetaPotS100(isfinite(ZetaPotS100(:,1)), :);

ZetaPotPS100SD = ZPS100(:,17);
ZetaPotPS100SD = ZetaPotPS100SD(isfinite(ZetaPotPS100SD(:, 1)), :);
ZetaPotS100SD = ZPPS100(:,17);
ZetaPotS100SD = ZetaPotS100SD(isfinite(ZetaPotS100SD(:, 1)), :);

% 50 - Potential
ZetaPotPS50 = ZPPS50(:,8);
ZetaPotS50  = ZPS50(:,8);
ZetaPotPS50 = ZetaPotPS50(isfinite(ZetaPotPS50(:,1)), :);
ZetaPotS50  = ZetaPotS50(isfinite(ZetaPotS50(:,1)), :);

ZetaPotPS50SD = ZPS50(:,17);
ZetaPotPS50SD = ZetaPotPS50SD(isfinite(ZetaPotPS50SD(:, 1)), :);
ZetaPotS50SD = ZPPS50(:,17);
ZetaPotS50SD = ZetaPotS50SD(isfinite(ZetaPotS50SD(:, 1)), :);

% 00 - Radius
ZetaRadS00   = ZSS00(:,11);
ZetaRadS00   = ZetaRadS00(isfinite(ZetaRadS00(:, 1)), :);

ZetaRadS00SD = ZSS00(:,20);
ZetaRadS00SD = ZetaRadS00SD(isfinite(ZetaRadS00SD(:,1)),:);

% 10 - Radius
ZetaRadPS10  = ZSPS10(:,11);
ZetaRadS10   = ZSS10(:,11) ;
ZetaRadPS10  = ZetaRadPS10(isfinite(ZetaRadPS10(:, 1)), :);
ZetaRadS10   = ZetaRadS10(isfinite(ZetaRadS10(:, 1)), :);

ZetaRadPS10SD = ZSPS10(:,20);
ZetaRadPS10SD = ZetaRadPS10SD(isfinite(ZetaRadPS10SD(:,1)),:);
ZetaRadS10SD = ZSS10(:,20);
ZetaRadS10SD = ZetaRadS10SD(isfinite(ZetaRadS10SD(:,1)),:);

% 100 - Radius
ZetaRadPS100 = ZSPS100(:, 11);
ZetaRadS100  = ZSS100(:,11);
ZetaRadPS100  = ZetaRadPS100(isfinite(ZetaRadPS100(:, 1)), :);
ZetaRadS100   = ZetaRadS100(isfinite(ZetaRadS100(:, 1)), :);

ZetaRadPS100SD = ZSPS100(:,20);
ZetaRadPS100SD = ZetaRadPS100SD(isfinite(ZetaRadPS100SD(:,1)),:);
ZetaRadS100SD = ZSS100(:,20);
ZetaRadS100SD = ZetaRadS100SD(isfinite(ZetaRadS100SD(:,1)),:);

% 50 - Radius
ZetaRadPS50 = ZSPS50(:, 11) ;
ZetaRadS50  = ZSS50(:,11);
ZetaRadPS50  = ZetaRadPS50(isfinite(ZetaRadPS50(:, 1)), :);
ZetaRadS50   = ZetaRadS50(isfinite(ZetaRadS50(:, 1)), :);

ZetaRadPS50SD = ZSPS50(:,20);
ZetaRadPS50SD = ZetaRadPS50SD(isfinite(ZetaRadPS50SD(:,1)),:);
ZetaRadS50SD = ZSS50(:,20);
ZetaRadS50SD = ZetaRadS50SD(isfinite(ZetaRadS50SD(:,1)),:);

%%
clc;
close all;
Xsalt = [0, 5, 10, 20, 30];
Xsalt4 = [0, 5, 10, 20];
Xpure = [0, 10, 20, 26.5];


figure(1)
hold on
scatter(Xpure, ZetaPotS00 , 100, "red"   , "square","filled",'DisplayName','0 mM NaCl Sonicated')
scatter(Xsalt, ZetaPotS10 , 100, "blue"  , "square","filled",'DisplayName','10 mM NaCl Sonicated')
scatter(Xsalt4, ZetaPotS50 , 100, "green" , "square","filled",'DisplayName','50 mM NaCl Sonicated')
scatter(Xsalt, ZetaPotS100, 100, "black" , "square","filled",'DisplayName','100 mM NaCl Sonicated')

scatter(Xsalt, ZetaPotPS10 ,  100, "blue"   ,"d", "filled",'DisplayName','10 mM NaCl Presonicated')
scatter(Xsalt4, ZetaPotPS50 , 100 , "green"  ,"d", "filled",'DisplayName','50 mM NaCl Presonicated')
scatter(Xsalt, ZetaPotPS100, 100, "black"   ,"d", "filled",'DisplayName','100 mM NaCl Presonicated')
ylim([-130 -20])
xlim([-4 34])
% title("\zeta-Potential vs. Cholesterol Concentration")
ylabel("\zeta-Potential (mV)")
xlabel("Cholesterol Concentration (mol %)")
%legend('0 mM NaCl Sonicated','10 mM NaCl Sonicated','50 mM NaCl Sonicated','10 mM NaCl Presonicated','50 mM NaCl Presonicated','location','northwestoutside')
% legend('0 mM NaCl Sonicated','10 mM NaCl Sonicated','50 mM NaCl Sonicated','100 mM NaCl Sonicated','10 mM NaCl Presonicated','50 mM NaCl Presonicated','100 mM NaCl Presonicated','location','northwestoutside')
fontsize(gca,scale=2)
figure(2)
hold on
scatter(Xpure, ZetaRadS00 ,110 , "red"  ,"square","filled",'DisplayName','0 mM NaCl Sonicated')
scatter(Xsalt, ZetaRadS10 ,100 , "blue" ,"square","filled",'DisplayName','10 mM NaCl Sonicated')
scatter(Xsalt4, ZetaRadS50 ,100 ,"green" ,"square","filled",'DisplayName','50 mM NaCl Sonicated')
scatter(Xsalt, ZetaRadS100,100 ,"black" ,"square","filled",'DisplayName','100 mM NaCl Sonicated')

scatter(Xsalt, ZetaRadPS10 , 100, "blue" ,"d","filled",'DisplayName','10 mM NaCl Presonicated')
scatter(Xsalt4, ZetaRadPS50 , 100, "green","d","filled",'DisplayName','50 mM NaCl Presonicated')
scatter(Xsalt, ZetaRadPS100, 100, "black","d","filled",'DisplayName','100 mM NaCl Presonicated')
xlim([-4 34])

% title("Radius vs. Cholesterol Concentration")
ylabel("Radius (nm)")
xlabel("Cholesterol Concentration (mol%)")
% legend('0 mM NaCl Sonicated','10 mM NaCl Sonicated','50 mM NaCl Sonicated','10 mM NaCl Presonicated','50 mM NaCl Presonicated','location','northwest')

legend('0 mM NaCl Sonicated','10 mM NaCl Sonicated','50 mM NaCl Sonicated','100 mM NaCl Sonicated','10 mM NaCl Presonicated','50 mM NaCl Presonicated','100 mM NaCl Presonicated','location','northwest')
fontsize(gca,scale=2)

figure(3)

sgtitle('\zeta Potential for Sonicated Samples')
title('Sonicated Vesicles')
subplot(2,2,1)
hold on
scatter(Xpure, ZetaPotS00 , 100, "red", "square","filled",'DisplayName','0 mM NaCl Sonicated') 
errorbar(Xpure, ZetaPotS00, ZetaPotS00SD, "LineStyle", "none",'DisplayName','0 mM NaCl Sonicated')
title('\zeta Potential vs Cholesterol Concentration in 0 mM NaCl')
ylabel('\zeta Potential (mV)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,2)
hold on
scatter(Xsalt, ZetaPotS10 , 100, "blue"  , "square","filled",'DisplayName','10 mM NaCl Sonicated')
errorbar(Xsalt, ZetaPotS10, ZetaPotS10SD,"Color", "blue", "LineStyle", "none",'DisplayName','10 mM NaCl Sonicated')
title('\zeta Potential vs Cholesterol Concentration in 10 mM NaCl')
ylabel('\zeta Potential (mV)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,3)
hold on
scatter(Xsalt4, ZetaPotS50 , 100, "green" , "square","filled",'DisplayName','50 mM NaCl Sonicated')
errorbar(Xsalt4, ZetaPotS50, ZetaPotS50SD,"Color", "green", "LineStyle", "none",'DisplayName','50 mM NaCl Sonicated')
title('\zeta Potential vs Cholesterol Concentration in 50 mM NaCl**')
ylabel('\zeta Potential (mV)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,4)
hold on
scatter(Xsalt, ZetaPotS100, 100, "black" , "square","filled",'DisplayName','100 mM NaCl Sonicated')
errorbar(Xsalt, ZetaPotS100, ZetaPotS100SD,"Color", "black", "LineStyle", "none",'DisplayName','100 mM NaCl Sonicated')
title('\zeta Potential vs Cholesterol Concentration in 100 mM NaCl**')
ylabel('\zeta Potential (mV)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])


figure(4)
sgtitle('\zeta Potential for Presonicated Samples')

subplot(2,2,1) 
hold on
scatter(Xsalt, ZetaPotPS10 ,  70, "blue"   ,"square","filled",'DisplayName','10 mM NaCl Presonicated')
errorbar(Xsalt, ZetaPotPS10, ZetaPotPS10SD,"Color", "blue", "LineStyle", "none",'DisplayName','10 mM NaCl Sonicated')
title('\zeta Potential vs Cholesterol Concentration in 10 mM NaCl')
ylabel('\zeta Potential (mV)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,2)
hold on
scatter(Xsalt4, ZetaPotPS50 , 70 , "green"  ,"square","filled",'DisplayName','50 mM NaCl Presonicated')
errorbar(Xsalt4, ZetaPotPS50, ZetaPotPS50SD,"Color", "green", "LineStyle", "none",'DisplayName','50 mM NaCl Sonicated')
title('\zeta Potential vs Cholesterol Concentration in 50 mM NaCl**')
ylabel('\zeta Potential (mV)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,3)
hold on
scatter(Xsalt, ZetaPotPS100, 70, "black","square","filled",'DisplayName','100 mM NaCl Presonicated')
errorbar(Xsalt, ZetaPotPS100, ZetaPotPS100SD,"Color", "black", "LineStyle", "none",'DisplayName','100 mM NaCl Sonicated')
title('\zeta Potential vs Cholesterol Concentration in 100 mM NaCl**')
ylabel('\zeta Potential (mV)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

figure(5)
sgtitle('Radii for Sonicated Samples')

subplot(2,2,1)
hold on
scatter(Xpure, ZetaRadS00 ,110 , "red"  ,"square","filled",'DisplayName','0 mM NaCl Sonicated')
errorbar(Xpure, ZetaRadS00, ZetaRadS00SD,"Color", "red", "LineStyle", "none",'DisplayName','0 mM NaCl Sonicated')
title('Radius vs Cholesterol Concentration in 0 mM NaCl')
ylabel('Radius (nm)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,2)
hold on
scatter(Xsalt, ZetaRadS10 ,100 , "blue" ,"square","filled",'DisplayName','10 mM NaCl Sonicated')
errorbar(Xsalt, ZetaRadS10, ZetaRadS10SD,"Color", "blue", "LineStyle", "none",'DisplayName','10 mM NaCl Sonicated')
title('Radius vs Cholesterol Concentration in 10 mM NaCl')
ylabel('Radius (nm)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,3)
hold on
scatter(Xsalt4, ZetaRadS50 ,100 ,"green" ,"square","filled",'DisplayName','50 mM NaCl Sonicated')
errorbar(Xsalt4, ZetaRadS50, ZetaRadS50SD,"Color", "green", "LineStyle", "none",'DisplayName','50 mM NaCl Sonicated')
title('Radius vs Cholesterol Concentration in 50 mM NaCl**')
ylabel('Radius (nm)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,4)
hold on
scatter(Xsalt, ZetaRadS100,100 ,"black" ,"square","filled",'DisplayName','100 mM NaCl Sonicated')
errorbar(Xsalt, ZetaRadS100, ZetaRadS100SD,"Color", "black", "LineStyle", "none",'DisplayName','100 mM NaCl Sonicated')
title('Radius vs Cholesterol Concentration in 100 mM NaCl')
ylabel('Radius (nm)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

figure(6)
sgtitle('Radii for Presonicated Samples')
subplot(2,2,1)
hold on
scatter(Xsalt, ZetaRadPS10 , 70, "blue" ,"square","filled",'DisplayName','10 mM NaCl Presonicated')
errorbar(Xsalt, ZetaRadPS10, ZetaRadPS10SD,"Color", "blue", "LineStyle", "none",'DisplayName','10 mM NaCl Presonicated')
title('Radius vs Cholesterol Concentration in 10 mM NaCl')
ylabel('Radius (nm)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,2)
hold on
scatter(Xsalt4, ZetaRadPS50 , 70, "green","square","filled",'DisplayName','50 mM NaCl Presonicated')
errorbar(Xsalt4, ZetaRadPS50, ZetaRadPS50SD,"Color", "green", "LineStyle", "none",'DisplayName','50 mM NaCl Presonicated')
title('Radius vs Cholesterol Concentration in 50 mM NaCl')
ylabel('Radius (nm)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])

subplot(2,2,3)
hold on
scatter(Xsalt, ZetaRadPS100, 70, "black","square","filled",'DisplayName','100 mM NaCl Presonicated')
errorbar(Xsalt, ZetaRadPS100, ZetaRadPS100SD,"Color", "black", "LineStyle", "none",'DisplayName','100 mM NaCl Presonicated')
title('Radius vs Cholesterol Concentration in 100 mM NaCl')
ylabel('Radius (nm)')
xlabel('Cholesterol (mol %)')
xlim([-4 34])