incompatible_com_atr(basket,(bike,type,mountain_bike)).
incompatible_com_atr(basket,(frame,type,f2)). %frame f2 has no basket support
incompatible_atr_atr((frame,type,f1), (bike,type,mountain_bike)). %frame f1 does not work as a mountain bike
incompatible_atr_atr((frame,type,f3), (bike,type,mountain_bike)). %frame f3 does not work as a mountain bike
incompatible_atr_atr((front_wheel,size,26),(rear_wheel,size,28)).
incompatible_atr_atr((front_wheel,size,28),(rear_wheel,size,26)).

incompatible_atr_atr((frame,type,f1),(cassette,type,c1)).
incompatible_atr_atr((frame,type,f3),(cassette,type,c2)).


incompatible_atr_atr((saddle,type,s1),(seat_cover,type,sc2)).
incompatible_atr_atr((saddle,type,s2),(seat_cover,type,sc1)).