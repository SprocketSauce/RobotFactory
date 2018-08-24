#include "RobotBody.pov"

/*light_source {
	<5,20,0>
	color rgb<1,1,1>
	spotlight
	point_at <0,0,0>
}

light_source {
	<-5,20,0>
	color rgb<1,1,1>
	spotlight
	point_at <0,0,0>
}*/

light_source { 
	<1,7,-8> 
	color rgb<1,1,1>
	//area_light <5, 0, 0> <0, 5, 0> 5 5
	 
}

#declare BeltSegment =
difference {
	union {
		box {
			<2,0,2>
			<-2,-0.1,-2>
		}
		
		prism {
			0, -0.1, 4
			<-1.2,-2>
			<-0.4,-2.8>
			<0.4,-2.8>
			<1.2,-2>
		}
	}
	
	prism {
		0.1, -0.2, 4
		<-1.1,2.1>
		<-0.4,1.2>
		<0.4,1.2>
		<1.3,2.1>
	}
		
	texture { 
		pigment {
			gradient <0.1,0,0>
			color_map {
				[0 color rgb<0.3,0.3,0.3>]
				[0.9 color rgb<0.3,0.3,0.3>]
				[0.9 color rgb<0.4,0.4,0.4>]
				[1 color rgb<0.4,0.4,0.4>]
			}
			scale <0.2,1,1>
		}
		normal { bumps 0.4 scale 1 }
	}
}   

#declare ThreeSegments =
union {
	object{ BeltSegment }
	
	object{ 
		BeltSegment
		translate <0,0,4.2> 
	}
	
	object{ 
		BeltSegment
		translate <0,0,-4.2> 
	}
}

object { ThreeSegments }