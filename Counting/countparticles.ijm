// Name: countparticles.ijm
// Type: ImageJ Macro File
// Author: Jacob Teske
// Created: 20180921
// Modified: 20180921
// Comments: 

constraint = getNumber("Enter the minimum particle size that should be considered (pixels).",0)
while (nImages() != 0) {
run("Analyze Particles...", "size="+constraint+"-Infinity show=Masks summarize");
close();
close();
}