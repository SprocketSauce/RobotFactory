#include "RobotBody.pov"

// Spotlights
light_source {
	<2,20,-5>
	color rgb<1,1,1>
	spotlight
	point_at <0,0,0>
}

light_source {
	<2,20,25>
	color rgb<1,1,1>
	spotlight
	point_at <0,0,30>
}

light_source {
	<2,20,55>
	color rgb<1,1,1>
	spotlight
	point_at <0,0,60>
}

light_source {
	<2,20,85>
	color rgb<1,1,1>
	spotlight
	point_at <0,0,90>
}

light_source {
	<0,20,100>
	color rgb<1,1,1>
	spotlight
	point_at <0,10,115>
}

// Previous room light
light_source {
	<0,11.7,120>
	color rgb<0,0.25,0.5>
}

#declare Concrete =
texture { 
	pigment { 
		granite 
		turbulence 1.5 
		color_map {
			[0  .25 color rgb<1,1,1> color rgb<0.9,0.9,0.9>] 
			[.25  .5 color rgb<1,1,1> color rgb<0.9,0.9,0.9>]
			[.5 .75 color rgb<1,1,1> color rgb<0.9,0.9,0.9>] 
			[.75 1.1 color rgb<1,1,1> color rgb<0.9,0.9,0.9>]
		}
	}
	finish { 
		ambient 0.2 
		diffuse 0.3 
		crand 0.03 
		reflection 0 
	} 
	normal {
		dents .5 
		scale .5 
	}
}

#declare OpaqueGlass =
texture {
	pigment { color rgb<0.8,240/255,1> }
	finish {
		specular 1
		roughness 0.001
		reflection {0.5}
	}
}

// Conveyor Belt
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

union {
	object { TwentySevenSegments }
	
	object {
		TwentySevenSegments
		translate <0,0,113.4>
	}
    
    scale <1,1,1.1905>
	translate <0,0,min(0,-30*clock+20)>
}

// Robots
union {
	object { AnimatedBody }
	
	object { 
		Body
		translate <0,0,10>
	}
	object { 
		Body
		translate <0,0,20>
	}
	object { 
		Body
		translate <0,0,30>
	}
	object { 
		Body
		translate <0,0,40>
	}
	object { 
		Body
		translate <0,0,50>
	}
	object { 
		Body
		translate <0,0,60>
	}
	object { 
		Body
		translate <0,0,70>
	}
	object { 
		Body
		translate <0,0,80>
	}
	object { 
		Body
		translate <0,0,90>
	}
	object { 
		Body
		translate <0,0,100>
	}
	object {
		Body
		translate <0,0,110>
	}
	object {
		Body
		translate <0,0,120>
	}

	translate <0,0,min(0,-30*clock+20)>
}

// Back wall
difference {
	box
	{
		<-9999,-9999,114.9>
		<9999,9999,1000>
		texture
		{
			pigment { color rgb<1,1,1> }
		}
	}
	
	prism {
		-100, 100, 8
		<-2.8,-0.8>
		<-4.8,1.8>
		<-4.8,9.8>
		<-2.8,11.8>
		<2.8,11.8>
		<4.8,9.8>
		<4.8,1.8>
		<2.8,-0.8>
		rotate <-90,0,0>
		translate <0,0,109.5>
		texture {
			pigment { color rgb <1,1,1> }
		}
	}
}

// Back wall hazard light
#declare HazardLight = 
union {	
	cone {
		<-13,6,115>, 0.8
		<-13,6,114>, 0.7
		texture { ClearGlass }
	}
	
	light_source {
		<-13,6,114.5>
		color rgb<1,0.5,0>
		spotlight
		point_at <-12,6,114.5>
		radius 15
	}

	light_source {
		<-13,6,114.5>
		color rgb<1,0.5,0>
		spotlight
		point_at <-14,6,114.5>
		radius 15
	}

	translate <13,-6,0>
	rotate <0,0,1080*clock>
	translate <-13,6,0>
}

object { HazardLight }

object { 
	HazardLight
	translate <26,0,0>
}

// Lower side wall
#declare wall =
union {
	difference {
		box {
			<0,9999,-10>
			<-9999,-9999,115>
			rotate <0,0,55>
			translate <0,-20,0>
		}

		box {
			<-15,0,-10>
			<9999,-9999,115>
		}
	}
	
	plane {
		<1,0,0>
		0
		translate <-25,0,0>
		texture { OpaqueGlass }
	}
		
	texture { Concrete }
}

object { wall }

object {
	wall
	scale <-1,1,1>
}

// Belt skirting left
box {
	<-2.8,0.8,-10>
	<-2,-0.8,10000>
	texture {
		pigment { 
			color rgb<1,1,1> 
		}
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

// Doorframe
difference
{
	prism {
		0, 2, 8
		<-2.8,-0.8>
		<-4.8,1.8>
		<-4.8,9.8>
		<-2.8,11.8>
		<2.8,11.8>
		<4.8,9.8>
		<4.8,1.8>
		<2.8,-0.8>
	}

	prism {
		3, -1, 10
		<-2,-0.8>
		<-2,0.8>
		<-4,1.8>
		<-4,9.8>
		<-2,10.8>
		<2,10.8>
		<4,9.8>
		<4,1.8>
		<2.8,0.8>
		<2.8,-0.8>
	}

	rotate <-90,0,0>
	translate <0,0,115>
	texture {
		pigment { color rgb<0.8,0.8,0.8> }
	}
}

// Sliding doors
#declare door =
superellipsoid {
	<0.05,1>
	scale <3,100,0.5>
	translate <3,0,116>
	pigment { color rgb<1,1,1> }
	finish { phong 0.5 }

	translate <min(max(30*clock-20,0),5),0,0>
	translate <max(min(-30*clock+25,0),-5),0,0>
}

object { door }

object {
	door
	scale <-1,1,1>
}

// Fog
fog {
	color rgb<132/255,226/255,249/255>
	distance 50
	fog_type 2
	fog_offset -15
	fog_alt 4
	turbulence 50
}

fog {
	color rgb<1,1,1>
	distance 50
	fog_type 2
	fog_offset -30
	fog_alt 6
}

// Grabby claw
#declare claw =
difference {
	box {
		<0.3,8.75,0.12>
		<1.1,7.8,-0.12>
	}

	box {
		<0.29,8.55,0.13>
		<0.9,8,-0.13>
	}

	box {
		<0.75,8.5,0.13>
		<-1,7,-0.13>
	}

	texture { Aluminium }

	translate <-0.3,-8.65,0>
	rotate <0,0,min(max(clock*90-30,0),30)>
	translate <0.3,8.65,0>
}

// Grabby claw axle
union {
	cylinder {
		<0,11,0>
		<0,8.75,0>
		0.1
		texture { Aluminium }
	}

	box {
		<0.3,8.5,0.15>
		<-0.3,8.8,-0.15>
		texture { Aluminium }
	}

	cylinder {
		<0.3,8.65,0.15>
		<0.3,8.65,-0.15>
		0.15
		texture { Aluminium }
	}

	cylinder {
		<-0.3,8.65,0.15>
		<-0.3,8.65,-0.15>
		0.15
		texture { Aluminium }
	}
	
	object { claw }

	object {
		claw
		scale <-1,1,1>
	}

	translate <0,3,0>
	translate <0,max(clock*-9,-3),0>
	translate <0,min(max(0,clock*18-9),3),0>
}

object { 
	head
	translate <0,3,0>
	translate <0,max(clock*-9,-3),0>
	translate <0,0,min(0,-30*clock+20)>
}
