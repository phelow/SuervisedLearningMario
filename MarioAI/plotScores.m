% Parse and plot the scored from the learning iterations.
function plotScores(numIter)

N = round(numIter / 10);
ind = N : numIter - N;

scores = zeros(numIter, 1);
filename = 'LearningScores.txt';
lines = textread(filename, '%s', 'delimiter', '\n');
for i = 1:numIter
    scores(i) = str2num(lines{i});
end
plot(scores(ind), '-', 'Linewidth', 1.5);
fprintf('*** The mean score is %d *** \n', round(mean(scores)));
fprintf('*** The std is %d *** \n', round(std(scores)));

hold on

filtered_scores = filter(ones(1, N) / N, 1, scores);
plot(filtered_scores(ind), 'r', 'Linewidth', 1.5);
hold off
end