clc;
clear;
gaussdata;
epochs = 600;
n = 0.3;
[outSize, ndata] = size(targets); 
nOut = outSize;
alpha = 0.9;
%Hidden layers
hidden = 15;
%delta-initialization
[insize, ndata] = size(patterns);
w = randn(hidden, insize+1) .*0.05;
v = randn(nOut, hidden+1) .*0.05;

dw = zeros(hidden, insize+1);
dv = zeros(nOut, hidden+1);

%error vector
error=[1,20];



for k=1:epochs
%Forward pass
patternsXtra = [patterns;ones(1,ndata)];
hin = w * patternsXtra;
hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)];
oin = v * hout;
out = 2 ./ (1+exp(-oin)) - 1;

%Backward pass
delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
delta_h = delta_h(1:hidden, :);

%weight update
patternsTrans = transpose(patterns);
tempDW = dw .*alpha;
%deltaHTimespatternsTrans = delta_h * patterns';
dw = (dw .* alpha) - (delta_h * patternsXtra') .* (1-alpha);
dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
w = w + dw .* n;
v = v + dv .* n;

gridsize=xrow;

zz = reshape(out, gridsize, gridsize);
mesh(x,y,zz);
axis([-5 5 -5 5 -0.7 0.7]);
drawnow;
    
disp(sign(w));

error(k) = sum(sum(abs(sign(out) - targets)./2));
end

%disp(error);
