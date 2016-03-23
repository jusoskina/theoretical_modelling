function standardError = standardErr( ciiData , n)
%calculates sqrt(var/N)

standardError = (abs((ciiData).*(1/n))).^0.5;

end

