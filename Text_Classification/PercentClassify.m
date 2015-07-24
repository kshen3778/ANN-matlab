function [percenterror] = PercentClassify(testdata, testtargets,N_hidden,W_1, W_2)

%calculate the error on the test set after learning weights
[test_error,test_output] = function_e(testdata, testtargets, N_hidden, W_1, W_2);

N = size(testdata,1);

[a b] = max(test_output,[],2);
test_o = zeros(size(test_output));

for x = 1:N,
    test_o(x,b(x)) = 1;
end

percenterror = (1/2)*(1/N)*sum(sum(abs(test_o-testtargets)));
end

