# TAF Quantification

filename: `taf_quant.ijm`

author: `Jacob Teske`

date: `2022-01-03`

language: `ImageJ Macro (ijm)`
___
- [TAF Quantification](#taf-quantification)
  - [Description](#description)
  - [Macro Installation](#macro-installation)
  - [ImageJ Setup](#imagej-setup)
  - [Usage](#usage)
___
## Description
Quantifies TAF staining colocalized with another protein and DAPI.

**Requirements**
Alterations to the code can be made to accomodate different images/types, but in this version, the following must be true:
- There must be exactly 3 channels
- All 3 channels must be contained in the same image file
- All 3 channels must be z-stacks
- DAPI must be on the first channel

## Macro Installation
1. If you don't already have it, download the most recent version of [Fiji/ImageJ](https://imagej.net/software/fiji/downloads).
   1. Unzip the downloaded file
2. Within the ImageJ folder, open the `macros` folder
3. Copy the `taf_quant.ijm` file included with these instructions into the `macros` folder

## ImageJ Setup
1. Within ImageJ, click on `Plugins > Macros > Edit`
2. Navigate to the macros folder that you saved the macro into, and double click on `taf_quant.ijm`

## Usage
1. Click and drag the image into ImageJ to open it.
   1. If the image is an .nd2 file or something similar, click and drag the image from the folder into the main ImageJ window. An open dialog will pop up. Leave everything as default and click OK
2. Click the "Run" button in the macro window
3. Once the script finishes running, repeat steps 1-3 on the remaining images