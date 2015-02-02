clc;
clear;
sepdata;
epochs = 20;
n = 0.001;
%disp(targets);
[insize, ndata] = size(patterns);
%disp(insize);
%disp(ndata);
[outsize, ndata] = size(targets);
%disp(outsize);
%disp(ndata);

Xtra = ones(1, ndata);
X = [Xtra; patterns];
[Xsize, ndata] = size(X);
%disp(Xsize);
%disp(ndata);
%disp(X);
W = randn(1, insize+1) .*0.05;
disp(W);

%?W =??(WX?T)XT
%disp(['Dimensions of patterns: ', num2str(insize), ' * ' num2str(ndata)]);
%disp(['Dimensions of targets: ', num2str(outsize), ' * ' num2str(ndata)]);
%disp(['Dimensions of patterns: ', num2str(insize), ' * ' num2str(ndata)]);
xTrans = transpose(X);
%Wtest=((W*X));

for k=1:epochs
    %disp(['Run no. ',num2str(k)]);
    deltaW = -n.*((W*X)-targets)*xTrans;
    disp(deltaW);
    W = W+deltaW;
    %disp(['W after run no. ', num2str(k), ': ', num2str(W)]);
    axis ([-2, 2, -2, 2], 'square');
    p = W(1,2:3);
    k = -W(1, insize+1) / (p*p');
    l = sqrt(p*p');
    plot (patterns(1, find(targets>0)), ...
          patterns(2, find(targets>0)), '*', ...
          patterns(1, find(targets<0)), ...
          patterns(2, find(targets<0)), '+', ...
          [p(1), p(1)]*k + [-p(2), p(2)]/l, ...
          [p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
drawnow;
end