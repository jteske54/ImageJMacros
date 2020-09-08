// Name: Microscope_Scales.ijm
// Type: ImageJ Macro File
// Author: Jacob Teske
// Created: 2018-08-27
// Modified: 2020-03-20
// Description: Sets the scale of an image to predetermined values based on which microscope or objective was used to capture the image.

function img1_10(getglobal) {
	if (getglobal == 1)
		run("Set Scale...", "distance=1.0837 known=1 pixel=1 unit=micron global");
	else
		run("Set Scale...", "distance=1.0837 known=1 pixel=1 unit=micron");
}

function img1_20(getglobal) {
	if (getglobal == 1)
		run("Set Scale...", "distance=2.2020 known=1 pixel=1 unit=micron global");
	else
		run("Set Scale...", "distance=2.2020 known=1 pixel=1 unit=micron");
}

function img1_40(getglobal) {
	if (getglobal == 1)
		run("Set Scale...", "distance=4.3366 known=1 pixel=1 unit=micron global");
	else
		run("Set Scale...", "distance=4.3366 known=1 pixel=1 unit=micron");
}

function img2_20(getglobal) {
	if (getglobal == 1)
		run("Set Scale...", "distance=2.4712 known=1 pixel=1 unit=micron global");
	else
		run("Set Scale...", "distance=2.4712 known=1 pixel=1 unit=micron");
}

function img2_40(getglobal) {
	if (getglobal == 1)
		run("Set Scale...", "distance=5.0229 known=1 pixel=1 unit=micron global");
	else
		run("Set Scale...", "distance=5.0229 known=1 pixel=1 unit=micron");
}

function bf_20(getglobal) {
	if (getglobal == 1)
		run("Set Scale...", "distance=2.7246 known=1 pixel=1 unit=micron global");
	else
		run("Set Scale...", "distance=2.7246 known=1 pixel=1 unit=micron");
}

function bf_40(getglobal) {
	if (getglobal == 1)
		run("Set Scale...", "distance=5.3202 known=1 pixel=1 unit=micron global");
	else
		run("Set Scale...", "distance=5.3202 known=1 pixel=1 unit=micron");
}
function ls_10(getglobal) {
	if (getglobal == 1)
		run("Set Scale...", "distance=1.4055 known=1 pixel=1 unit=micron global");
	else
		run("Set Scale...", "distance=1.4055 known=1 pixel=1 unit=micron");
}


Dialog.create("Set Scale: Microscopes")
Dialog.addRadioButtonGroup("System & Magnification",newArray("Imaging System 1 - 10x","Imaging System 1 - 20x","Imaging System 1 - 40x","Imaging System 2 - 20x","Imaging System 2 - 40x","Brightfield Microscope - 20x","Brightfield Microscope - 40x","Lung Slice - 10x"),8,1,1)
Dialog.addCheckbox("Set Global",false)
Dialog.show()
choice = Dialog.getRadioButton()
getglobal = Dialog.getCheckbox()
if (choice == "Imaging System 1 - 10x")
	img1_10(getglobal);
else if (choice == "Imaging System 1 - 20x")
	img1_20(getglobal);
else if (choice == "Imaging System 1 - 40x")
	img1_40(getglobal);
else if (choice == "Imaging System 2 - 20x")
	img2_20(getglobal);
else if (choice == "Imaging System 2 - 40x")
	img2_40(getglobal);
else if (choice == "Brightfield Microscope - 20x")
	bf_20(getglobal);
else if (choice == "Brightfield Microscope - 40x")
	bf_40(getglobal);
else if (choice == "Lung Slice - 10x")
	ls_10(getglobal);
else
	exit();
