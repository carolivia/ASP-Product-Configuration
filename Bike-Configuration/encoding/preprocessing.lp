%A part of a whole component requires the whole component
require_com_com(Part,Whole):-partof(Whole,Part,_).

%A whole component requires all it's mandatory components 
require_com_com(Whole,Part):-partof(Whole,Part,mandatory).

%type is a mandatory attribute of every component
mandatory_attribute(Component,type):- domain(Component,_,_).

%All the attributes of a comp_type are in the domain of the component it is assigned to
domain(Component,Property,Value):- domain(Component,type,Comp_Type), attribute(Comp_Type,Property,Value).