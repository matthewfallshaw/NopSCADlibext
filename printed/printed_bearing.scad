//
// NopSCADlib Copyright Chris Palmer 2019
// nop.head@gmail.com
// hydraraptor.blogspot.com
// contributed by Matt Fallshaw, https://github.com/mattfallshaw
//   with inspiration from radus, https://www.thingiverse.com/thing:3112100
//     Radus 2018, http://vk.com/linuxbashev
//
// This file is part of NopSCADlib.
//
// NopSCADlib is free software: you can redistribute it and/or modify it under the terms of the
// GNU General Public License as published by the Free Software Foundation, either version 3 of
// the License, or (at your option) any later version.
//
// NopSCADlib is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
// without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along with NopSCADlib.
// If not, see <https://www.gnu.org/licenses/>.
//

//
//! 3D printable roller bearings.
//!
//! If a roller bearing has a child it is placed on its top surface, the same as nuts and washers, etc.
//
include <NopSCADlib/core.scad>
include <NopSCADlib/global_defs.scad>

function pb_name(type)           = type[0]; //! Part code without shield type suffix
function pb_bore(type)           = type[1]; //! Internal diameter
function pb_diameter(type)       = type[2]; //! External diameter
function pb_width(type)          = type[3]; //! Width
function pb_cage(type)           = type[4]; //! Gap between rollers and race
function pb_clearance(type)      = type[5]; //! Gap between rollers and race
function pb_roller_count(type)   = 11;      //! Count of rollers
function pb_roller_dia(type)     = (pb_diameter(type)+pb_bore(type))*sin(180/pb_roller_count(type))/2
                                   -pb_clearance(type); //! Diameter of roller rolling surface
function pb_race_thickness(type) = (pb_diameter(type)*(1-sin(180/pb_roller_count(type)))
                                    -pb_bore(type)*(1+sin(180/pb_roller_count(type))))/4
                                   -pb_clearance(type)/2; //! Inner and outer race thickness

function _pb_race_rim(type) = pb_width(type)/8;


module printed_bearing(type) { //! Draw a printable roller bearing
  stl(str("printed_bearing(pBB", pb_name(type), "): Roller bearing ", pb_name(type),
          pb_bore(type), "mm x ", pb_diameter(type), "mm x ", pb_width(type), "mm",
          pb_cage(type) ? " with cage" : ""));

  h   = pb_width(type);
  od  = pb_diameter(type);
  id  = pb_bore(type);
  th  = pb_race_thickness(type);
  rim = _pb_race_rim(type);
  cl  = pb_clearance(type);
  n   = pb_roller_count(type);

  module race_out(od, h, th, cl) {
    difference(){
      cylinder(h=h,d=od,center=true);

      hull() {
        cylinder(h=h-4*rim,d=od-2*th,center=true);
        cylinder(h=h-2*rim,d=od-2*th-2*rim+cl,center=true);
      }
      cylinder(h=h+1,d=od-2*th-2*rim+cl,center=true);
    }
  }

  module race_in(id, h, th, cl) {
    difference(){
      union(){
        cylinder(h=h,d=id+2*th,center=true);
        race_top();
        mirror([0,0,1]) race_top();
      }

      cylinder(h=h+1,d=id,center=true);
    }

    module race_top() {
      hull() {
        translate([0,0,h/2-2*rim]) cylinder(h=2*rim,d=id+2*th,      center=false);
        translate([0,0,h/2-rim])   cylinder(h=rim,  d=id+2*th+2*rim,center=false);
      }
    }
  }

  color(pp1_colour) {
    race_out(od, h, th, cl);
    race_in( id, h, th, cl);
  }
  for (r=[0:n-1]) color(pp3_colour) rotate([0,0,360/n*r])
    translate([id/2+(od/2-id/2)/2,0,0]) printed_bearing_roller(type);

  if($children)
    translate_z(h/2)
      children();
}

module printed_bearing_roller(type) { //! A printable roller (for a printable roller bearing)
  // not calling `vitamin` since these will usually be printed in place with the bearing

  th       = pb_race_thickness(type);
  rim      = _pb_race_rim(type);
  core_dia = pb_diameter(type)/2-pb_bore(type)/2-2*th-2*rim-pb_clearance(type)*2;
  roll_dia = pb_roller_dia(type);
  w        = pb_width(type);

  color(pp3_colour) difference() {
    union() {
      cylinder(h=w,d=core_dia,center=true);
      hull() {
        cylinder(h=w-2*rim,d=core_dia,center=true);
        cylinder(h=w-4*rim,d=roll_dia,center=true);
      }
    }
    translate([0,0,w/2]) screwdriver_cut(l=max(core_dia-2*extrusion_width,2),w=0.8);
  }

  module screwdriver_cut(l,w) {
    w2=w*cos(40);
    l2=l-(w-w2);
    hull() {
      translate([ -l/2, -w/2, 0]) cube([ l, w,0.1]);
      translate([-l2/2,-w2/2,-w]) cube([l2,w2,l*10]);
    }
  }
}
