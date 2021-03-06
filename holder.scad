$fn=360;

tape_width=17.3;
tape_height=3.5;
pipe_diameter=20.2;

cutout_depth=1;

base_height=35;

cut_r = (pow(tape_height,2) + pow(tape_width,2)/4)/(2*tape_height);


//echo(cut_r);



module cutout()
{
  translate([0, 0, cut_r])
  {
    intersection()
    {
      rotate([0, 90, 0])
        cylinder(h=50, r=cut_r, center=true);
      cube([50, tape_width, cut_r*2], center=true);
    }
  }
}

module cut2()
{
  translate([0, -10, 0]) mirror([0, 0, 1]) cube([5, 20, 5]);
}

difference()
{
  cube([40, 20, base_height], center=true);
  rotate([90, 0, 0]) cylinder(h=30, d=pipe_diameter, center=true);
  //translate([11, 0, 5]) cylinder(h=15, d=2, center=false);
  //translate([-11, 0, 5]) cylinder(h=15, d=2, center=false);
  //translate([0, 0, -18]) cylinder(h=10, d=2, center=false);
  //translate([0, 0, base_height/2-(tape_height+cutout_depth)]) cutout();
  translate([11, 0, 0]) cube([20, 22, 1], center=true);
  translate([40/2-(40-pipe_diameter)/4, 0, -(base_height+1)/4]) cylinder(d=4, h=(base_height+1)/2, center=true);
  translate([40/2-(40-pipe_diameter)/4, 0, -base_height/2]) cylinder(d=8, h=3);
  translate([40/2-(40-pipe_diameter)/4, 0, 0]) cylinder(d=3.5, h=12);
  translate([-16, 0, 16]) translate([0, -10, 0]) mirror([0, 0, 1]) cube([5, 20, 5]);
  translate([-16, 0, -16]) translate([0, -10, 0]) mirror([0, 0, 0]) cube([5, 20, 5]);
  translate([-40+3, 0, 0]) cylinder(d=40, h=base_height, center=true);
}

