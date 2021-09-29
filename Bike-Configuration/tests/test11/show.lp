% Requires atr > atr test

% If the material of frame is aluminium, then the material of front wheel is aluminium

#include "../../bike/inventory/attributes.lp".
#include "../../bike/inventory/comp_domain.lp".

#include "../../bike/requires.lp".

#include "../../encoding/preprocessing.lp".
#include "../../encoding/configuration.lp".


#show.
#show assign(C,A,V):assign(C,A,V), C= frame,A=material;V=aluminium.
#show assign(C,A,V):assign(C,A,V), C= front_wheel,A=material.
