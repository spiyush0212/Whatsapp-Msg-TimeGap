% EXPERIMENT 1

clc;
clear;
close all;

dataSet = readvars('Piyush_dataSet_2019316','Range','A1:A30');

sizeData = length(dataSet);
sumData = sum(dataSet);
avgTime = sumData / sizeData;

hg = histfit(dataSet, 9, "Nakagami");

hg(1).FaceColor = [.1 .9 .9];
hg(2).Color = [.9 .2 .7];
title("HISTOGRAM");
xlabel("Time Gap (in secs)");
ylabel("Frequency");

pd = fitdist(dataSet,'Nakagami');
Probability = cdf(pd , avgTime);

timeGaps = readvars('Piyush_dataSet_2019316','Range','B1:B10');

heads_count = 0;
tails_count = 0;

for i = 1:size(timeGaps)
    if ( timeGaps(i) < avgTime )
        heads_count = heads_count + 1;
    else 
        tails_count = tails_count + 1;
    end
end

disp("EXPERIMENT 1");
disp("The EXPECTED TIME GAP is " + avgTime);
% The PROBABILTY that the time elapsed until your next message is less than the expected time gap is
disp("The PROBABILTY is " + Probability);
disp("No. of HEADS is " + heads_count);
disp("No. of TAILS is " + tails_count);