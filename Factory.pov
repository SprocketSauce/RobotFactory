#include "RobotBody.pov"

light_source {
	<5,20,-5>
	color rgb<1,1,1>
	spotlight
	point_at <0,0,0>
}

light_source {
	<5,20,25>
	color rgb<1,1,1>
	spotlight
	point_at <0,0,30>
}

/*light_source { 
	<1,7,-8> 
	color rgb<1,1,1>
}

light_source {
	<1,7,22>
	color rgb<1,1,1>
}*/

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
	object { BeltSegment }
	
	object { 
		BeltSegment
		translate <0,0,4.2> 
	}
	
	object { 
		BeltSegment
		translate <0,0,-4.2> 
	}
}

#declare NineSegments =
union {
	object{ ThreeSegments }

	object {
		ThreeSegments
		translate <0,0,12.6>
	}
	
	object {
		ThreeSegments
		translate <0,0,25.2>
	}
}

#declare TwentySevenSegments =
union {
	object { NineSegments }

	object { 
		NineSegments
		translate <0,0,37.8>
	}
	
	object { 
		NineSegments
		translate <0,0,75.6>
	}
}

object { TwentySevenSegments }

union {
	object { body }
	object { 
		body
		translate <0,0,10>
	}
	object { 
		body
		translate <0,0,20>
	}
	object { 
		body
		translate <0,0,30>
	}
	object { 
		body
		translate <0,0,40>
	}
	object { 
		body
		translate <0,0,50>
	}
	object { 
		body
		translate <0,0,60>
	}
	object { 
		body
		translate <0,0,70>
	}
	object { 
		body
		translate <0,0,80>
	}
	object { 
		body
		translate <0,0,90>
	}
	object { 
		body
		translate <0,0,100>
	}
}

// Back wall
plane
{
	<0,0,1>
	110
	texture
	{
		pigment { color rgb<1,1,1> }
	}
}

// Belt skirting left
box {
	<-2.8,0.8,-10>
	<-2,-0.8,10000>
	texture {
		pigment { color rgb<1,1,1> }
	}
}

// Belt skirting right
box {
	<2.8,0.8,-10>
	<2,-0.8,10000>
	texture {
		pigment { color rgb<1,1,1> }
	}
}
