# FLOW Lab - Leapfrogging Vortices
# Author : Steven McLain
# Date : May 27, 2019
# Git Version History Link: https://github.com/stevenm89/Leapfrogging-Vortices.git
# User: stevenm89
using LinearAlgebra

#Input ------------------------------------------------------------
r2to1 = [0,-1,0]; #Enter initial vector distance of particle 2 to 1 (same vortex ring)
r3to1 = [1,-1,0]; #Enter initial vector distance of particle 3 to 1 (other vortex ring)
r4to1 = [1,0,0]; #Enter initial vector distance of particle 4 to 1 (other vortex ring)

circ = [0; 0; 1]; #Cirulation or strength of vortex (this means x is pos to left, y up, z into page)
x = 1; #Number of Time Steps Desired

#Output -----------------------------------------------------------
rnorm2to1 = norm(r2to1);
rnorm3to1 = norm(r3to1);
rnorm4to1 = norm(r4to1);

#for n2 = x
    tanvel2on1 = cross(circ, r2to1)/(2*pi*rnorm2to1^2); #Tangential velocity of vortex 2 acting on 1
    tanvel3on1 = cross(circ, r3to1)/(2*pi*rnorm3to1^2); #Tangential velocity of vortex 3 acting on 1
    tanvel4on1 = cross(circ, r4to1)/(2*pi*rnorm4to1^2); #Tangential velocity of vortex 4 acting on 1
    tanvelon1 = tanvel2on1 + tanvel3on1 + tanvel4on1;
#end
# #---------In process of edit
# r1to2 = [0,1,0];
# r1to3 = [-1,1,0];
# r1to4 = [-1,0,0]; 
# tanvel1on2 = cross(circ, r1to2)/(2*pi*rnorm2to1^2);
# tanvel1on3 = cross(circ, r1to3)/(2*pi*rnorm3to1^2);
# tanvel1on4 = cross(circ, r1to4)/(2*pi*rnorm4to1^2); 
# tanvelfrom1 = tanvel1on2 + tanvel1on3 + tanvel1on4;
# difference = tanvelon1 + tanvelfrom1;
# #---------
println("Tangential velocity of vortex 1:")
#println(difference)