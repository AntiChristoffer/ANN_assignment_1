clc;
classA(1,:) = randn(1,100) .* 0.5 + 1.0;
classA(2,:) = randn(1,100) .* 0.5 + 0.5;
classB(1,:) = randn(1,100) .* 0.5 - 1.0;
classB(2,:) = randn(1,100) .* 0.5 + 0.0;

%disp(classA);
patterns = [classA, classB];

%disp(patterns);


targetsA(1,:) = ones(1,100);
targetsA(2,:) = ones(1,100);
targetsB(1,:) = -ones(1,100);
targetsB(2,:) = -ones(1,100);

%disp(targetsA);
%disp(targetsB);
targets = [targetsA, targetsB];

%disp(targets);

fprintf('Before permutation')
disp(patterns);
permute = randperm(200);
patterns = patterns(:, permute);
fprintf('After permutation');
disp(patterns);
targets = targets(:, permute);
%disp(targets);
%{
plot(patterns(1, find(targets>0)),
patterns(2, find(targets>0)), '*', 
patterns(1, find(targets<0)),
patterns(2, find(targets<0)), '+');
%}