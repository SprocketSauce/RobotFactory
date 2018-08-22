#declare GreyMetal = texture { pigment { rgb <0.2,0.2,0.2> } };

camera {
	location <3,6.5,-10>
	look_at <0,4,0>
	up <0,1,0>
	right<1,0,0>
}

light_source { 
	<1,7,-8> 
	color rgb<1,1,1>
	//area_light <5, 0, 0> <0, 5, 0> 5 5
	 
}   

// ===== COLOURED OBJECTS =====
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
	}
	
	// Right upper arm
	difference {
		box {
			<-0.95,6,0.3>
			<-1.15,4.75,-0.3>
		}
		
		cylinder {
			<-0.9,4.75,0>
			<-1.2,4.75,0>
			0.45
		}
	}
	
	// Right elbow
	cylinder {
		<-0.95,4.75,0>
		<-1.15,4.75,0>
		0.3
	}
	
	// Right lower arm
	difference {
		box {
			<-0.95,4.75,0.3>
			<-1.15,3.5,-0.3>
		}
		
		cylinder {
			<-0.9,4.75,0>
			<-1.2,4.75,0>
			0.45
		}
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
				<0.3,1.95,-0.4>
			}
			
			cylinder {
				<0.71,3.45,0>
				<0.29,3.45,0>
				0.55
			}
			
			cylinder {
				<0.71,1.95,0>
				<0.29,1.95,0>
				0.55
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

	texture {
		pigment { color rgb<100/255,1,231/255> }
		finish { specular 1 roughness 0.01 }
	}
}

// ===== GREY OBJECTS =====

union {
	
	// Upper torso shaft
	cylinder {
		<-1,6.5,0>,
		<1,6.5,0>,
		0.44
	} 
	
	// Left upper arm connector
	box {
		<1,4,0.25>
		<1.1,6.5,-0.25>
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
	
	texture {
		pigment { color rgb<0.2,0.2,0.2> }
	}
}