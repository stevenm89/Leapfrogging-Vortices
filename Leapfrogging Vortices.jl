# FLOW Lab - Leapfrogging Vortices
# Author : Steven McLain
# Date : May 27, 2019
# Git Version History Link: https://github.com/stevenm89/Leapfrogging-Vortices.git
# User: stevenm89
using LinearAlgebra

#Input ------------------------------------------------------------
# Coordinate dimensions are positive x to the right, y up, and z out of the page
r2to1 = [0,-1,0]; #Enter initial vector distance of particle 2 to 1 (same vortex ring)
r3to1 = [-1,-1,0]; #Enter initial vector distance of particle 3 to 1 (other vortex ring)
r4to1 = [-1,0,0]; #Enter initial vector distance of particle 4 to 1 (other vortex ring)

circ23 = [0; 0; 1]; #Cirulation or strength of vortex of top two particles on different vortex rings cut in half
circ14 = [0; 0; -1]; #Cirulation or strength of vortex of bottom two particles on different vortex rings cut in half
x = 1; #Number of Time Steps Desired

#Output -----------------------------------------------------------
rnorm2to1 = norm(r2to1);
rnorm3to1 = norm(r3to1);
rnorm4to1 = norm(r4to1);

#for n2 = x
    tanvel2on1 = cross(circ23, r2to1)/(2*pi*rnorm2to1^2); #Tangential velocity of vortex 2 acting on 1
    tanvel3on1 = cross(circ23, r3to1)/(2*pi*rnorm3to1^2); #Tangential velocity of vortex 3 acting on 1
    tanvel4on1 = cross(circ14, r4to1)/(2*pi*rnorm4to1^2); #Tangential velocity of vortex 4 acting on 1
    tanvelon1 = tanvel2on1 + tanvel3on1 + tanvel4on1;
#end
println("Tangential velocity of vortex 1:")
println(tanvelon1)