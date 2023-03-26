## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoxMuellerRandomSequence.h
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
##  @class   vtkBoxMuellerRandomSequence
##  @brief   Gaussian sequence of pseudo random numbers implemented with the Box-Mueller transform
##
##  vtkGaussianRandomSequence is a sequence of pseudo random numbers
##  distributed according to the Gaussian/normal distribution (mean=0 and
##  standard deviation=1).
##
##  It based is calculation from a uniformly distributed pseudo random sequence.
##  The initial sequence is a vtkMinimalStandardRandomSequence.
##

import
  vtkCommonCoreModule, vtkGaussianRandomSequence

type
  vtkBoxMuellerRandomSequence* {.importcpp: "vtkBoxMuellerRandomSequence",
                                header: "vtkBoxMuellerRandomSequence.h", bycopy.} = object of vtkGaussianRandomSequence ## /@{
                                                                                                                 ## *
                                                                                                                 ##  Standard methods for instantiation, type information, and printing.
                                                                                                                 ##
    vtkBoxMuellerRandomSequence* {.importc: "vtkBoxMuellerRandomSequence".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBoxMuellerRandomSequence {.
    importcpp: "vtkBoxMuellerRandomSequence::New(@)",
    header: "vtkBoxMuellerRandomSequence.h".}
type
  vtkBoxMuellerRandomSequenceSuperclass* = vtkGaussianRandomSequence

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBoxMuellerRandomSequence::IsTypeOf(@)",
    header: "vtkBoxMuellerRandomSequence.h".}
proc IsA*(this: var vtkBoxMuellerRandomSequence; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBoxMuellerRandomSequence.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBoxMuellerRandomSequence {.
    importcpp: "vtkBoxMuellerRandomSequence::SafeDownCast(@)",
    header: "vtkBoxMuellerRandomSequence.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBoxMuellerRandomSequence :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGaussianRandomSequence :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoxMuellerRandomSequence :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoxMuellerRandomSequence :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBoxMuellerRandomSequence; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBoxMuellerRandomSequence.h".}
proc Initialize*(this: var vtkBoxMuellerRandomSequence;
                vtkNotUsed: proc (a1: seed): vtkTypeUInt32) {.
    importcpp: "Initialize", header: "vtkBoxMuellerRandomSequence.h".}
proc GetValue*(this: var vtkBoxMuellerRandomSequence): cdouble {.
    importcpp: "GetValue", header: "vtkBoxMuellerRandomSequence.h".}
proc Next*(this: var vtkBoxMuellerRandomSequence) {.importcpp: "Next",
    header: "vtkBoxMuellerRandomSequence.h".}
proc GetUniformSequence*(this: var vtkBoxMuellerRandomSequence): ptr vtkRandomSequence {.
    importcpp: "GetUniformSequence", header: "vtkBoxMuellerRandomSequence.h".}
proc SetUniformSequence*(this: var vtkBoxMuellerRandomSequence;
                        uniformSequence: ptr vtkRandomSequence) {.
    importcpp: "SetUniformSequence", header: "vtkBoxMuellerRandomSequence.h".}