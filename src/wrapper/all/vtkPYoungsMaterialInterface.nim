## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPYoungsMaterialInterface.h
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
##  @class   vtkPYoungsMaterialInterface
##  @brief   parallel reconstruction of material interfaces
##
##
##  This is a subclass of vtkYoungsMaterialInterface, implementing the reconstruction
##  of material interfaces, for parallel data sets
##
##  @par Thanks:
##  This file is part of the generalized Youngs material interface reconstruction algorithm
##  contributed by <br> CEA/DIF - Commissariat a l'Energie Atomique, Centre DAM Ile-De-France <br>
##  BP12, F-91297 Arpajon, France. <br>
##  Implementation by Thierry Carrard and Philippe Pebay
##
##  @sa
##  vtkYoungsMaterialInterface
##

import
  vtkFiltersParallelModule, vtkYoungsMaterialInterface

discard "forward decl of vtkMultiProcessController"
type
  vtkPYoungsMaterialInterface* {.importcpp: "vtkPYoungsMaterialInterface",
                                header: "vtkPYoungsMaterialInterface.h", bycopy.} = object of vtkYoungsMaterialInterface
    vtkPYoungsMaterialInterface* {.importc: "vtkPYoungsMaterialInterface".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPYoungsMaterialInterface {.
    importcpp: "vtkPYoungsMaterialInterface::New(@)",
    header: "vtkPYoungsMaterialInterface.h".}
type
  vtkPYoungsMaterialInterfaceSuperclass* = vtkYoungsMaterialInterface

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPYoungsMaterialInterface::IsTypeOf(@)",
    header: "vtkPYoungsMaterialInterface.h".}
proc IsA*(this: var vtkPYoungsMaterialInterface; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPYoungsMaterialInterface.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPYoungsMaterialInterface {.
    importcpp: "vtkPYoungsMaterialInterface::SafeDownCast(@)",
    header: "vtkPYoungsMaterialInterface.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPYoungsMaterialInterface :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkYoungsMaterialInterface :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPYoungsMaterialInterface :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPYoungsMaterialInterface :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPYoungsMaterialInterface; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPYoungsMaterialInterface.h".}
proc Aggregate*(this: var vtkPYoungsMaterialInterface; a2: cint; a3: ptr cint) {.
    importcpp: "Aggregate", header: "vtkPYoungsMaterialInterface.h".}
proc SetController*(this: var vtkPYoungsMaterialInterface;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkPYoungsMaterialInterface.h".}
proc GetnameController*(this: var vtkPYoungsMaterialInterface): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPYoungsMaterialInterface.h".}
  ## /@}