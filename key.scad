/*
Keys for containers for: wipes, toilet paper, absorbent paper, soap, etc.
*/

/*
project: https://github.com/undercustodian/box-service-keys
author: https://github.com/undercustodian
license: This work adheres to the general license of the project to
which it belongs which is Commons Attribution 4.0 International.
https://github.com/undercustodian/box-service-keys/blob/main/LICENSE

This work is licensed under the Creative Commons Attribution 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/ or
send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
*/


/* [Hidden] */
//$fa = 1;
//$fs = 0.4;


/* [Basic] */

// Zoom in on the handle
zoom = 1; // [0:0.01:10]

/* [Bevel the Handle] */
// bevel radius
br = 1; // [0:0.01:10]


/* [Handle] */

//thickness of the cylinder
ht = 2; // [0:0.1:50]
// handle width
hw = 27; // [0:0.1:100]
// handle length
hl = 16; // [0:0.1:100]
// height of the handle
hh = 8; // [0:0.1:100]


/* [hole in the handle] */

// hole radius
hhr = 3; // [0:0.1:30]
// thickness around the hole
hhat = 0; // [0:0.01:10]
// transverse displacement of the hole
hhx = -10; // [-100:0.1:100]
// vertical displacement of the hole
hhz = 8; // [0:0.1:100]


/* [neck] */
// neck radius
nr = 2 ; // [0:0.01:10]
// height of the neck
nh = 0; // [0:0.1:50]



module handle(){
    rotate([90,0,0]) minkowski(){
        difference(){
            hull(){
                scale([zoom,zoom,1]){
                    translate([0,hh,0]) resize([hw,hl,ht])
                    cylinder(h=ht, r=200, center=true);
                    translate([hhx,hhz,0]) cylinder(h=ht, r=hhr+hhat, center=true);
                }
                scale([zoom,1,1]) cylinder(h=ht,r=nr, center=true);
            }
            scale([zoom,zoom,1])translate([hhx,hhz,0])
            cylinder(h=2*ht, r=hhr, center=true);
        }
        sphere(r=zoom*br);
    }
}

handle();
