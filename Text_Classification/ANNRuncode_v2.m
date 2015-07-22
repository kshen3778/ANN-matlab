clear;
load 'assign3v6.mat';
N_hidden = 4;
learningrate =0.008;

%Randomizing and normalizing weights between inputs and hidden neurons, 
%as well as weights between hidden neurons and outputs
rand('twister',5489)

W_1 = 0.01*rand(size(traindata,2)+1,N_hidden);
W_2 = 0.01*rand(N_hidden+1,size(traintargets,2));

%number of iterations set to 30
for x=1:200,
    
    if x == 50,
        learningrate = 0.007;
    else x == 150,
        learningrate = 0.004;
    end
    
    [neg_loglike(x),output_y, dE_dw1, dE_dw2] = function_e(traindata, traintargets, N_hidden, W_1, W_2);
    W_1 = W_1 - learningrate*dE_dw1;
    W_2 = W_2 - learningrate*dE_dw2;
end

%calculates error based on new weights
[percenterror] = PercentClassify(testdata, testtargets,N_hidden,W_1, W_2)*100