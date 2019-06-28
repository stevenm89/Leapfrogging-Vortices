# FLOW Lab LTRAD Program
# Author : Steven McLain
# Date : May 27, 2019
# Git Version History Link: https://github.com/stevenm89/Leapfrogging-Vortices.git
# User: stevenm89
using LinearAlgebra

#Input
r = [0;1;0]; #Distance between Vortices
rnorm = norm(r)
circ = [0;0;1]; #Cirulation or strength of vortex

#Output
tanvel = cross(circ, r)/(2*pi*rnorm^2) #Tangential velocity of vortex
println("Distance between Vortices:")
println(r)
println("Cirulation or strength of vortex:")
println(circ)
println("Tangential velocity of vortex:")
println(tanvel)
