## =========================================================================
##
##   Program:   Visualization Toolkit
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkLICNoiseHelper
##  @brief   A small collection of noise routines for LIC
##

import
  vtkRenderingLICOpenGL2Module, vtkMinimalStandardRandomSequence

discard "forward decl of vtkImageData"
type
  vtkLICRandomNumberGeneratorInterface* {.
      importcpp: "vtkLICRandomNumberGeneratorInterface",
      header: "vtkLICNoiseHelper.h", bycopy.} = object


proc constructvtkLICRandomNumberGeneratorInterface*(): vtkLICRandomNumberGeneratorInterface {.
    constructor, importcpp: "vtkLICRandomNumberGeneratorInterface(@)",
    header: "vtkLICNoiseHelper.h".}
proc destroyvtkLICRandomNumberGeneratorInterface*(
    this: var vtkLICRandomNumberGeneratorInterface) {.
    importcpp: "#.~vtkLICRandomNumberGeneratorInterface()",
    header: "vtkLICNoiseHelper.h".}
proc SetSeed*(this: var vtkLICRandomNumberGeneratorInterface; seedVal: cint) {.
    importcpp: "SetSeed", header: "vtkLICNoiseHelper.h".}
proc GetRandomNumber*(this: var vtkLICRandomNumberGeneratorInterface): cdouble {.
    importcpp: "GetRandomNumber", header: "vtkLICNoiseHelper.h".}
## *
## 2D Noise Generator. Generate arrays for use as noise texture
## in the LIC algorithm. Can generate noise with uniform or Gaussian
## distributions, with a desired number of noise levels, and a
## desired frequency (f < 1 is impulse noise).
##

type
  vtkLICRandomNoise2D* {.importcpp: "vtkLICRandomNoise2D",
                        header: "vtkLICNoiseHelper.h", bycopy.} = object ## *
                                                                    ##  Generate noise with a uniform distribution.
                                                                    ##


proc constructvtkLICRandomNoise2D*(): vtkLICRandomNoise2D {.constructor,
    importcpp: "vtkLICRandomNoise2D(@)", header: "vtkLICNoiseHelper.h".}
const
  vtkLICRandomNoise2DUNIFORM* = 0
  vtkLICRandomNoise2DGAUSSIAN* = 1
  vtkLICRandomNoise2DPERLIN* = 2

proc Generate*(this: var vtkLICRandomNoise2D; `type`: cint; sideLen: var cint;
              grainLize: var cint; minNoiseVal: cfloat; maxNoiseVal: cfloat;
              nLevels: cint; impulseProb: cdouble; impulseBgNoiseVal: cfloat;
              seed: cint): ptr cfloat {.importcpp: "Generate",
                                    header: "vtkLICNoiseHelper.h".}
proc DeleteValues*(this: var vtkLICRandomNoise2D; vals: ptr cuchar) {.
    importcpp: "DeleteValues", header: "vtkLICNoiseHelper.h".}
proc GetNoiseResource*(): ptr vtkImageData {.
    importcpp: "vtkLICRandomNoise2D::GetNoiseResource(@)",
    header: "vtkLICNoiseHelper.h".}
##  VTK-HeaderTest-Exclude: vtkLICNoiseHelper.h
