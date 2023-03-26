## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkShepardKernel.h
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
##  @class   vtkShepardKernel
##  @brief   a Shepard method interpolation kernel
##
##
##  vtkShepardKernel is an interpolation kernel that uses the method of
##  Shepard to perform interpolation. The weights are computed as 1/r^p, where
##  r is the distance to a neighbor point within the kernel radius R; and p
##  (the power parameter) is a positive exponent (typically p=2).
##
##  @warning
##  The weights are normalized sp that SUM(Wi) = 1. If a neighbor point p
##  precisely lies on the point to be interpolated, then the interpolated
##  point takes on the values associated with p.
##
##  @sa
##  vtkPointInterpolator vtkPointInterpolator2D vtkInterpolationKernel
##  vtkGaussianKernel vtkSPHKernel vtkShepardKernel
##

import
  vtkFiltersPointsModule, vtkGeneralizedKernel

discard "forward decl of vtkIdList"
discard "forward decl of vtkDoubleArray"
type
  vtkShepardKernel* {.importcpp: "vtkShepardKernel", header: "vtkShepardKernel.h",
                     bycopy.} = object of vtkGeneralizedKernel ## /@{
                                                          ## *
                                                          ##  Standard methods for instantiation, obtaining type information, and printing.
                                                          ##
    vtkShepardKernel* {.importc: "vtkShepardKernel".}: VTK_NEWINSTANCE


proc New*(): ptr vtkShepardKernel {.importcpp: "vtkShepardKernel::New(@)",
                                header: "vtkShepardKernel.h".}
type
  vtkShepardKernelSuperclass* = vtkGeneralizedKernel

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkShepardKernel::IsTypeOf(@)", header: "vtkShepardKernel.h".}
proc IsA*(this: var vtkShepardKernel; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkShepardKernel.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkShepardKernel {.
    importcpp: "vtkShepardKernel::SafeDownCast(@)", header: "vtkShepardKernel.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkShepardKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGeneralizedKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkShepardKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkShepardKernel :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkShepardKernel; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkShepardKernel.h".}
## using statement

proc ComputeWeights*(this: var vtkShepardKernel; x: array[3, cdouble];
                    pIds: ptr vtkIdList; prob: ptr vtkDoubleArray;
                    weights: ptr vtkDoubleArray): vtkIdType {.
    importcpp: "ComputeWeights", header: "vtkShepardKernel.h".}
proc SetPowerParameter*(this: var vtkShepardKernel; _arg: cdouble) {.
    importcpp: "SetPowerParameter", header: "vtkShepardKernel.h".}
proc GetPowerParameterMinValue*(this: var vtkShepardKernel): cdouble {.
    importcpp: "GetPowerParameterMinValue", header: "vtkShepardKernel.h".}
proc GetPowerParameterMaxValue*(this: var vtkShepardKernel): cdouble {.
    importcpp: "GetPowerParameterMaxValue", header: "vtkShepardKernel.h".}
## !!!Ignored construct:  virtual double GetPowerParameter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PowerParameter  of  << this -> PowerParameter ) ; return this -> PowerParameter ; } ;
## Error: expected ';'!!!
