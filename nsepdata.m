clc;
classA(1,:) = [randn(1,50) .* 0.2 - 1.0, ...
               randn(1,50) .* 0.2 + 1.0];
classA(2,:) = randn(1,100) .* 0.2 + 0.3;
classB(1,:) = randn(1,100) .* 0.3 + 0.0;
classB(2,:) = randn(1,100) .* 0.3 - 0.1;
%disp(classA);
patterns = [classA, classB];

%disp(patterns);


targetsA = ones(1,100);
targetsB = ones(1,100) .* -1;

%disp(targetsA);
%disp(targetsB);
targets = [targetsA, targetsB];

%disp(targets);

%fprintf('Before permutation')
%disp(patterns);
permute = randperm(200);
patterns = patterns(:, permute);
%fprintf('After permutation');
%disp(patterns);
targets = targets(:, permute);
%disp(targets);



%{
plot(patterns(1, find(targets>0)),
patterns(2, find(targets>0)), '*', 
patterns(1, find(targets<0)),
patterns(2, find(targets<0)), '+');
%}
