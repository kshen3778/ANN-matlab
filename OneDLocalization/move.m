function pnew = move(p)
  pH = [0.1 0.8 0.1];

pnew = conv(pH,p);
pnew = pnew/sum(pnew);
pnew = [pnew(end-2) pnew(2:end-2)];

end
