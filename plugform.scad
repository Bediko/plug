module rcylinder(r1=10,r2=10,h=5,b=2)
{translate([0,0,-h/2]) hull(){rotate_extrude() translate([r1-b,b,0]) circle(r = b); rotate_extrude() translate([r2-b, h-b, 0]) circle(r = b);}}

top=0;
bottom=0;
module plug(r,h){
		union(){	
		translate([0,0,2.]){
			cylinder(r1=r+0.1,r2=5,h=(3/4)*h,$fn=100);
		}
		translate([0,0,((3/4)*h)+0.4]){
			sphere(5.1,$fn=100,center=true);
		}
		translate([0,0,0]) rcylinder(h=5,r1=r,r2=r,$fn=100,cent);	
		translate([0,0,-((1/3)*h)-9.2]){
			cylinder(r2=r+0.1,r1=r*0.3,h=(3/7)*h,$fn=100);
		}	
		translate([0,0,-((1/3)*h)-36.8]) cylinder(r=r*0.5,h=40, $fn=100);
		translate([0,0,-((1/3)*h)-41.7]) rcylinder(r1=r,r2=r,h=10, $fn=100);
		}
}


module negative(d,h){
	top=((3/4)*h)+0.4+2.05;
	bottom=((1/3)*h)+41.8;

	translate([d+15,0,0])rotate([-90,90,0]) 
	difference(){
	translate([0,-d-10,-((1/3)*h)-46]) cube(size=[d+10,d*2+20,top+bottom+20]);
	plug(d,h);
	}
	translate([-d-15,0,0])rotate([-90,-90,0])
	difference(){
	translate([-d-10,-d-10,-((1/3)*h)-46]) cube(size=[d+10,d*2+20,top+bottom+20]);
	plug(d,h);
	}
	
}

d=35;
h=100;
negative(d,h);