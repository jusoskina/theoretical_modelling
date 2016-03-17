function goodnessOfFit = goodnessOfFit( origData, estimatedData , n)
%GOODNESSOFFIT returns the estimate of how well the data was fitted,
%averaged over all particles

subtractedSquared = (origData-estimatedData).^2;
summedNormalised = sum(subtractedSquared,1).*(1/n);
denominator = sum(origData.^2,1).*(1/n);
goodnessOfFit = summedNormalised./denominator;
%goodnessOfFit = subtractedSquared;

end

