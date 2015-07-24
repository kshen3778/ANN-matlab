function [p] = OneDLocalizationTest(measurement)

p = ones(1,20)*(1/20); %initial probability
world = [1 0 1 1 0 1 0 1 1 1 0 1 0 1 1 0 0 1 1 0]; %1=wall 0=hole
measurement = [1 0 1 1 0 1 0 1 1 1 0 1 0 1 1 0]; %good example


%for loop to run 1D localization

for k = 1:length(measurement)
    
    %1. sense (load measurment)
    SenVal = measurement(k);
    
    %2. calculate p based on measurment
    p = sense(world, p, SenVal); %increases probability/confidence (sharpen peaks)
    
    plot(p)
    pause;
    %3. move robot one block (assume this happens in sim without sending the
    %actual command)
 
    %4. calculate p based on robot moving one block
    p = move(p); %when you move your probability/confidence reduces (smoothes peaks)
    
    %end
end

end

%sense(world,p,SenVal):
%takes in current probability and most recent measurement and updates its
%new belief(pnew)
function pnew = sense(world, p, SenVal)

pHit = 0.6; %wall multiplier factor(stronger weight)
pMiss = 0.2; %opening multiplier factor

pnew = zeros(size(p));
for i=1:length(p)
    hit = world(i)==SenVal;
    if hit == 1
        pnew(i) = p(i)*pHit; %wall
    else
        pnew(i) = p(i)*pMiss; %no wall
    end
end

pnew = pnew/sum(pnew); %normalize(probability sums to one)

%EXPLANATION:
%update probability based on sensor value (i.e. SenVal is 1 or 0)
%normalize probability values to sum up to 1

end

function pnew = move(p)
pH = [0.1 0.8 0.1];

pnew = conv(pH, p); %convolution reduces certainty
pnew = pnew/sum(pnew);
pnew = [pnew(end-2) pnew(2:end-2)];

%EXPLANATION:
%update pnew by performing a convolution with pH and p
%shift p values by 1 because we assumed a movement of one block
%normalize probability values to sum up to 1

end
