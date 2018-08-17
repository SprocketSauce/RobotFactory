camera {
    location <3,6.5,-10>
    look_at <0,6,0>
    up <0,1,0>
    right<1,0,0>
}

light_source { 
    <1,7,-8> 
    color rgb<1,1,1> 
}                  

// Top torso section
difference {
    cylinder {
        <-1,6,0>,
        <1,6,0>,
        1
        texture {
            pigment { color rgb<1,1,1> }
        }
    }
    
    union {
        cylinder {
            <-1.1,6,0>,
            <1,6,0>,
            0.9
            texture {
                pigment { color rgb<1,1,1> }
            }
        }
        
        box { 
            <-0.5,6,-0.85>, 
            <0.5,7,0.85>
            texture {
                pigment { color rgb<1,1,1> }
            } 
        }
        
        box { 
            <-1.1,5,-1>, 
            <1.1,6,1>
            texture {
                pigment { color rgb<1,1,1> }
            } 
        }
        
        difference {
        
            cylinder {
                <-0.75,6,0>,
                <-0.7,6,0>,
                1.1
                texture {
                    pigment { color rgb<1,1,1> }
                }
            }
            
            cylinder {
                <-0.75,6,0>,
                <-0.7,6,0>,
                0.98
                texture {
                    pigment { color rgb<1,1,1> }
                }
            }
        }
        
        difference {
        
            cylinder {
                <0.75,6,0>,
                <0.7,6,0>,
                1.1
                texture {
                    pigment { color rgb<1,1,1> }
                }
            }
            
            cylinder {
                <0.75,6,0>,
                <0.7,6,0>,
                0.98
                texture {
                    pigment { color rgb<1,1,1> }
                }
            }
        }
    }
}

// Right shoulder
sphere {
    <-1,6.5,0>
    0.44
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Left shoulder
sphere {
    <1,6.5,0>
    0.44
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Left upper arm connector
box {
    <1,6,0.25>
    <1.1,6.5,-0.25>
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Left upper arm
difference {
    box {
        <0.95,6,0.3>
        <1.15,4.5,-0.3>
        texture {
            pigment { color rgb<1,1,1> }
        }
    }
    
    cylinder {
        <0.9,4.5,0>
        <1.2,4.5,0>
        0.5
        texture {
            pigment { color rgb<1,1,1> }
        }
    }
}

// Left elbow
cylinder {
    <0.95,4.5,0>
    <1.15,4.5,0>
    0.3
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Left lower arm
difference {
    box {
        <0.95,4.5,0.3>
        <1.15,3.5,-0.3>
        texture {
            pigment { color rgb<1,1,1> }
        }
    }
    
    cylinder {
        <0.9,4.5,0>
        <1.2,4.5,0>
        0.5
        texture {
            pigment { color rgb<1,1,1> }
        }
    }
}

// Right upper arm
box {
    <-0.95,6,0.4>
    <-1.15,4.5,-0.4>
    texture {
        pigment { color rgb<1,1,1> }
    }
}


// Upper torso shaft
cylinder {
    <-1,6.5,0>,
    <1,6.5,0>,
    0.44
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Middle torso section 
cylinder {
    <0,6.1,0>,
    <0,5,0>,
    0.75
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Lower torso section               
cylinder {
    <0,5,0>,
    <0,4,0>,
    0.6
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Undercarriage
cylinder {
    <-0.2,3.8,0>,
    <0.2,3.8,0>,
    0.5
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Leg shaft
cylinder {
    <-0.5,3.55,0>,
    <0.5,3.55,0>,
    0.1
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Right leg upper cylinder
cylinder {
    <-0.7,3.55,0>,
    <-0.3,3.55,0>,
    0.35
    texture {
        pigment { color rgb<1,1,1> }
    }
}

// Left leg upper cylinder
cylinder {
    <0.7,3.55,0>,
    <0.3,3.55,0>,
    0.35
    texture {
        pigment { color rgb<1,1,1> }
    }
}