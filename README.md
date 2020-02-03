# Optimal Transport Project
Code snippets used in generating diagrams for my maths master's project.

## voronoigen.m
Voronoi Diagram generator with variable number of sites, weights of each site and location of each site. By changing the distance function 

```matlab
dist = (((abs(y(i)-fy))^p+(abs(x(j)-fx))^p)^(1/p))-w;
```
one can create different partitionings of the plane.
