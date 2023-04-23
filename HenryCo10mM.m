syms t
cd 'C:\Users\tommy\OneDrive\Documents\Things I know\Physics_Research\BioPhysics\HenryCoeffCode\POPS_chol_in_NaCl_water'

K = .3441;      %This is the Kappa value for the sample of interest
                %Next line extracts data from excel sheet and stores to
                %variable T
ZSS = xlsread("POPS_Chol_in_10mM_NaCl(aq).xlsx","ZS (Sonic)");
ZPS = xlsread("POPS_Chol_in_10mM_NaCl(aq).xlsx","ZP (Sonic)");
ZSPS= xlsread("POPS_Chol_in_10mM_NaCl(aq).xlsx","ZS (Presonic)");
ZPPS= xlsread("POPS_Chol_in_10mM_NaCl(aq).xlsx","ZP (Presonic)");

%%
a = ZSPS(:,17);   %Sizes the T matrix down to just column 14 (or whatever column corresponds to #/2)
                %Removes all the NaN cells in the matrix
a = a(isfinite(a(:, 1)), :);
                %Next for-loop applies the Kappa values to the a values and
                %stores it in a new matrix with variable x. Values in x
                %represent the K * a values
for n = 1:length(a)
    x(n,1) = K * a(n);
end

H = [];         %H is where the henry coefficient values are going to be stored
expr = exp(-t)/t; 

for n = 1:length(x)
   y = int(expr,t,Inf,x(n));
   y1 = vpa (y,10);    %converts an infinite exponential into a normal value calculated to 10 digits out
   H(n,1) = 1 + (1/16) * (x(n)^2) - (5/48) * ( x(n)^3 ) - (1/96) * (x(n)^4) + (1/96) * ( x(n)^5 ) - ( ( (1/8) * (x(n)^4) - (1/96) * (x(n)^6) ) * exp(x(n)) * y1); %#ok<SAGROW>  
end

                %Next line reads the excel sheet with the corresponding ZP
                %values
r  = ZPPS(:,8);

for n = 1:length(x)
    Z(n,1) =  r(n,1) / H(n,1);
end
                %Creates an array of labels
SampleName = {'0-1';'0-2';'0-3';'5-1';'5-2';'5-3';'10-1';'10-2';'10-3';'20-1';'20-2';'20-3';'30-1';'30-2';'30-3'};
                %Organizes the labels with the final Zeta potential values
Final = table(SampleName,Z);
%%

a2 = ZSS(:,10);   %Sizes the T matrix down to just column 14 (or whatever column corresponds to #/2)
                %Removes all the NaN cells in the matrix
a2 = a2(isfinite(a2(:, 1)), :);
                %Next for-loop applies the Kappa values to the a values and
                %stores it in a new matrix with variable x. Values in x
                %represent the K * a values
for n = 1:length(a2)
    x2(n,1) = K * a2(n);
end

H2 = [];         %H is where the henry coefficient values are going to be stored
expr = exp(-t)/t; 

for n = 1:length(x2)
   y = int(expr,t,Inf,x2(n));
   y1 = vpa (y,10);    %converts an infinite exponential into a normal value calculated to 10 digits out
   H2(n,1) = 1 + (1/16) * (x2(n)^2) - (5/48) * ( x2(n)^3 ) - (1/96) * (x2(n)^4) + (1/96) * ( x2(n)^5 ) - ( ( (1/8) * (x2(n)^4) - (1/96) * (x2(n)^6) ) * vpa(exp(x2(n))) * y1); %#ok<SAGROW>  
end

for n = 1:length(x2)
    H3(n,1) = (3/2) - (9/2) * (x(n)^-1) + (75/2) * (x(n)^-2) - 330 * (x(n)^-3);
end
                %Next line reads the excel sheet with the corresponding ZP
                %values
r2  = ZPS(:,8);

for n = 1:length(x2)
    Z2(n,1) =  r2(n,1) / H2(n,1);
end
                %Creates an array of labels
SampleName = {'0-1';'0-2';'0-3';'5-1';'5-2';'5-3';'10-1';'10-2';'10-3';'20-1';'20-2';'20-3';'30-1';'30-2';'30-2'};
                %Organizes the labels with the final Zeta potential values
Final2 = table(SampleName,Z2);