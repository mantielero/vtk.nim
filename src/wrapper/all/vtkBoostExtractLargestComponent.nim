## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoostExtractLargestComponent.h
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
##  @class   vtkBoostExtractLargestComponent
##  @brief   Extract the largest connected
##  component of a graph
##
##
##  vtkBoostExtractLargestComponent finds the largest connected region of a
##  vtkGraph. For directed graphs, this returns the largest biconnected component.
##  See vtkBoostConnectedComponents for details.
##

import
  vtkGraphAlgorithm, vtkInfovisBoostGraphAlgorithmsModule

discard "forward decl of vtkGraph"
type
  vtkBoostExtractLargestComponent* {.importcpp: "vtkBoostExtractLargestComponent", header: "vtkBoostExtractLargestComponent.h",
                                    bycopy.} = object of vtkGraphAlgorithm
    vtkBoostExtractLargestComponent* {.importc: "vtkBoostExtractLargestComponent".}: VTK_NEWINSTANCE

  vtkBoostExtractLargestComponentSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBoostExtractLargestComponent::IsTypeOf(@)",
    header: "vtkBoostExtractLargestComponent.h".}
proc IsA*(this: var vtkBoostExtractLargestComponent; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBoostExtractLargestComponent.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBoostExtractLargestComponent {.
    importcpp: "vtkBoostExtractLargestComponent::SafeDownCast(@)",
    header: "vtkBoostExtractLargestComponent.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBoostExtractLargestComponent :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoostExtractLargestComponent :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoostExtractLargestComponent :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBoostExtractLargestComponent; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBoostExtractLargestComponent.h".}
proc New*(): ptr vtkBoostExtractLargestComponent {.
    importcpp: "vtkBoostExtractLargestComponent::New(@)",
    header: "vtkBoostExtractLargestComponent.h".}
proc SetInvertSelection*(this: var vtkBoostExtractLargestComponent; _arg: bool) {.
    importcpp: "SetInvertSelection", header: "vtkBoostExtractLargestComponent.h".}
## !!!Ignored construct:  virtual bool GetInvertSelection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InvertSelection  of  << this -> InvertSelection ) ; return this -> InvertSelection ; } ;
## Error: expected ';'!!!
