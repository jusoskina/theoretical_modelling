% Reads in files, takes averages over J and x_0 of the original vs prdicted
% values.

%temp = 0.01;
n = 50;

%% Read in all the simulation files at the given temperature
pathName = '/home/k1594876/Documents/theoretical_modelling/data/';
T_range = [0.001, 0.005, 0.010, 0.020, 0.030, 0.040, 0.050, 0.060, 0.070, 0.080, 0.090, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 2, 3, 4, 5];
%T_range = [0.001, 0.005];
tRangeLength = length(T_range);
%data array for single temperature but different runs
myOrigData = zeros(10,n,5001);
myLNAData = zeros(10,n,5001);
myPlefkaData = zeros(10,n,5001);

muOrigErrors = zeros(10,n,5001);

muLNAGoodness = zeros(10, 5001);
muPlefkaGoodness = zeros(10, 5001);

muLNAGoodnessAveraged = zeros(tRangeLength, 5001);
muPlefkaGoodnessAveraged = zeros(tRangeLength, 5001);

%transients
muOrigTransient = zeros(10, 5001);
muLNATransient = zeros(10, 5001);
muPlefkaTransient = zeros(10, 5001);

muOrigTransientAveraged = zeros(tRangeLength, 5001);
muLNATransientAveraged = zeros(tRangeLength, 5001);
muPlefkaTransientAveraged = zeros(tRangeLength, 5001);

 formatSpec = '%f';
 %TODO This is hard-coded for size 
 sizeA = [5001, n];
 
 for T=1:tRangeLength
     temp = T_range(T);
    for J=1:10
        fileName = strcat('dt0.01_t50_n', num2str(n), '_nRuns20_jamp1_x0amp1_eta1_temp', num2str(temp), '_run', num2str(J));

       %Original 
        fileEndingOrig = '_muOrig.txt';
        absoluteFilePathOrig = strcat(pathName, fileName, fileEndingOrig);
        fileIDOrig = fopen(absoluteFilePathOrig,'r');
        tempData = fscanf(fileIDOrig,formatSpec, sizeA);
        tempData = tempData';
        myOrigData(J,:,:) = tempData;
        fclose(fileIDOrig);
        
        %Original errors
        fileEndingCiiOrig = '_CiiOrig.txt';
        absoluteFilePathCiiOrig = strcat(pathName, fileName, fileEndingCiiOrig);
        fileIDCiiOrig = fopen(absoluteFilePathCiiOrig,'r');
        tempData = fscanf(fileIDCiiOrig,formatSpec, sizeA);
        tempData = tempData';
        stdErr = standardErr(tempData, n);
        %myOrigErrors(J,:,:) = squeeze(stdErr);
        fclose(fileIDCiiOrig);
        
    %LNA
        fileEndingLNA = '_muLNA.txt';
        absoluteFilePathLNA = strcat(pathName, fileName, fileEndingLNA);
        fileIDLNA = fopen(absoluteFilePathLNA,'r');
        tempDataLNA = fscanf(fileIDLNA,formatSpec, sizeA);
        tempDataLNA = tempDataLNA';
        myLNAData(J,:,:) = tempDataLNA;
        fclose(fileIDLNA);

     %Plefka
        fileEndingPlefka = '_muPlefka.txt';
        absoluteFilePathPlefka = strcat(pathName, fileName, fileEndingPlefka);
        fileIDPlefka = fopen(absoluteFilePathPlefka,'r');
        tempDataPlefka = fscanf(fileIDPlefka,formatSpec, sizeA);
        tempDataPlefka = tempDataPlefka';
        myPlefkaData(J,:,:) = tempDataPlefka;
        fclose(fileIDPlefka);
    end

    %% Do Goodness of fit for all J and x0
    for J=1:10
        %PredictionErrors
        muLNAGoodness(J,:) = squeeze(goodnessOfFit(squeeze(myOrigData(J,:,:)), squeeze(myLNAData(J,:,:)), n));
        muPlefkaGoodness(J,:) = goodnessOfFit(squeeze(myOrigData(J,:,:)), squeeze(myPlefkaData(J,:,:)), n);
        
        muOrigTransient(J,:) = transient(squeeze(myOrigData(J,:,:)), n);
        muLNATransient(J,:) = transient(squeeze(myLNAData(J,:,:)), n);
        muPlefkaTransient(J,:) = transient(squeeze(myPlefkaData(J,:,:)), n);
    end
    
    muLNAGoodnessAveraged(T,:) = squeeze(mean(muLNAGoodness, 1));
    muPlefkaGoodnessAveraged(T,:) = squeeze(mean(muPlefkaGoodness, 1));
    
    muOrigTransientAveraged(T,:) = squeeze(mean(muOrigTransient, 1));
    muLNATransientAveraged(T,:) = squeeze(mean(muLNATransient, 1));
    muPlefkaTransientAveraged(T,:) = squeeze(mean(muPlefkaTransient, 1));
    
    %WRONG
    %myOrigMean = squeeze(mean(myOrigData, 1));
    %myLNAMean = squeeze(mean(myLNAData, 1));
    %myPlefkaMean = squeeze(mean(myPlefkaData, 1));
    
%     muOrigTransient(T,:) = transient(myOrigMean, n);
%     muLNATransient(T,:) = transient(myLNAMean, n);
%     muPlefkaTransient(T,:) = transient(myPlefkaMean, n);

 end

 %% PLOT
 
 figure;
hold on;
title('Goodness ofFit LNA Mu');
for ii=1:tRangeLength
plot(muLNAGoodnessAveraged(ii,:)','color',rand(1,3));
end

 figure;
hold on;
title('Goodness ofFit Plefka Mu');
for ii=1:tRangeLength
plot(muPlefkaGoodnessAveraged(ii,:)','color',rand(1,3));
end
 
%     figure;
%     plot(muLNAGoodnessAveraged(T,:), 'g');
%     hold on;
%     plot(muPlefkaGoodnessAveraged(T,:));
%     title('LNA Mean goodness of fit');
%     legend('LNA','Plefka')
%     hold off;

% 
% 
% %% Plot things
% figure;
% plot(myOrigMean');
% title('Original Mean');
% 
% figure;
% plot(myLNAMean');
% title('LNA Mean');
% 
% figure;
% plot(myPlefkaMean');
% title('Plefka Mean');

figure;
hold on;
title('Transients Original Mu');
for ii=1:tRangeLength
plot(muOrigTransientAveraged(ii,:)','color',rand(1,3));
end
hold off;

figure;
hold on;
title('Transients LNA Mu');
for ii=1:tRangeLength
plot(muLNATransientAveraged(ii,:)','color',rand(1,3));
end

figure;
hold on;
title('Transients Plefka Mu');
for ii=1:tRangeLength
plot(muPlefkaTransientAveraged(ii,:)','color',rand(1,3));
end

% TODO calculate variance on the average and figure out what to do with it