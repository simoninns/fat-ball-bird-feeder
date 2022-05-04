/************************************************************************

    body_base.scad
    
    Bird Ball Feeder
    Copyright (C) 2022 Simon Inns
    
    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>
use <BOSL/threading.scad>

module hex_cut(offset)
{
    for(rota=[0: 360/6: 360]) {
        zrot(rota+offset) xrot(90) {
            hull() {
                move([35,0,0]) xcyl(h=1, d=32, $fn=6);
                move([15,0,0]) xcyl(h=1, d=28, $fn=6);
            }
        }
    }
}

module body_base()
{
    // Base
    move([0,0,-31]) zrot(90) {
        difference() {
            cyl(h=4, d=78, $fn=6);
            cyl(h=5, d=66, $fn=6);
        }

        difference() {
            cyl(h=4, d=130, $fn=6);
            cyl(h=5, d=121, $fn=6);
        }

        for(rota=[0: 360/6: 360]) {
            zrot(rota) move([0,43,0]) zrot(90) difference() {
                cyl(h=4, d=23, $fn=6);
                cyl(h=5, d=16, $fn=6);
            }
        }

        difference() {
            cyl(h=4, d=23, $fn=6);
            cyl(h=5, d=16, $fn=6);
        }

        for(rota=[0: 360/6: 360]) {
            zrot(rota) move([22,0,0]) cuboid([23,4,4]);
        }
    }
}

module body_base_top()
{
    // Top
    difference() {
        cyl(h=8, d=67);
        threaded_rod(d=63, l=10, pitch=3, bevel1=true);
    }
}

// Body for 1 ball
module body_base_single()
{
    // Main body
    difference() {
        move([0,0,-62/2]) cyl(h=62, d=67, center=false);
        move([0,0,-62/2 - 1]) cyl(h=70, d=59, center=false);

        // Make the holes
        move([0,0,-12]) {
            move([0,0,26]) hex_cut(30);
            move([0,0,0]) hex_cut(0);
            move([0,0,-26]) hex_cut(30);
        }
    }

    body_base();
    move([0,0,35]) body_base_top();
}

// Body for 2 balls
module body_base_double()
{
    // Main body
    difference() {
        move([0,0,-62/2]) cyl(h=115, d=67, center=false);
        move([0,0,-62/2 - 1]) cyl(h=140, d=59, center=false);

        // Make the holes
        move([0,0,-12]) {
            move([0,0,26 * 3]) hex_cut(30);
            move([0,0,26 * 2]) hex_cut(0);
            move([0,0,26]) hex_cut(30);
            move([0,0,0]) hex_cut(0);
            move([0,0,-26]) hex_cut(30);
        }
    }
    
    body_base();
    move([0,0,35 + 53]) body_base_top();
}

module render_body_base(toPrint, isTwoBall)
{
    if (isTwoBall) {
        if (toPrint) {
            move([0,0,33]) body_base_double();
        } else {
            color([1,0.65,0]) body_base_double();
            //color([0.2,0.2,0.2]) body_base_double();
        }
    } else {
        if (toPrint) {
            move([0,0,33]) body_base_single();
        } else {
            color([1,0.65,0]) body_base_single();
            //color([0.2,0.2,0.2]) body_base_single();
        }
    }
}