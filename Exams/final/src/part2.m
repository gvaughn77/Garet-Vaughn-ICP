clear all;
close all;
load('../data/cells.mat');


% Some variables to be called upon later:

days = [0,10,12,14,16,18,20,22]; 
columnOfZeros = zeros(8, 1);
result = columnOfZeros;
error = columnOfZeros;


for (d = 1: length(days) -1)
    errorForEachDay = 0; 
    
    
    for (Z = 1:size(cells, 3))
        BData = cells;  % copy of data to be changed into binary form
        zSlicesForEachTime = BData(:,:,Z,d); 
        grayScaledZSlices = imbinarize(zSlicesForEachTime); % still easier imo than Amir's method of d(d~=0) = 1
        Border = bwboundaries(grayScaledZSlices);
        
        
        for (i = 1:length(Border))
            Boundary = Border{i};
            
            
            for (n = 1:size(Boundary, 1))
                errorForEachDay = zSlicesForEachTime(Boundary(n,1), Boundary(n,2)) + errorForEachDay; % matches number of tumors at each slice (the reason for the for loop) with the boundaries     
            
            end
            
        end
        
    end
    
    result(d+1) = sum(sum(sum(cells(:,:,:,d)))).*10.^(-7); % condensing total tumor numbers into one
    error(d+1) = errorForEachDay*10.^(-7).*(.5); % cycles through error for each day and shrinks error numbers into usable ones for desired graph dimensions x 10^-7
    
end




% Time to make the graph and make it look pretty:

A = axes(); % all axes properties set here:
A.Title.String = "Gompertzian Fit to Rat's Brain Tumor Growth";
A.XLabel.String = 'Time [ days ]';
A.YLabel.String = 'Tumor Cell Count';
A.Title.FontSize = 15;
A.XLabel.FontSize = 15;
A.YLabel.FontSize = 15;
A.XTick = [0 5 10 15 20];
A.Box = 'on'; 
hold on;

eBar = errorbar(days, result, error); % all errorbar plot properties set here:
eBar.LineWidth = 4;
eBar.Color = [0 0 1];
eBar.Marker = '.'; 
eBar.MarkerSize = 40; % probably could have used smaller marker size with different shape but oh well

an = annotation('textbox', [.124 .874 .5 .1]); % small textbox annotation to show scale of graph:
an.LineStyle = 'none';
an.FontSize = 12;
an.String = 'x10^7';

L = legend('Experimental Data'); % can't forget the legend:
L.Position = [.19 .84 .2 .06]; % I spent entirely too much time perfecting this
L.FontSize = 14;




saveas(gcf, '../results/graphWithErrorBars.png');


% Done, thank you Amir for a great class!











