## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWendlandQuinticKernel.h
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
##  @class   vtkWendlandQuinticKernel
##  @brief   a quintic SPH interpolation kernel
##
##
##  vtkWendlandQuinticKernel is an smooth particle hydrodynamics interpolation kernel as
##  described by D.J. Price. This is a quintic formulation.
##
##  @warning
##  FOr more information see D.J. Price, Smoothed particle hydrodynamics and
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
  vtkWendlandQuinticKernel* {.importcpp: "vtkWendlandQuinticKernel",
                             header: "vtkWendlandQuinticKernel.h", bycopy.} = object of vtkSPHKernel ## /@{
                                                                                              ## *
                                                                                              ##  Standard methods for instantiation, obtaining type information, and printing.
                                                                                              ##
    vtkWendlandQuinticKernel* {.importc: "vtkWendlandQuinticKernel".}: VTK_NEWINSTANCE


proc New*(): ptr vtkWendlandQuinticKernel {.importcpp: "vtkWendlandQuinticKernel::New(@)",
                                        header: "vtkWendlandQuinticKernel.h".}
type
  vtkWendlandQuinticKernelSuperclass* = vtkSPHKernel

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkWendlandQuinticKernel::IsTypeOf(@)",
    header: "vtkWendlandQuinticKernel.h".}
proc IsA*(this: var vtkWendlandQuinticKernel; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkWendlandQuinticKernel.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkWendlandQuinticKernel {.
    importcpp: "vtkWendlandQuinticKernel::SafeDownCast(@)",
    header: "vtkWendlandQuinticKernel.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkWendlandQuinticKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSPHKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWendlandQuinticKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWendlandQuinticKernel :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkWendlandQuinticKernel; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkWendlandQuinticKernel.h".}
proc Initialize*(this: var vtkWendlandQuinticKernel;
                loc: ptr vtkAbstractPointLocator; ds: ptr vtkDataSet;
                pd: ptr vtkPointData) {.importcpp: "Initialize",
                                     header: "vtkWendlandQuinticKernel.h".}
proc ComputeFunctionWeight*(this: var vtkWendlandQuinticKernel; d: cdouble): cdouble {.
    importcpp: "ComputeFunctionWeight", header: "vtkWendlandQuinticKernel.h".}
proc ComputeDerivWeight*(this: var vtkWendlandQuinticKernel; d: cdouble): cdouble {.
    importcpp: "ComputeDerivWeight", header: "vtkWendlandQuinticKernel.h".}