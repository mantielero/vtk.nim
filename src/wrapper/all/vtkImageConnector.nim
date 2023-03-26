## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageConnector.h
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
##  @class   vtkImageConnector
##  @brief   Create a binary image of a sphere.
##
##  vtkImageConnector is a helper class for connectivity filters.
##  It is not meant to be used directly.
##  It implements a stack and breadth first search necessary for
##  some connectivity filters.  Filtered axes sets the dimensionality
##  of the neighbor comparison, and
##  cannot be more than three dimensions.
##  As implemented, only voxels which share faces are considered
##  neighbors.
##

import
  vtkImagingMorphologicalModule, vtkObject

discard "forward decl of vtkImageData"
type
  vtkImageConnectorSeed* {.importcpp: "vtkImageConnectorSeed",
                          header: "vtkImageConnector.h", bycopy.} = object ## ;prevent man page generation
    Pointer* {.importc: "Pointer".}: pointer
    Index* {.importc: "Index".}: array[3, cint]
    Next* {.importc: "Next".}: ptr vtkImageConnectorSeed


proc New*(): ptr vtkImageConnectorSeed {.importcpp: "vtkImageConnectorSeed::New(@)",
                                     header: "vtkImageConnector.h".}
type
  vtkImageConnector* {.importcpp: "vtkImageConnector",
                      header: "vtkImageConnector.h", bycopy.} = object of vtkObject
    vtkImageConnector* {.importc: "vtkImageConnector".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageConnector {.importcpp: "vtkImageConnector::New(@)",
                                 header: "vtkImageConnector.h".}
type
  vtkImageConnectorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageConnector::IsTypeOf(@)", header: "vtkImageConnector.h".}
proc IsA*(this: var vtkImageConnector; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageConnector.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageConnector {.
    importcpp: "vtkImageConnector::SafeDownCast(@)", header: "vtkImageConnector.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageConnector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageConnector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageConnector :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageConnector; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageConnector.h".}
proc NewSeed*(this: var vtkImageConnector; index: array[3, cint]; `ptr`: pointer): ptr vtkImageConnectorSeed {.
    importcpp: "NewSeed", header: "vtkImageConnector.h".}
proc AddSeed*(this: var vtkImageConnector; seed: ptr vtkImageConnectorSeed) {.
    importcpp: "AddSeed", header: "vtkImageConnector.h".}
proc AddSeedToEnd*(this: var vtkImageConnector; seed: ptr vtkImageConnectorSeed) {.
    importcpp: "AddSeedToEnd", header: "vtkImageConnector.h".}
proc RemoveAllSeeds*(this: var vtkImageConnector) {.importcpp: "RemoveAllSeeds",
    header: "vtkImageConnector.h".}
proc SetConnectedValue*(this: var vtkImageConnector; _arg: cuchar) {.
    importcpp: "SetConnectedValue", header: "vtkImageConnector.h".}
## !!!Ignored construct:  virtual unsigned char GetConnectedValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConnectedValue  of  << this -> ConnectedValue ) ; return this -> ConnectedValue ; } ;
## Error: expected ';'!!!

proc SetConnectedValueUnconnectedValue*(this: var vtkImageConnector; _arg: cuchar) {.
    importcpp: "SetConnectedValueUnconnectedValue", header: "vtkImageConnector.h".}
## !!!Ignored construct:  virtual unsigned char GetConnectedValueUnconnectedValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UnconnectedValue  of  << this -> UnconnectedValue ) ; return this -> UnconnectedValue ; } ;
## Error: expected ';'!!!

proc MarkData*(this: var vtkImageConnector; data: ptr vtkImageData;
              dimensionality: cint; ext: array[6, cint]) {.importcpp: "MarkData",
    header: "vtkImageConnector.h".}