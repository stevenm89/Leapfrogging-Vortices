# FLOW Lab - Leapfrogging Vortices
# Author : Steven McLain
# Date : May 27, 2019
# Git Version History Link: https://github.com/stevenm89/Leapfrogging-Vortices.git
# User: stevenm89
using LinearAlgebra

#Input ------------------------------------------------------------
# Coordinate dimensions are positive x to the right, y up, and z out of the page
# Vortex particle numbers are two Leapfrogging vortex rings cut in half with 
# being the bottom left half of ring and 2 above it of the same ring. 3 is top right
# of the second ring, and 4 is bottom right.
d12 = [ 0, 1, 0]; #Initial vector distance between 1 to 2 (same vortex)
d23 = [ 1, 0, 0]; #Initial vector distance between 2 to 3
d34 = [ 0, -1, 0]; #Initial vector distance between 3 to 4 (same vortex)
d41 = [ -1, 0, 0]; #Initial vector distance between 4 to 1

circ23 = [0; 0; 1]; #Cirulation or strength of vortex of top two particles on different vortex rings cut in half
circ14 = [0; 0; -1]; #Cirulation or strength of vortex of bottom two particles on different vortex rings cut in half
x = 1; #Number of Time Steps Desired

#Output -----------------------------------------------------------
#Get initial radius for all affecting particle 1
r2to1 = -d12; #Enter initial vector distance of particle 2 to 1 (same vortex ring)
r3to1 = -(d12+d23); #Enter initial vector distance of particle 3 to 1 (other vortex ring)
r4to1 = d41; #Enter initial vector distance of particle 4 to 1 (other vortex ring)
rnorm2to1 = norm(r2to1); #These are the magnitudes of the vectors
rnorm3to1 = norm(r3to1);
rnorm4to1 = norm(r4to1);

#Get initial radius for all affecting particle 2
r1to2 = d12;
r3to2 = -d23;
r4to2 = -(d23+d34);
rnorm1to2 = norm(r1to2);
rnorm3to2 = norm(r3to2);
rnorm4to2 = norm(r4to2);

#Get initial radius for all affecting particle 3
r1to3 = d12+d23;
r2to3 = d23;
r4to3 = -d34;
rnorm1to3 = norm(r1to3);
rnorm2to3 = norm(r2to3);
rnorm4to3 = norm(r4to3);

#Get initial radius for all affecting particle 4
r1to4 = -d41;
r2to4 = d23+d34;
r3to4 = d34;
rnorm1to4 = norm(r1to4);
rnorm2to4 = norm(r2to4);
rnorm3to4 = norm(r3to4);


for n2 = x
    #Get velocity effects of 2,3,4 on 1
    tanvel2on1 = cross(circ23, r2to1)/(2*pi*rnorm2to1^2); #Tangential velocity of vortex 2 acting on 1
    tanvel3on1 = cross(circ23, r3to1)/(2*pi*rnorm3to1^2); #Tangential velocity of vortex 3 acting on 1
    tanvel4on1 = cross(circ14, r4to1)/(2*pi*rnorm4to1^2); #Tangential velocity of vortex 4 acting on 1
    tanvelon1 = tanvel2on1 + tanvel3on1 + tanvel4on1;

    #Get velocity effects of 1,3,4 on 2
    tanvel1on2 = cross(circ14, r1to2)/(2*pi*rnorm1to2^2);
    tanvel3on2 = cross(circ23, r3to2)/(2*pi*rnorm3to2^2);
    tanvel4on2 = cross(circ14, r4to2)/(2*pi*rnorm4to2^2);
    tanvelon2 = tanvel1on2 + tanvel3on2 + tanvel4on2;

    #Get velocity effects of 1,2,4 on 3
    tanvel1on3 = cross(circ14, r1to3)/(2*pi*rnorm1to3^2);
    tanvel2on3 = cross(circ23, r2to3)/(2*pi*rnorm2to3^2);
    tanvel4on3 = cross(circ14, r4to3)/(2*pi*rnorm4to3^2);
    tanvelon3 = tanvel1on3 + tanvel2on3 + tanvel4on3;

    #Get velocity effects of 1,2,3 on 4
    tanvel1on4 = cross(circ14, r1to4)/(2*pi*rnorm1to4^2);
    tanvel2on4 = cross(circ23, r2to4)/(2*pi*rnorm2to4^2);
    tanvel3on4 = cross(circ23, r3to4)/(2*pi*rnorm3to4^2);
    tanvelon4 = tanvel1on4 + tanvel2on4 + tanvel3on4;
end
println("Tangential velocity of vortex 1:")
println(tanvelon1)
println("Tangential velocity of vortex 2:")
println(tanvelon2)
println("Tangential velocity of vortex 3:")
println(tanvelon3)
println("Tangential velocity of vortex 4:")
println(tanvelon4)