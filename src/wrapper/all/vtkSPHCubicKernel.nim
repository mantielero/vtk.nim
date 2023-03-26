## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSPHCubicKernel.h
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
##  @class   vtkSPHCubicKernel
##  @brief   a cubic SPH interpolation kernel
##
##
##  vtkSPHCubicKernel is an smooth particle hydrodynamics interpolation kernel as
##  described by D.J. Price. This is a cubic formulation.
##
##  @warning
##  For more information see D.J. Price, Smoothed particle hydrodynamics and
##  magnetohydrodynamics, J. Comput. Phys. 231:759-794, 2012. Especially
##  equation 49.
##
##  @par Acknowledgments:
##  The following work has been generously supported by Altair Engineering
##  and FluiDyna GmbH. Please contact Steve Cosgrove or Milos Stanic for
##  more information.
##
##  @sa
##  vtkSPHKernel vtkSPHInterpolator
##

import
  vtkFiltersPointsModule, vtkSPHKernel

discard "forward decl of vtkIdList"
discard "forward decl of vtkDoubleArray"
type
  vtkSPHCubicKernel* {.importcpp: "vtkSPHCubicKernel",
                      header: "vtkSPHCubicKernel.h", bycopy.} = object of vtkSPHKernel ## /@{
                                                                                ## *
                                                                                ##  Standard methods for instantiation, obtaining type information, and printing.
                                                                                ##
    vtkSPHCubicKernel* {.importc: "vtkSPHCubicKernel".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSPHCubicKernel {.importcpp: "vtkSPHCubicKernel::New(@)",
                                 header: "vtkSPHCubicKernel.h".}
type
  vtkSPHCubicKernelSuperclass* = vtkSPHKernel

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSPHCubicKernel::IsTypeOf(@)", header: "vtkSPHCubicKernel.h".}
proc IsA*(this: var vtkSPHCubicKernel; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSPHCubicKernel.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSPHCubicKernel {.
    importcpp: "vtkSPHCubicKernel::SafeDownCast(@)", header: "vtkSPHCubicKernel.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSPHCubicKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSPHKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSPHCubicKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSPHCubicKernel :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSPHCubicKernel; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSPHCubicKernel.h".}
proc Initialize*(this: var vtkSPHCubicKernel; loc: ptr vtkAbstractPointLocator;
                ds: ptr vtkDataSet; pd: ptr vtkPointData) {.importcpp: "Initialize",
    header: "vtkSPHCubicKernel.h".}
proc ComputeFunctionWeight*(this: var vtkSPHCubicKernel; d: cdouble): cdouble {.
    importcpp: "ComputeFunctionWeight", header: "vtkSPHCubicKernel.h".}
proc ComputeDerivWeight*(this: var vtkSPHCubicKernel; d: cdouble): cdouble {.
    importcpp: "ComputeDerivWeight", header: "vtkSPHCubicKernel.h".}