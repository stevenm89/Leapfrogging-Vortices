# FLOW Lab - Leapfrogging Vortices
# Author : Steven McLain
# Date : May 27, 2019
# Git Version History Link: https://github.com/stevenm89/Leapfrogging-Vortices.git
# User: stevenm89
using LinearAlgebra
using Plots

#Input ------------------------------------------------------------
# Coordinate dimensions are positive x to the right, y up, and z out of the page (circulation)
# Vortex cross section numbers are two Leapfrogging vortex rings cut in half with 1
# being the bottom left half of vortex 1 with 2 above. Similarly, for the second vortex, 4 and 3.
pos1 = [0,-.5,0]; #Initial positions of 4 vortices cross section points
pos2 = [0,.5,0];
pos3 = [1,.5,0];
pos4 = [1,-.5,0];

circ23 = [0; 0; 1]; #Cirulation or strength of vortex of top two particles on different vortex rings cut in half
circ14 = [0; 0; -1]; #Cirulation or strength of vortex of bottom two particles on different vortex rings cut in half
x = 2; #Number of Time Steps Desired
timestep = .01; #Length of time step

#Output -----------------------------------------------------------
#Setup position coordinate variables over time steps
pos1store = zeros(x,3);
pos2store = zeros(x,3);
pos3store = zeros(x,3);
pos4store = zeros(x,3);

#Setup velocity coordinate variables over time steps
vel1store = zeros(x,3);
vel2store = zeros(x,3);
vel3store = zeros(x,3);
vel4store = zeros(x,3);
n = 1
#for n = 1:x
    #Get current distance between vortices
    d12 = pos2-pos1; #Initial vector distance between 1 to 2 (same vortex) etc.
    d23 = pos3-pos2; 
    d34 = pos4-pos3; 
    d41 = pos1-pos4; 

    #Get current radius for all affecting particle 1
    r2to1 = -d12; #Enter initial vector distance of particle 2 to 1 (same vortex ring)
    r3to1 = -(d12+d23); #Enter initial vector distance of particle 3 to 1 (other vortex ring)
    r4to1 = d41; #Enter initial vector distance of particle 4 to 1 (other vortex ring)
    rnorm2to1 = norm(r2to1); #These are the magnitudes of the vectors
    rnorm3to1 = norm(r3to1);
    rnorm4to1 = norm(r4to1);

    #Get current radius for all affecting particle 2
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

    #Get current velocity effects of 2,3,4 on 1
    tanvel2on1 = cross(circ23, r2to1)/(2*pi*rnorm2to1^2); #Tangential velocity of vortex 2 acting on 1
    tanvel3on1 = cross(circ23, r3to1)/(2*pi*rnorm3to1^2); #Tangential velocity of vortex 3 acting on 1
    tanvel4on1 = cross(circ14, r4to1)/(2*pi*rnorm4to1^2); #Tangential velocity of vortex 4 acting on 1
    tanvelon1 = tanvel2on1 + tanvel3on1 + tanvel4on1;

    #Get current velocity effects of 1,3,4 on 2
    tanvel1on2 = cross(circ14, r1to2)/(2*pi*rnorm1to2^2);
    tanvel3on2 = cross(circ23, r3to2)/(2*pi*rnorm3to2^2);
    tanvel4on2 = cross(circ14, r4to2)/(2*pi*rnorm4to2^2);
    tanvelon2 = tanvel1on2 + tanvel3on2 + tanvel4on2;

    #Get current velocity effects of 1,2,4 on 3
    tanvel1on3 = cross(circ14, r1to3)/(2*pi*rnorm1to3^2);
    tanvel2on3 = cross(circ23, r2to3)/(2*pi*rnorm2to3^2);
    tanvel4on3 = cross(circ14, r4to3)/(2*pi*rnorm4to3^2);
    tanvelon3 = tanvel1on3 + tanvel2on3 + tanvel4on3;

    #Get current velocity effects of 1,2,3 on 4
    tanvel1on4 = cross(circ14, r1to4)/(2*pi*rnorm1to4^2);
    tanvel2on4 = cross(circ23, r2to4)/(2*pi*rnorm2to4^2);
    tanvel3on4 = cross(circ23, r3to4)/(2*pi*rnorm3to4^2);
    tanvelon4 = tanvel1on4 + tanvel2on4 + tanvel3on4;

     #Store new velocities
     vel1store[n,:] = tanvelon1;
     vel2store[n,:] = tanvelon2;
     vel3store[n,:] = tanvelon3;
     vel4store[n,:] = tanvelon4;


    #Now get new position velocity*timestep change and add to current position
    pos1 = tanvelon1*timestep + pos1; #Position of vortex 1 after time steps
    pos2 = tanvelon2*timestep + pos2;
    pos3 = tanvelon3*timestep + pos3;
    pos4 = tanvelon4*timestep + pos4;

    #Store new position for graphing
    pos1store[n,:] = pos1;
    pos2store[n,:] = pos2;
    pos3store[n,:] = pos3;
    pos4store[n,:] = pos4;
#end
#Now Graph the results
#Velocities
plot(vel1store[:,1],vel1store[:,2], label = "vel1store", lw = 2)
plot!(vel2store[:,1],vel2store[:,2])
plot!(vel3store[:,1],vel3store[:,2])
plot!(vel4store[:,1],vel4store[:,2])

#Positions
plot!(pos1store[:,1],pos1store[:,2])
plot!(pos2store[:,1],pos2store[:,2])
plot!(pos3store[:,1],pos3store[:,2])
plot!(pos4store[:,1],pos4store[:,2])
#DONE



println("Tangential velocity of vortex 1:")
println(vel1store)
println("Tangential velocity of vortex 2:")
println(vel2store)
println("Tangential velocity of vortex 3:")
println(vel3store)
println("Tangential velocity of vortex 4:")
println(vel4store)

println("")

println("Position 1")
println(pos1store)
println("Position 2")
println(pos2store)
println("Position 3")
println(pos3store)
println("Position 4")
println(pos4store)