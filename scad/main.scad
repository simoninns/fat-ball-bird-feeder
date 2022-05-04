/************************************************************************

    main.scad
    
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

// Local includes
include <body_top.scad>
include <body_base.scad>
include <bird_ball.scad>

// Rendering resolution
$fn=30;

// Select rendering parameters
for_printing = "Display"; // [Display, Printing]

// Body parameters
display_body_top = "No"; // [Yes, No]
display_body_base = "No"; // [Yes, No]
select_body_size = "1"; // [1, 2]

// Assist parameters
display_bird_ball = "No"; // [Yes, No]

// Render the required items
module main()
{
    // Main options
    toPrint = (for_printing == "Printing") ? true:false;

    // Display selections
    d_body_top = (display_body_top == "Yes") ? true:false;
    d_body_base = (display_body_base == "Yes") ? true:false;
    d_bird_ball = (display_bird_ball == "Yes") ? true:false;

    isTwoBall = (select_body_size == "2") ? true:false;

    // Body rendering
    if (d_body_top) render_body_top(toPrint, isTwoBall);
    if (d_body_base) render_body_base(toPrint, isTwoBall);

    // Assist rendering
    if (d_bird_ball) render_bird_ball(toPrint, isTwoBall);
}

main();