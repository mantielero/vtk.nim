## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageAnisotropicDiffusion3D.h
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
##  @class   vtkImageAnisotropicDiffusion3D
##  @brief   edge preserving smoothing.
##
##
##  vtkImageAnisotropicDiffusion3D diffuses an volume iteratively.
##  The neighborhood of the diffusion is determined by the instance
##  flags. if "Faces" is on, the 6 voxels adjoined by faces are included
##  in the neighborhood.  If "Edges" is on the 12 edge connected voxels
##  are included, and if "Corners" is on, the 8 corner connected voxels
##  are included.  "DiffusionFactor" determines how far a pixel value
##  moves toward its neighbors, and is insensitive to the number of
##  neighbors chosen.  The diffusion is anisotropic because it only occurs
##  when a gradient measure is below "GradientThreshold".  Two gradient measures
##  exist and are toggled by the "GradientMagnitudeThreshold" flag.
##  When "GradientMagnitudeThreshold" is on, the magnitude of the gradient,
##  computed by central differences, above "DiffusionThreshold"
##  a voxel is not modified.  The alternative measure examines each
##  neighbor independently.  The gradient between the voxel and the neighbor
##  must be below the "DiffusionThreshold" for diffusion to occur with
##  THAT neighbor.
##
##  @sa
##  vtkImageAnisotropicDiffusion2D
##

import
  vtkImageSpatialAlgorithm, vtkImagingGeneralModule

type
  vtkImageAnisotropicDiffusion3D* {.importcpp: "vtkImageAnisotropicDiffusion3D",
                                   header: "vtkImageAnisotropicDiffusion3D.h",
                                   bycopy.} = object of vtkImageSpatialAlgorithm
    vtkImageAnisotropicDiffusion3D* {.importc: "vtkImageAnisotropicDiffusion3D".}: VTK_NEWINSTANCE
    ##  to determine which neighbors to diffuse
    ##  What threshold to use


proc New*(): ptr vtkImageAnisotropicDiffusion3D {.
    importcpp: "vtkImageAnisotropicDiffusion3D::New(@)",
    header: "vtkImageAnisotropicDiffusion3D.h".}
type
  vtkImageAnisotropicDiffusion3DSuperclass* = vtkImageSpatialAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageAnisotropicDiffusion3D::IsTypeOf(@)",
    header: "vtkImageAnisotropicDiffusion3D.h".}
proc IsA*(this: var vtkImageAnisotropicDiffusion3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageAnisotropicDiffusion3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageAnisotropicDiffusion3D {.
    importcpp: "vtkImageAnisotropicDiffusion3D::SafeDownCast(@)",
    header: "vtkImageAnisotropicDiffusion3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageAnisotropicDiffusion3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSpatialAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageAnisotropicDiffusion3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageAnisotropicDiffusion3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageAnisotropicDiffusion3D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImageAnisotropicDiffusion3D.h".}
proc SetNumberOfIterations*(this: var vtkImageAnisotropicDiffusion3D; num: cint) {.
    importcpp: "SetNumberOfIterations", header: "vtkImageAnisotropicDiffusion3D.h".}
## !!!Ignored construct:  /@{ *
##  Get the number of iterations.
##  virtual int GetNumberOfIterationsNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIterations  of  << this -> NumberOfIterations ) ; return this -> NumberOfIterations ; } ;
## Error: expected ';'!!!

proc SetDiffusionThreshold*(this: var vtkImageAnisotropicDiffusion3D; _arg: cdouble) {.
    importcpp: "SetDiffusionThreshold", header: "vtkImageAnisotropicDiffusion3D.h".}
## !!!Ignored construct:  virtual double GetNumberOfIterationsNumberOfIterationsDiffusionThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DiffusionThreshold  of  << this -> DiffusionThreshold ) ; return this -> DiffusionThreshold ; } ;
## Error: expected ';'!!!

proc SetDiffusionThresholdDiffusionFactor*(
    this: var vtkImageAnisotropicDiffusion3D; _arg: cdouble) {.
    importcpp: "SetDiffusionThresholdDiffusionFactor",
    header: "vtkImageAnisotropicDiffusion3D.h".}
## !!!Ignored construct:  virtual double GetNumberOfIterationsNumberOfIterationsDiffusionThresholdDiffusionFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DiffusionFactor  of  << this -> DiffusionFactor ) ; return this -> DiffusionFactor ; } ;
## Error: expected ';'!!!

proc SetDiffusionThresholdDiffusionFactorFaces*(
    this: var vtkImageAnisotropicDiffusion3D; _arg: vtkTypeBool) {.
    importcpp: "SetDiffusionThresholdDiffusionFactorFaces",
    header: "vtkImageAnisotropicDiffusion3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfIterationsNumberOfIterationsDiffusionThresholdDiffusionFactorFaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Faces  of  << this -> Faces ) ; return this -> Faces ; } ;
## Error: expected ';'!!!

proc FacesOn*(this: var vtkImageAnisotropicDiffusion3D) {.importcpp: "FacesOn",
    header: "vtkImageAnisotropicDiffusion3D.h".}
proc FacesOff*(this: var vtkImageAnisotropicDiffusion3D) {.importcpp: "FacesOff",
    header: "vtkImageAnisotropicDiffusion3D.h".}
proc SetDiffusionThresholdDiffusionFactorFacesEdges*(
    this: var vtkImageAnisotropicDiffusion3D; _arg: vtkTypeBool) {.
    importcpp: "SetDiffusionThresholdDiffusionFactorFacesEdges",
    header: "vtkImageAnisotropicDiffusion3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfIterationsNumberOfIterationsDiffusionThresholdDiffusionFactorFacesEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Edges  of  << this -> Edges ) ; return this -> Edges ; } ;
## Error: expected ';'!!!

proc EdgesOn*(this: var vtkImageAnisotropicDiffusion3D) {.importcpp: "EdgesOn",
    header: "vtkImageAnisotropicDiffusion3D.h".}
proc EdgesOff*(this: var vtkImageAnisotropicDiffusion3D) {.importcpp: "EdgesOff",
    header: "vtkImageAnisotropicDiffusion3D.h".}
proc SetDiffusionThresholdDiffusionFactorFacesEdgesCorners*(
    this: var vtkImageAnisotropicDiffusion3D; _arg: vtkTypeBool) {.
    importcpp: "SetDiffusionThresholdDiffusionFactorFacesEdgesCorners",
    header: "vtkImageAnisotropicDiffusion3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfIterationsNumberOfIterationsDiffusionThresholdDiffusionFactorFacesEdgesCorners ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Corners  of  << this -> Corners ) ; return this -> Corners ; } ;
## Error: expected ';'!!!

proc CornersOn*(this: var vtkImageAnisotropicDiffusion3D) {.importcpp: "CornersOn",
    header: "vtkImageAnisotropicDiffusion3D.h".}
proc CornersOff*(this: var vtkImageAnisotropicDiffusion3D) {.
    importcpp: "CornersOff", header: "vtkImageAnisotropicDiffusion3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Switch between gradient magnitude threshold and pixel gradient threshold.
  ##
proc SetDiffusionThresholdDiffusionFactorFacesEdgesCornersGradientMagnitudeThreshold*(
    this: var vtkImageAnisotropicDiffusion3D; _arg: vtkTypeBool) {.importcpp: "SetDiffusionThresholdDiffusionFactorFacesEdgesCornersGradientMagnitudeThreshold",
    header: "vtkImageAnisotropicDiffusion3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfIterationsNumberOfIterationsDiffusionThresholdDiffusionFactorFacesEdgesCornersGradientMagnitudeThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GradientMagnitudeThreshold  of  << this -> GradientMagnitudeThreshold ) ; return this -> GradientMagnitudeThreshold ; } ;
## Error: expected ';'!!!

proc GradientMagnitudeThresholdOn*(this: var vtkImageAnisotropicDiffusion3D) {.
    importcpp: "GradientMagnitudeThresholdOn",
    header: "vtkImageAnisotropicDiffusion3D.h".}
proc GradientMagnitudeThresholdOff*(this: var vtkImageAnisotropicDiffusion3D) {.
    importcpp: "GradientMagnitudeThresholdOff",
    header: "vtkImageAnisotropicDiffusion3D.h".}
  ## /@}