clear all;
close all;
load('cells.mat');

time = [10 12 14 16 18 20 22];

for ifigures = 1:7

    nrow = round(sqrt(length(cells(1,1,:,ifigures)))); % number of subplots to be created in the y direction
    ncol = nrow; % number of subplots to be created in the x direction

    figHandle = figure(); % create a new figure
    figHandle.Position = [0, 0, 900, 1350]; % set the position and size of the figure
    figHandle.Visible = 'on'; % set the visibility of figure in MATLAB
    figHandle.Color = [0.9400    0.9400    0.9400]; % set the background color 


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ADD THE MAIN AXES TO THE FIGURE: 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % main plot specifications
    mainPlotMarginTop = 0.06; % top margin of the main axes in figure
    mainPlotMarginBottom = 0.12; % bottom margin of the main axes in figure
    mainPlotMarginLeft = 0.08; % bottom margin of the main axes in figure
    mainPlotMarginRight = 0.1; % right margin of the main axes in figure
    mainPlotPositionX = 0.05; % the x coordinate of the bottom left corner of the main axes in figure
    mainPlotPositionY = 0.08; % the y coordinate of the bottom left corner of the main axes in figure
    mainPlotWidth = 1 - mainPlotMarginRight - mainPlotPositionX; % the width of the main axes in figure
    mainPlotHeight = 1 - mainPlotMarginTop - mainPlotPositionY; % the height of the main axes in figure
    mainPlotTitleFontSize = 12;
    mainPlotAxisFontSize = 12;

    mainPlot = axes(); % create a set of axes in this figure. 
    mainPlot.Color = 'none'; % set color to none
    mainPlot.Position = [ mainPlotPositionX mainPlotPositionY mainPlotWidth mainPlotHeight ]; % set position of the axes
    mainPlot.XLim = [0 1]; % set X axis limits
    mainPlot.YLim = [0 1]; % set Y axis limits
    mainPlot.XLabel.String = 'Voxel Number in X Direction'; % set X axis label
    mainPlot.YLabel.String = 'Voxel Number in Y Direction'; % set Y axis label
    mainPlot.XTick = []; % remove the x-axis tick marks
    mainPlot.YTick = []; % remove the y-axis tick marks
    mainPlot.XAxis.Visible = 'off'; % hide the x-axis line, because we only want to keep the x-axis label
    mainPlot.YAxis.Visible = 'off'; % hide the y-axis line, because we only want to keep the y-axis label
    mainPlot.XLabel.Visible = 'on'; % make the x-axis label visible, while the x-axis line itself, has been turned off;
    mainPlot.YLabel.Visible = 'on'; % make the y-axis label visible, while the y-axis line itself, has been turned off;
    mainPlot.Title.String = ['Time = ',sprintf('%0.1f',time(ifigures)),' days. Brain MRI slices along Z-direction, Rat W09. No radiation treatment.']; % set the title of the figure
    mainPlot.FontSize = 11; % set the main plot font size
    mainPlot.XLabel.FontSize = mainPlotAxisFontSize; % set the font size for the x-axis in mainPlot
    mainPlot.YLabel.FontSize = mainPlotAxisFontSize; % set the font size for the y-axis in mainPlot
    mainPlot.Title.FontSize = mainPlotTitleFontSize; % set the font size for the title in mainPlot

    
    %subPlot dimensions
    subPlotFontSize = 10;     % the font size for subplots   
    subplotInterspace = 0.03; % space between subplots
    subplotWidth = (1-mainPlotMarginLeft-mainPlotMarginRight-nrow*subplotInterspace)/ncol;   % The width of subplots
    subplotHeight = (1-mainPlotMarginTop-mainPlotMarginBottom-ncol*subplotInterspace)/nrow ; % The height of subplots
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ADD COLORBAR TO THE FIGURE
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % specifications of the color bar to the figure

        colorbarPositionX = 1 - mainPlotMarginRight; % the x-position of the color bar
        colorbarPositionY = mainPlotMarginBottom; % the y-position of the color bar
        colorbarWidth = 0.03; % the width of the color bar
        colorbarHeight = nrow*subplotHeight+(nrow-1)*subplotInterspace; % the height of the color bar
        colorbarFontSize = 13; % the font size of the color bar
        colorLimits = [0,max(max(max(cells(:,:,:))))]; % the color bar limits, the dataset contains numbers between 0 and some large number.

    % now add the color bar to the figure

        axes(mainPlot); % focus on the mainPlot axes, because this is where we want to add the colorbar
        caxis(colorLimits); % set the colorbar limits
        cbar = colorbar; % create the color bar!
        ylabel(cbar,'Number of Tumor Cells'); % now add the color bar label to it
        cbar.Position = [ colorbarPositionX ... Now reset the position for the colorbar, to bring it to the rightmost part of the plot
                          colorbarPositionY ...
                          colorbarWidth ...
                          colorbarHeight ...
                        ];
        cbar.FontSize = colorbarFontSize; % set the fontsize of the colorbar
    
sliceNumber = 0;
for irow = nrow:-1:1
    for icol = 1:ncol
        sliceNumber = sliceNumber + 1;
        subPlot = axes( 'position', [ ... set the position of the axes for each subplot
                                      (icol-1)*(subplotInterspace+subplotWidth) + mainPlotMarginLeft ...
                                      (irow-1)*(subplotInterspace+subplotHeight) + mainPlotMarginBottom ...
                                      subplotWidth ...
                                      subplotHeight ...
                                    ] ...
                      );
                  
        imagesc(cells(:,:,sliceNumber,ifigures),colorLimits);
        hold on;
        subPlot.FontSize = subPlotFontSize;
        if icol ~= 1
        subPlot.YTickLabels = [];
        end
        if irow ~= 1
            subPlot.XTickLabels = [];
        end
        subPlot.Title.String = ['x = ',num2str(sliceNumber)];
        subPlot.CLim = colorLimits;
    end
end
    
         filename = ['../Exams/final/results/figure_zequals_',num2str(time(ifigures)),'.png'];
         saveas(gcf, filename); % save the figure
       
end
