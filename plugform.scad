module rcylinder(r1=10,r2=10,h=5,b=2)
{translate([0,0,-h/2]) hull(){rotate_extrude() translate([r1-b,b,0]) circle(r = b); rotate_extrude() translate([r2-b, h-b, 0]) circle(r = b);}}

module plug(r,h){

	union(){
		
		translate([0,0,+1.4]){
			cylinder(r1=r+0.1,r2=5,h=(3/4)*h,$fn=100);
		}
		translate([0,0,((3/4)*h)+0.4]){
			sphere(5.1,$fn=100,center=true);
		}
		translate([0,0,0]) rcylinder(h=5,r1=r,r2=r,$fn=100,cent);
	
		translate([0,0,-((1/3)*h)-10.0]){
			cylinder(r2=r+0.1,r1=r*0.3,h=(3/7)*h,$fn=100);
		}
	
		
		translate([0,0,-((1/3)*h)-21.8]) cylinder(r=r*0.5,h=25, $fn=100);
		translate([0,0,-((1/3)*h)-26.8]) rcylinder(r1=r,r2=r,h=10, $fn=100);
	
	}


}
d=35;
h=100;
plug(d,h);