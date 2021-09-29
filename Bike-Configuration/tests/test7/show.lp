% Every component thats exists needs to have a type

#include "../../bike/inventory/attributes.lp".
#include "../../bike/inventory/comp_domain.lp".

#include "../../encoding/configuration.lp".
#include "../../encoding/preprocessing.lp".

#show.
#show component(C):component(C), C=frame.
#show assign(C,A,V):assign(C,A,V), C= frame,A=type.