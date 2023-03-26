## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageToPoints.h
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
##  @class   vtkImageToPoints
##  @brief   Extract all image voxels as points.
##
##  This filter takes an input image and an optional stencil, and creates
##  a vtkPolyData that contains the points and the point attributes but no
##  cells.  If a stencil is provided, only the points inside the stencil
##  are included.
##  @par Thanks:
##  Thanks to David Gobbi, Calgary Image Processing and Analysis Centre,
##  University of Calgary, for providing this class.
##

import
  vtkImagingHybridModule, vtkPolyDataAlgorithm

discard "forward decl of vtkImageStencilData"
type
  vtkImageToPoints* {.importcpp: "vtkImageToPoints", header: "vtkImageToPoints.h",
                     bycopy.} = object of vtkPolyDataAlgorithm
    vtkImageToPoints* {.importc: "vtkImageToPoints".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageToPoints {.importcpp: "vtkImageToPoints::New(@)",
                                header: "vtkImageToPoints.h".}
type
  vtkImageToPointsSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageToPoints::IsTypeOf(@)", header: "vtkImageToPoints.h".}
proc IsA*(this: var vtkImageToPoints; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageToPoints.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageToPoints {.
    importcpp: "vtkImageToPoints::SafeDownCast(@)", header: "vtkImageToPoints.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageToPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageToPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageToPoints :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageToPoints; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageToPoints.h".}
proc SetStencilConnection*(this: var vtkImageToPoints; port: ptr vtkAlgorithmOutput) {.
    importcpp: "SetStencilConnection", header: "vtkImageToPoints.h".}
proc GetStencilConnection*(this: var vtkImageToPoints): ptr vtkAlgorithmOutput {.
    importcpp: "GetStencilConnection", header: "vtkImageToPoints.h".}
proc SetStencilData*(this: var vtkImageToPoints; stencil: ptr vtkImageStencilData) {.
    importcpp: "SetStencilData", header: "vtkImageToPoints.h".}
proc SetOutputPointsPrecision*(this: var vtkImageToPoints; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkImageToPoints.h".}
## !!!Ignored construct:  virtual int GetOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
