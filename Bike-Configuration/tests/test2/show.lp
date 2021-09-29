% Incompatibility test

#include "../../bike/inventory/attributes.lp".
#include "../../bike/inventory/comp_domain.lp".

#include "../../bike/incompatibility.lp".


#include "../../encoding/preprocessing.lp".
#include "../../encoding/configuration.lp".


#show.
#show assign(C,A,V):assign(C,A,V), C=(front_wheel;rear_wheel),A=size.