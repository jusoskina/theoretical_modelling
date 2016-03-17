% Reads in files, takes averages over J and x_0 of the original vs prdicted
% values.

temp = 0.01;

%% Read in all the simulation files at the given temperature
pathName = '/home/k1594876/Documents/theoretical_modelling/data/';

%data array for single temperature but different runs
myOrigData = zeros(10,50,5001);
myLNAData = zeros(10,50,5001);
myPlefkaData = zeros(10,50,5001);
 formatSpec = '%f';
 %TODO This is hard-coded for size 
 sizeA = [5001, 50];

for J=1:10
    fileName = strcat('dt0.01_t50_n50_nRuns20_jamp1_x0amp1_eta1_temp', num2str(temp), '_run', num2str(J));
    
   %Original 
    fileEndingOrig = '_muOrig.txt';
    absoluteFilePathOrig = strcat(pathName, fileName, fileEndingOrig);
    fileIDOrig = fopen(absoluteFilePathOrig,'r');
    tempData = fscanf(fileIDOrig,formatSpec, sizeA);
    tempData = tempData';
    myOrigData(J,:,:) = tempData;
    fclose(fileIDOrig);
    
    fileEndingLNA = '_muLNA.txt';
    absoluteFilePathLNA = strcat(pathName, fileName, fileEndingLNA);
    fileIDLNA = fopen(absoluteFilePathLNA,'r');
    tempDataLNA = fscanf(fileIDLNA,formatSpec, sizeA);
    tempDataLNA = tempDataLNA';
    myLNAData(J,:,:) = tempDataLNA;
    fclose(fileIDLNA);
    
        
    fileEndingPlefka = '_muPlefka.txt';
    absoluteFilePathPlefka = strcat(pathName, fileName, fileEndingPlefka);
    fileIDPlefka = fopen(absoluteFilePathPlefka,'r');
    tempDataPlefka = fscanf(fileIDPlefka,formatSpec, sizeA);
    tempDataPlefka = tempDataPlefka';
    myPlefkaData(J,:,:) = tempDataPlefka;
    fclose(fileIDPlefka);
end

%% Average over Js and x0
myOrigMean = squeeze(mean(myOrigData, 1));
myLNAMean = squeeze(mean(myLNAData, 1));
myPlefkaMean = squeeze(mean(myPlefkaData, 1));

figure;
plot(myOrigMean');
title('Original Mean');

figure;
plot(myLNAMean');
title('LNA Mean');

figure;
plot(myPlefkaMean');
title('Plefka Mean');

% TODO calculate variance on the average and figure out what to do with it