syms t
cd 'C:\Users\tommy\OneDrive\Documents\Things I know\Physics_Research\BioPhysics\HenryCoeffCode\POPS_chol_in_NaCl_water'
K = .1013;      %This is the Kappa value for the sample of interest
                %Next line extracts data from excel sheet and stores to
                %variable T'
                %Next 4 lines reads specific sheets and stores them in ZPPS 
                %or ZP presonic; ZPS or ZP sonic... etc.
% ZPPS = xlsread('C:\Users\tommy\OneDrive\Desktop\Physics_Research\BioPhysics\HenryCoeffCode\POPS_chol_in_NaCl_water\POPS_Chol_in_Pure_DI_Water.xlsx','ZP_(Presonic)');
ZPS = xlsread("POPS_Chol in Pure DI Water.xlsx","ZP (Sonic)");
% ZSPS = xlsread('C:\Users\tommy\OneDrive\Desktop\Physics_Research\BioPhysics\HenryCoeffCode\POPS_chol_in_NaCl_water\POPS_Chol_in_Pure_DI_Water.xlsx','ZS_(Presonic)');
ZSS = xlsread("POPS_Chol in Pure DI Water.xlsx","ZS (Sonic)");

a = ZSS(:,10);  %Sizes the matrix down to just column 10 (or whatever column corresponds to #/2)
                %Removes all the NaN cells in the matrix
a = a(isfinite(a(:, 1)), :);
                %Next for-loop applies the Kappa values to the a values and
                %stores it in a new matrix with variable x. Values in x
                %represent the K * a values

 for n = 1:length(a)
     x(n,1) = K * a(n);
 end
H = []; %H is where the henry coefficient values are going to be stored

expr = exp(-t)/t;

for n = 1:length(x)
   y = int(expr,t,Inf,x(n)); %Performs the integration 
   y1 = vpa (y,10);    %converts an infinite exponential into a normal value calculated to 10 digits out
   H(n,1) = 1 + (1/16) * (x(n)^2) - (5/48) * ( x(n)^3 ) - (1/96) * (x(n)^4) + (1/96) * ( x(n)^5 ) - ( ( (1/8) * (x(n)^4) - (1/96) * (x(n)^6) ) * exp(x(n)) * y1); %#ok<SAGROW> 
end
             
r = ZPS(:,9);


for n = 1:length(x)
    Z(n,1) = r(n,1) / H(n,1);
end
                %Creates an array of labels
SampleName = {'0-1';'0-2';'0-3';'10-1';'10-2';'10-3';'20-1';'20-2';'20-3';'26-1';'26-2';'26-3'};
                %Organizes the labels with the final Zeta potential values
Final = table(SampleName,Z);