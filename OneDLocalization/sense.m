function pnew = sense(world, p, SenVal)
  pHit = 0.6;
pMiss = 0.2;

pnew = zeros(size(p));

for i =1:length(p)
	 hit = world(i)==SenVal;
        if hit == 1
	  pnew(i) = p(i)*pHit;
        else
	  pnew(i) = p(i)*pMiss;
        end
    end
	pnew = pnew/sum(pnew);

end
