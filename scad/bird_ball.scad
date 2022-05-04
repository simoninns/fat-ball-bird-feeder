/************************************************************************

    bird_ball.scad
    
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

module render_bird_ball(toPrint, isTwoBall)
{
    if (!toPrint) color([0.7,0.7,0.7]) {
        staggered_sphere(d=55, circum=true, $fn=20);
        if (isTwoBall) move([0,0,60]) staggered_sphere(d=55, circum=true, $fn=20);
    }
}