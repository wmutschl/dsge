load data;

endvars = {'da' 'pie' 'r' 'rstar' 'tau' 'u' 'x' 'dy'}; 
%endvars = sort(endvars);

for i=1:length(endvars)
    eval(strcat(endvars{i}, '=','data(',num2str(i),',:)'';'));
end
