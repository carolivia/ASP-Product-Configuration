% All the mandatory attributes of a selected component should be present
% Check frame f3 isn't present in the configuration

#include "../../bike/inventory/attributes.lp".
#include "../../bike/inventory/comp_domain.lp".

#include "../../bike/attribute_def.lp".

#include "../../encoding/preprocessing.lp".
#include "../../encoding/configuration.lp".


#show.
#show assign(C,A,V):assign(C,A,V), C=frame, A=type.
