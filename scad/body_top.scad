/************************************************************************

    body_top.scad
    
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

module body_top()
{
    // Thread
    move([0,0,36]) {
        difference() {
            threaded_rod(d=63-0.5, l=8, pitch=3, bevel=true);
            cyl(h=12, d=57);
        }
    }

    // Thread attachment
    move([0,0,40]) {
        difference() {
            cyl(h=5, d=61);
            cyl(h=6, d=57);
        }
    }

    // Roof
    difference() {
        hull() {
            move([0,0,34]) difference() {
                cyl(h=4, d=90 + 10, $fn=6);
                cyl(h=5, d=81 + 10, $fn=6);
            }

            move([0,0,54]) difference() {
                cyl(h=4, d=23 - 5, $fn=6);
                cyl(h=5, d=16 - 5, $fn=6);
            }
        }

        hull() {
            move([0,0,33]) difference() {
                cyl(h=4, d=90 + 10 - 4, $fn=6);
                cyl(h=5, d=81 + 10 - 4, $fn=6);
            }

            move([0,0,50]) difference() {
                cyl(h=4, d=23 - 4 - 5, $fn=6);
                cyl(h=5, d=16 - 4 - 5, $fn=6);
            }
        }
    }

    // Hook
    move([0,0,60]) {
        cyl(h=10,d=10, $fn=6);

        move([0,0,7]) {
            xrot(90) zrot(90) difference() {
                cyl(h=4, d=23 - 4 - 5, $fn=6);
                cyl(h=5, d=16 - 2 - 5, $fn=6);
            }
        }
    }
}

module render_body_top(toPrint,isTwoBall)
{
    if (isTwoBall) {
        if (toPrint) {
            move([0,0,-32]) body_top();
        } else {
            move([0,0,54]) color([0.2,0.2,0.2]) body_top();
            //color([1,0.65,0]) body_top();
        }
    } else {
        if (toPrint) {
            move([0,0,-32]) body_top();
        } else {
            color([0.2,0.2,0.2]) body_top();
            //color([1,0.65,0]) body_top();
        }
    }
}