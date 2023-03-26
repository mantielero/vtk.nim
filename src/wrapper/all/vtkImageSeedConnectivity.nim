## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSeedConnectivity.h
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
##  @class   vtkImageSeedConnectivity
##  @brief   SeedConnectivity with user defined seeds.
##
##  vtkImageSeedConnectivity marks pixels connected to user supplied seeds.
##  The input must be unsigned char, and the output is also unsigned char.  If
##  a seed supplied by the user does not have pixel value "InputTrueValue",
##  then the image is scanned +x, +y, +z until a pixel is encountered with
##  value "InputTrueValue".  This new pixel is used as the seed .  Any pixel
##  with out value "InputTrueValue" is consider off.  The output pixels values
##  are 0 for any off pixel in input, "OutputTrueValue" for any pixels
##  connected to seeds, and "OutputUnconnectedValue" for any on pixels not
##  connected to seeds.  The same seeds are used for all images in the image
##  set.
##

import
  vtkImageAlgorithm, vtkImagingMorphologicalModule

discard "forward decl of vtkImageConnector"
discard "forward decl of vtkImageConnectorSeed"
type
  vtkImageSeedConnectivity* {.importcpp: "vtkImageSeedConnectivity",
                             header: "vtkImageSeedConnectivity.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageSeedConnectivity* {.importc: "vtkImageSeedConnectivity".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageSeedConnectivity {.importcpp: "vtkImageSeedConnectivity::New(@)",
                                        header: "vtkImageSeedConnectivity.h".}
type
  vtkImageSeedConnectivitySuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageSeedConnectivity::IsTypeOf(@)",
    header: "vtkImageSeedConnectivity.h".}
proc IsA*(this: var vtkImageSeedConnectivity; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageSeedConnectivity.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageSeedConnectivity {.
    importcpp: "vtkImageSeedConnectivity::SafeDownCast(@)",
    header: "vtkImageSeedConnectivity.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageSeedConnectivity :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSeedConnectivity :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSeedConnectivity :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageSeedConnectivity; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageSeedConnectivity.h".}
proc RemoveAllSeeds*(this: var vtkImageSeedConnectivity) {.
    importcpp: "RemoveAllSeeds", header: "vtkImageSeedConnectivity.h".}
proc AddSeed*(this: var vtkImageSeedConnectivity; num: cint; index: ptr cint) {.
    importcpp: "AddSeed", header: "vtkImageSeedConnectivity.h".}
proc AddSeed*(this: var vtkImageSeedConnectivity; i0: cint; i1: cint; i2: cint) {.
    importcpp: "AddSeed", header: "vtkImageSeedConnectivity.h".}
proc AddSeed*(this: var vtkImageSeedConnectivity; i0: cint; i1: cint) {.
    importcpp: "AddSeed", header: "vtkImageSeedConnectivity.h".}
proc SetInputConnectValue*(this: var vtkImageSeedConnectivity; _arg: cuchar) {.
    importcpp: "SetInputConnectValue", header: "vtkImageSeedConnectivity.h".}
## !!!Ignored construct:  virtual unsigned char GetInputConnectValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputConnectValue  of  << this -> InputConnectValue ) ; return this -> InputConnectValue ; } ;
## Error: expected ';'!!!

proc SetInputConnectValueOutputConnectedValue*(
    this: var vtkImageSeedConnectivity; _arg: cuchar) {.
    importcpp: "SetInputConnectValueOutputConnectedValue",
    header: "vtkImageSeedConnectivity.h".}
## !!!Ignored construct:  virtual unsigned char GetInputConnectValueOutputConnectedValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputConnectedValue  of  << this -> OutputConnectedValue ) ; return this -> OutputConnectedValue ; } ;
## Error: expected ';'!!!

proc SetInputConnectValueOutputConnectedValueOutputUnconnectedValue*(
    this: var vtkImageSeedConnectivity; _arg: cuchar) {.importcpp: "SetInputConnectValueOutputConnectedValueOutputUnconnectedValue",
    header: "vtkImageSeedConnectivity.h".}
## !!!Ignored construct:  virtual unsigned char GetInputConnectValueOutputConnectedValueOutputUnconnectedValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputUnconnectedValue  of  << this -> OutputUnconnectedValue ) ; return this -> OutputUnconnectedValue ; } ;
## Error: expected ';'!!!

proc GetnameConnector*(this: var vtkImageSeedConnectivity): ptr vtkImageConnector {.
    importcpp: "GetnameConnector", header: "vtkImageSeedConnectivity.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the number of axes to use in connectivity.
  ##
proc SetInputConnectValueOutputConnectedValueOutputUnconnectedValueDimensionality*(
    this: var vtkImageSeedConnectivity; _arg: cint) {.importcpp: "SetInputConnectValueOutputConnectedValueOutputUnconnectedValueDimensionality",
    header: "vtkImageSeedConnectivity.h".}
## !!!Ignored construct:  virtual int GetInputConnectValueOutputConnectedValueOutputUnconnectedValueDimensionality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensionality  of  << this -> Dimensionality ) ; return this -> Dimensionality ; } ;
## Error: expected ';'!!!
