%%%%%%%%%%%%%%%%% Assign value from domain to a component attribute %%%%%%%%%%%%%%%%%%%%%%%%

%Every value from the domain of a component attribute may be assigned to it
{assign(Component,Attribute,Value): domain(Component,Attribute,Value)}.

%No component attribute can have more than one value
:- assign(Component,Attribute,Value1), assign(Component,Attribute,Value2), Value1 < Value2.

%%%%%%%%%%%%%%%%%%%%%% Component extraction %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

component(Component):- assign(Component,Attribute,Value).

%%%%%%%%%%%%%%%%%%%%%%%%% Attributes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% All the mandatory attributes of the component should be assigned
:- component(Component), mandatory_attribute(Component,Attribute), not assign(Component,Attribute,_).

% The component can't have attributes of the comp type it is not assigned to
:- assign(Component,type,Comp_Type), assign(Component,Attribute,Value), Attribute != type , not attribute(Comp_Type,Attribute,Value).

%The component has all the attributes of the component type it is assigned
:- assign(Component,type,Comp_Type), attribute(Comp_Type,Attribute,Value), not assign(Component,Attribute,Value).

%%%%%%%%%%%%%%%%%%%%%%%%%%% Requires %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%A component requires another component
:- require_com_com(Component1,Component2), component(Component1), not component(Component2).

%A component requires another component with certain attribute
:- require_com_atr(Component1,(Component2,Attribute,Value)), component(Component1), not assign(Component2,Attribute,Value).

%A component  with certain attribute requires another component
:- require_atr_com((Component1,Attribute,Value),Component2), assign(Component1,Attribute,Value), not component(Component2).

%A component  with certain attribute requires another component with certain attribute
:- require_atr_atr((Component1,Attribute1,Value1),(Component2,Attribute2,Value2)),
  assign(Component1,Attribute1,Value1),
   not assign(Component2,Attribute2,Value2).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Incompatability %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%One component is incompatible with another component
:- incompatible_com_com(Component1,Component2), component(Component1), component(Component2).

%One component with certain attribute is incompatible with another component
:- incompatible_com_atr(Component1,(Component2,Attribute,Value)), component(Component1), assign(Component2,Attribute,Value).

%One component with certain attribute value is incompatible with another component with some other attribute value
:- incompatible_atr_atr((Component1,Attribute1,Value1),(Component2,Attribute2,Value2)),
   assign(Component1,Attribute1,Value1),
   assign(Component2,Attribute2,Value2).


%%%%%%%%%%%%%%%%%%%%%%%%%%%% User Req%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A component that user requires has to be present in the configuration
:- user_com(req,Component), not component(Component).

% A component that user doesn't require can't be present in the configuration
:- user_com(nreq,Component), component(Component).

% If a user requires a component with certain attributes, then it has to be present in the configuration
:- user_atr(req,(Component,Attribute,Value)), not assign(Component,Attribute,Value).

% A component with certain attributes not required by the user can't be present in the configuration
:- user_atr(nreq,(Component,Attribute,Value)), assign(Component, Attribute,Value).

