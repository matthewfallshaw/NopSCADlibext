//
// NopSCADlib Copyright Chris Palmer 2019
// nop.head@gmail.com
// hydraraptor.blogspot.com
// contributed by Matt Fallshaw, https://github.com/mattfallshaw
//   bearing data from MCAD, https://github.com/openscad/MCAD/blob/master/bearing.scad
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

include <NopSCADlib/global_defs.scad>

         // Part code without shield type suffix
                // Internal diameter
                    // External diameter
                        // Width
                              // Gap between rollers and race
pBB603  = [ "603",  3,  9,  5  , 0.1];
pBB604  = [ "604",  4, 12,  4  , 0.1];
pBB605  = [ "605",  5, 14,  5  , 0.1];
pBB606  = [ "606",  6, 17,  6  , 0.1];
pBB607  = [ "607",  7, 19,  6  , 0.1];
pBB608  = [ "608",  8, 22,  7  , 0.1]; // 608 bearings for wades
pBB609  = [ "609",  9, 24,  7  , 0.1];

pBB623  = [ "623",  3, 10,  4  , 0.1];
pBB624  = [ "624",  4, 13,  5  , 0.1]; // 624 ball bearing for idlers
pBB625  = [ "625",  5, 16,  5  , 0.1];
pBB626  = [ "626",  6, 19,  6  , 0.1];
pBB627  = [ "627",  7, 22,  7  , 0.1];
pBB628  = [ "628",  8, 24,  8  , 0.1];
pBB629  = [ "629",  9, 26,  8  , 0.1];

pBB633  = [ "633",  3, 13,  5  , 0.1];
pBB634  = [ "634",  4, 16,  5  , 0.1];
pBB635  = [ "635",  5, 19,  6  , 0.1];
pBB636  = [ "636",  6, 22,  7  , 0.1];
pBB637  = [ "637",  7, 26,  9  , 0.1];
pBB638  = [ "638",  8, 28,  9  , 0.1];
pBB639  = [ "639",  9, 30, 10  , 0.1];

pBB673  = [ "673",  3,  6,  2.5, 0.1];
pBB674  = [ "674",  4,  7,  2.5, 0.1];
pBB675  = [ "675",  5,  8,  2.5, 0.1];
pBB676  = [ "676",  6, 10,  3  , 0.1];
pBB677  = [ "677",  7, 11,  3  , 0.1];
pBB678  = [ "678",  8, 12,  3.5, 0.1];

pBB683  = [ "683",  3,  7,  3  , 0.1];
pBB684  = [ "684",  4,  9,  4  , 0.1];
pBB685  = [ "685",  5, 11,  5  , 0.1];
pBB686  = [ "686",  6, 13,  5  , 0.1];
pBB687  = [ "687",  7, 14,  5  , 0.1];
pBB688  = [ "688",  8, 16,  5  , 0.1];
pBB689  = [ "689",  9, 17,  5  , 0.1];

pBB693  = [ "693",  3,  8,  4  , 0.1];
pBB694  = [ "694",  4, 11,  4  , 0.1];
pBB695  = [ "695",  5, 13,  4  , 0.1];
pBB696  = [ "696",  6, 15,  5  , 0.1];
pBB697  = [ "697",  7, 17,  5  , 0.1];
pBB698  = [ "698",  8, 19,  6  , 0.1];
pBB699  = [ "699",  9, 20,  6  , 0.1];

pBB6200 = ["6200", 10, 30,  9  , 0.1];
pBB6201 = ["6201", 12, 32, 10  , 0.1];
pBB6202 = ["6202", 15, 35, 11  , 0.1];
pBB6203 = ["6203", 17, 40, 12  , 0.1];
pBB6205 = ["6205", 25, 52, 15  , 0.1];
pBB6206 = ["6206", 30, 62, 16  , 0.1];

printed_bearings = [pBB603,  pBB604,  pBB605,  pBB606,  pBB607,  pBB608,  pBB609,
                    pBB623,  pBB624,  pBB625,  pBB626,  pBB627,  pBB628,  pBB629,
                    pBB633,  pBB634,  pBB635,  pBB636,  pBB637,  pBB638,  pBB639,
                    pBB673,  pBB674,  pBB675,  pBB676,  pBB677,  pBB678,
                    pBB683,  pBB684,  pBB685,  pBB686,  pBB687,  pBB688,  pBB689,
                    pBB693,  pBB694,  pBB695,  pBB696,  pBB697,  pBB698,  pBB699,
                    pBB6200, pBB6201, pBB6202, pBB6203, pBB6205, pBB6206];

use <printed_bearing.scad>
