% Requires com > atr 
% basket needs basket_support of frame to be true 

#include "../../bike/inventory/attributes.lp".
#include "../../bike/inventory/comp_domain.lp".

#include "../../bike/requires.lp".

#include "../../encoding/preprocessing.lp".
#include "../../encoding/configuration.lp".


#show.
#show component(C):component(C), C= (basket;frame).
#show assign(C,A,V):assign(C,A,V), C= frame,A= basket_support,V=true.

