#include "textures.inc"

light_source {
	<2,2,-2>
	color rgb<1,1,1>
}

camera {
	location <0,0,-5>
	look_at <0,0,0>
}

sphere {
	<0,0,0>
	2
	texture { Brushed_Aluminum }
}