function transient = transient( timeSeriesData , n)
%TRANSIENT returns the transient of the time series data

transExpectations = zeros(n, size(timeSeriesData,2));
for i=1:size(timeSeriesData,2)
    transExpectations(:,i) = timeSeriesData(:,1).*timeSeriesData(:,i);
end

transient = sum(transExpectations,1).*(1/n);

% subtractedSquared = (origData-estimatedData).^2;
% summedNormalised = sum(subtractedSquared,1).*(1/n);
% denominator = sum(origData.^2,1).*(1/n);
% goodnessOfFit = summedNormalised./denominator;
%goodnessOfFit = subtractedSquared;

end

