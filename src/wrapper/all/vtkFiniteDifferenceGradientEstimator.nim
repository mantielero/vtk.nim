## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFiniteDifferenceGradientEstimator.h
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
##  @class   vtkFiniteDifferenceGradientEstimator
##  @brief   Use finite differences to estimate gradient.
##
##
##   vtkFiniteDifferenceGradientEstimator is a concrete subclass of
##   vtkEncodedGradientEstimator that uses a central differences technique to
##   estimate the gradient. The gradient at some sample location (x,y,z)
##   would be estimated by:
##
##        nx = (f(x-dx,y,z) - f(x+dx,y,z)) / 2*dx;
##        ny = (f(x,y-dy,z) - f(x,y+dy,z)) / 2*dy;
##        nz = (f(x,y,z-dz) - f(x,y,z+dz)) / 2*dz;
##
##   This value is normalized to determine a unit direction vector and a
##   magnitude. The normal is computed in voxel space, and
##   dx = dy = dz = SampleSpacingInVoxels. A scaling factor is applied to
##   convert this normal from voxel space to world coordinates.
##
##  @sa
##  vtkEncodedGradientEstimator
##

import
  vtkEncodedGradientEstimator, vtkRenderingVolumeModule

type
  vtkFiniteDifferenceGradientEstimator* {.
      importcpp: "vtkFiniteDifferenceGradientEstimator",
      header: "vtkFiniteDifferenceGradientEstimator.h", bycopy.} = object of vtkEncodedGradientEstimator
    vtkFiniteDifferenceGradientEstimator*
        {.importc: "vtkFiniteDifferenceGradientEstimator".}: VTK_NEWINSTANCE
    SampleSpacingInVoxels* {.importc: "SampleSpacingInVoxels".}: cint

  vtkFiniteDifferenceGradientEstimatorSuperclass* = vtkEncodedGradientEstimator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFiniteDifferenceGradientEstimator::IsTypeOf(@)",
    header: "vtkFiniteDifferenceGradientEstimator.h".}
proc IsA*(this: var vtkFiniteDifferenceGradientEstimator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFiniteDifferenceGradientEstimator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFiniteDifferenceGradientEstimator {.
    importcpp: "vtkFiniteDifferenceGradientEstimator::SafeDownCast(@)",
    header: "vtkFiniteDifferenceGradientEstimator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFiniteDifferenceGradientEstimator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkEncodedGradientEstimator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFiniteDifferenceGradientEstimator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFiniteDifferenceGradientEstimator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFiniteDifferenceGradientEstimator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkFiniteDifferenceGradientEstimator.h".}
proc New*(): ptr vtkFiniteDifferenceGradientEstimator {.
    importcpp: "vtkFiniteDifferenceGradientEstimator::New(@)",
    header: "vtkFiniteDifferenceGradientEstimator.h".}
proc SetSampleSpacingInVoxels*(this: var vtkFiniteDifferenceGradientEstimator;
                              _arg: cint) {.importcpp: "SetSampleSpacingInVoxels",
    header: "vtkFiniteDifferenceGradientEstimator.h".}
## !!!Ignored construct:  virtual int GetSampleSpacingInVoxels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SampleSpacingInVoxels  of  << this -> SampleSpacingInVoxels ) ; return this -> SampleSpacingInVoxels ; } ;
## Error: expected ';'!!!
