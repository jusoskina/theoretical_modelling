function relativeError = relativeError( origData, errors)
%calculates sum(deltaX)/sum(abs(X)), where this is summed over n. This is done
%because otherwise dividing by x->0 blows the relative errors up

squeezedErrors = squeeze(errors);
squeezedValues = squeeze(origData);
errorsSum = sum(squeezedErrors,1);
valuesSum = sum(abs(squeezedValues),1);

relativeError = errorsSum./valuesSum;

end

