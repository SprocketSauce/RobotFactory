#declare GreyMetal = texture { pigment { rgb <0.2,0.2,0.2> } };

#declare BluePlastic = 
texture {
	pigment { color rgb<90/255,230/255,1> }
	finish { specular 1 roughness 0.007 }
}

#declare ClearGlass =
texture {
	pigment { color rgbt 1 }
	finish {
		specular 1
		roughness 0.001
		reflection {0.5}
	}
}

#declare Aluminium =
texture {
	pigment { color rgb<0.8,0.8,0.8> }
	finish {
		specular 0.5
		roughness 0.05
		metallic
		brilliance 5
		diffuse 0.6
		reflection {0.2}
	}
}

camera {
	location <3,9,-10>
	look_at <0,4,0>
	up <0,1,0>
	right<1,0,0>
}   

// ===== COLOURED OBJECTS =====
#declare body = 
union {
	// Top torso section
	difference {
		cylinder {
			<-1,6,0>,
			<1,6,0>,
			1
		}
		
		union {
			cylinder {
				<-1.1,6,0>,
				<1.1,6,0>,
				0.9
			}
			
			box { 
				<-0.5,6,-0.85>, 
				<0.5,7,0.85>
			}
			
			box { 
				<-1.1,5,-1>, 
				<1.1,6,1>
			}
			
			box {
				<-0.05, 7, 0>
				<0.05, 5, -1>
			}
			
			difference {
			
				cylinder {
					<-0.75,6,0>,
					<-0.7,6,0>,
					1.1
				}
				
				cylinder {
					<-0.75,6,0>,
					<-0.7,6,0>,
					0.97
				}
			}
			
			difference {
					
				cylinder {
					<0.75,6,0>,
					<0.7,6,0>,
					1.1
				}
				
				cylinder {
					<0.75,6,0>,
					<0.7,6,0>,
					0.97
				}
			}
		}
	}
	
	// Right shoulder
	sphere {
		<-1,6.5,0>
		0.44
	}
	
	// Left shoulder
	sphere {
		<1,6.5,0>
		0.44
	}
	
	// Arm definition
	#declare arm =
	union {
		// Left upper arm
		difference {
			box {
				<0.95,6,0.3>
				<1.15,4.75,-0.3>
			}
			
			cylinder {
				<0.9,4.75,0>
				<1.2,4.75,0>
				0.45
			}
		}
		
		// Left upper arm connector
		box {
			<1,4.75,0.25>
			<1.1,6.5,-0.25>
			texture { GreyMetal }
		}
		
		// Left lower arm connector
		box {
			<1,4.75,0.25>
			<1.1,4,-0.25>
			texture { GreyMetal }
		}
		
		// Left elbow
		cylinder {
			<0.95,4.75,0>
			<1.15,4.75,0>
			0.3
		}
		
		// Left lower arm
		difference {
			box {
				<0.95,4.75,0.3>
				<1.15,3.5,-0.3>
			}
			
			cylinder {
				<0.9,4.75,0>
				<1.2,4.75,0>
				0.45
			}
			
			cylinder {
				<0.9,3.1,0>
				<1.2,3.1,0>
				0.5
			}
		}
		
		// Left hand
		difference {
			cylinder {
				<0.9,3.1,0>
				<1.2,3.1,0>
				0.4
			}
			
			cylinder {
				<0.89,3.1,0>
				<1.21,3.1,0>
				0.25
			}
			
			box {
				<0.89,3.1,0.1>
				<1.21,2,-0.1>
			}
		}
	}

	// Left arm
	object { arm }
	
	// Right arm
	object {
		arm
		scale <-1,1,1>
	}

	// Middle torso section 
	difference
	{
		cylinder {
			<0,6.1,0>,
			<0,5,0>,
			0.75
		}
		
		difference {
			union {
				box {
					<-0.5, 6.2, 1>
					<-0.55, 4.9, -1>
				}
				
				box {
					<0.5, 6.2, 1>
					<0.55, 4.9, -1>
				}
			}
			
			cylinder {
				<0, 6.2, 0>
				<0, 4.9, 0>
				0.7
			}
		}
	}
	
	// Middle torso plate
	intersection {
		cylinder {
			<0, 6.1, 0>
			<0, 5, 0>
			0.85
		}
		
		box {
			<0.4, 5.9, 1>
			<-0.4, 5.2, -1>
		}
	}
	
	// Lower torso section				 
	cylinder {
		<0,5,0>,
		<0,4,0>,
		0.6
	}
	
	// Undercarriage
	cylinder {
		<-0.2,3.7,0>,
		<0.2,3.7,0>,
		0.5
	}
	
	#declare leg =
	union {	
		// Upper leg cylinder
		difference {
			cylinder {
				<0.7,3.45,0>,
				<0.3,3.45,0>,
				0.4
			}
			
			box {
				<0.68,3.45,0.4>
				<0.32,3,-0.4>
			}
		}
		
		cylinder {
			<0.68,3.45,0>
			<0.32,3.45,0>
			0.34
			texture { GreyMetal }
		}
		
		// Leg section
		#local section =
		difference {
			box {
				<0.7,3.45,0.4>
				<0.3,1.7,-0.4>
			}
			
			cylinder {
				<0.71,3.45,0>
				<0.29,3.45,0>
				0.5
			}
			
			cylinder {
				<0.71,1.95,0>
				<0.29,1.95,0>
				0.5
			}
			
			#local strip =
			box {
				<0.71,3.5,-0.3>
				<0.66,1.4,-0.2>
			}
			
			object { strip }
			object { 
				strip
				translate <0,0,0.25>
			}
			object { 
				strip
				translate <0,0,0.5>
			}
		}
		
		// Upper leg section
		object { section }
		
		// Knee
		cylinder {
			<0.7,1.95,0>
			<0.3,1.95,0>
			0.4
		}
		
		// Lower leg section
		object {
			section
			translate <0,-1.5,0>
		}

		// Ankle ball
		sphere {
			<0.5,0.45,0>
			0.2
			texture { GreyMetal }
		}

		// Foot claw
		difference {
			sphere {
				<0.5,0,0>
				0.65
			}

			box {
				<0.4,1,1>
				<0.6,-1,-1>
			}

			box {
				<1,1,0.1>
				<-1,-1,-0.1>
			}

			box {
				<2,0,2>
				<-2,-1,-2>
			}

			box {
				<0.1,1,1>
				<-1,-1,-1>
			}

			box {
				<0.9,1,1>
				<2,-1,-1>
			}

			cylinder {
				<0.5,1,0>
				<0.5,-1,0>
				0.3
			}

			cylinder
			{
				<-1,0,0>
				<1,0,0>
				0.2
			}
		}
		
		// Upper leg struts
		box {
			<0.63,3.45,0.3>
			<0.53,2.5,-0.3>
			texture { GreyMetal }
		}
		
		box {
			<0.47,3.45,0.3>
			<0.37,2.5,-0.3>
			texture { GreyMetal }
		}

	}
	
	object { leg }
	
	object {
	    leg
		scale <-1,0,0>
	}
	
	// ===== GREY OBJECTS =====

	union {
		
		// Upper torso shaft
		difference {
			cylinder {
				<-1,6.5,0>,
				<1,6.5,0>,
				0.44
			}
		}
		
		// Head receptacle
		cylinder {
			<0,6.5,0>
			<0,7,0>
			0.4
		} 
		
		// Right upper arm connector
		box {
			<-1,4,0.25>
			<-1.1,6.5,-0.25>
		}
		
		// Leg shaft
		cylinder {
			<-0.5,3.45,0>,
			<0.5,3.45,0>,
			0.1
		}
		
		texture { GreyMetal }
	}
	
	texture { BluePlastic }
}

//object { body }

// ===== HEAD =====
#declare head =
union {
	// Main unit
	difference {
		
		// Shell
		superellipsoid {
			<0.5,0.15>
			scale <0.7,0.45,0.7>
		}
		
		// Inner section
		superellipsoid {
			<0.65,0.15>
			scale <0.6,0.4,0.6>
		}
		
		// Octagonal cutout
		intersection {
			box {
				<0.45,0.45,-1>
				<-0.45,-0.45,0>
			}
			
			box {
				<0.45,0.45,-1>
				<-0.45,-0.45,0>
				rotate <0,0,45>
			}
			
			scale<1.2,0.7,1>
		}
		
		// Strips
		box {
			<0.45,1,1>
			<0.4,-1,-1>
		}
	
		box {
			<-0.45,1,1>
			<-0.4,-1,-1>
		}
	}
	
	// Head interior
	superellipsoid {
		<0.65,0.25>
		scale <0.55,0.4,0.55>
		texture { GreyMetal }
	}
	
	// Mouth section
	difference {
		superellipsoid {
			<0.5,0.25>
			scale <0.45,0.15,0.4>
			texture { Aluminium }
		}
		
		box {
			<0.25, 0.05, -1>
			<-0.25, 0.03, 0>
		}
		
		box {
			<0.25, 0.01, -1>
			<-0.25, -0.01, 0>
		}
		
		box {
			<0.25, -0.03, -1>
			<-0.25, -0.05, 0>
		}
		
		translate <0,-0.5,-0.35>
	}
	
	#declare facelight =
	union {
		cylinder {
			<0,0,-0.57>
			<0,0,-0.53>
			0.25
			texture { pigment { color rgb<0,0,0> } }
		}
		
		sphere {
			<0,0,-0.6>
			0.25
			texture { ClearGlass }
			interior { 
				ior 1.5
			}
		}
			
		light_source {
			<0,0,-0.6>
			color rgb<0.5*clock,0.5*clock,1*clock>
			looks_like {
				sphere {
					<0,0,0>
					0.07
					texture { 
						pigment { color rgb <1*clock,1*clock,1*clock> }
						finish { ambient rgb <0.5*clock,0.5*clock,1*clock> }
					}
				}
			}			
		}
	}
	
	cylinder {
		<0,0,0>
		<0,-0.8,0>
		0.3
		texture { GreyMetal }
	}
	
	cone {
		<0,-0.8,0>
		0.3
		<0,-1.1,0>
		0.15
		texture { GreyMetal }
	}
    
    difference {
		cylinder {
			<0,-1.1,0>
			<0,-1.6,0>
			0.12
		}
		
		box {
			<-0.04,-1.2,1>
			<0.04,-1.7,-1>
		}
		
		texture { 
			Aluminium
			pigment { color rgb<1,0.8,0> } 
		}
	}
	
	object { facelight }
	
	object {
		facelight
		scale <0.5,0.5,0.5>
		translate <-0.37,0,-0.27>
	}
	
	object {
		facelight
		scale <0.5,0.5,0.5>
		translate <0.37,0,-0.27>
	}
	
	translate <0,7.8,0>
		
	texture { BluePlastic }
}

object { head }
