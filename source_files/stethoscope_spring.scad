/*
print with 4 layers of vertical shells


*/


ro=20;

// Create the first leaf (outside) of the spring

module outerSpring() {
    difference(){
        cylinder(r=ro+1,h=10,$fn=60); //outer diameter
        cylinder(r=ro-2,h=10,$fn=60); //inner diameter
    }
}

// Create the second leaf (inside) of the spring
module innerSpring() {
    translate([0,8,0]) 
    difference(){
        cylinder(r=ro+2,h=10,$fn=60); //outer diameter
        cylinder(r=ro,h=10,$fn=60); //inner diameter
    }
}


// Create connector and hole for eartube.
module hole($rotate){
    radius = 7;
    difference() {
        hull(){
            translate([-radius,-radius,0]) cube([2,10,20]);
            translate([1,.2,0])scale([1.2,1.05,1])cylinder(r=radius,h=12);
        }
        translate([1,0,0]) rotate([0,0,$rotate]) union(){hull(){
        translate([0,0,-10])scale([1.2,1,1])sphere(3.7
            ,$fn=10);//ear tube diameter
    translate([0,0,30])scale([1.2,1,1])sphere(3.7,$fn=10);
       }//ear tube diameter
       
       translate([-.6,-1.2-3.5,0])cube([1.2,1.2,3]);//key pitch
   }
    }
 }

// Create the final piece

    difference(){

        // Springs
        union() {
            outerSpring();
//            innerSpring();
       // cube(1);
            }
        union(){
        // Cuts
        translate([-45,0,0])cube([90,45,10]); //cut centre
        translate([ro+1,-ro,0])cube([90,45,10]); //cut left
        translate([-ro-90-1,-ro,0])cube([90,45,10]); //cut right
    }
}

    // Connectors
    translate([ro+5,30,7]) rotate([90,0,0]) hole(20);
    translate([-ro-5,30,7]) mirror([1,0,0]) rotate([90,0,0]) hole(20);
    
    //Connect connectors to springs
    translate([ro-2,0,0])cube([3,20,10]);
translate([-ro-1,0,0])cube([3,20,10]);