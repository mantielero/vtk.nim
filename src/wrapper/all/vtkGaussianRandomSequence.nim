## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGaussianRandomSequence.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
## =========================================================================
## *
##  @class   vtkGaussianRandomSequence
##  @brief   Gaussian sequence of pseudo random numbers
##
##  vtkGaussianRandomSequence is a sequence of pseudo random numbers
##  distributed according to the Gaussian/normal distribution (mean=0 and
##  standard deviation=1)
##
##  This is just an interface.
##

import
  vtkCommonCoreModule, vtkRandomSequence

type
  vtkGaussianRandomSequence* {.importcpp: "vtkGaussianRandomSequence",
                              header: "vtkGaussianRandomSequence.h", bycopy.} = object of vtkRandomSequence ## /@{
                                                                                                     ## *
                                                                                                     ##  Standard methods for type information and printing.
                                                                                                     ##
    vtkGaussianRandomSequence* {.importc: "vtkGaussianRandomSequence".}: VTK_NEWINSTANCE

  vtkGaussianRandomSequenceSuperclass* = vtkRandomSequence

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGaussianRandomSequence::IsTypeOf(@)",
    header: "vtkGaussianRandomSequence.h".}
proc IsA*(this: var vtkGaussianRandomSequence; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGaussianRandomSequence.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGaussianRandomSequence {.
    importcpp: "vtkGaussianRandomSequence::SafeDownCast(@)",
    header: "vtkGaussianRandomSequence.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGaussianRandomSequence :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRandomSequence :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGaussianRandomSequence :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGaussianRandomSequence :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGaussianRandomSequence; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGaussianRandomSequence.h".}
proc GetScaledValue*(this: var vtkGaussianRandomSequence; mean: cdouble;
                    standardDeviation: cdouble): cdouble {.
    importcpp: "GetScaledValue", header: "vtkGaussianRandomSequence.h".}
proc GetNextScaledValue*(this: var vtkGaussianRandomSequence; mean: cdouble;
                        standardDeviation: cdouble): cdouble {.
    importcpp: "GetNextScaledValue", header: "vtkGaussianRandomSequence.h".}