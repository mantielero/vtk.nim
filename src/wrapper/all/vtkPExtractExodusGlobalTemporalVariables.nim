## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPExtractExodusGlobalTemporalVariables.h
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
##  @class vtkPExtractExodusGlobalTemporalVariables
##  @brief parallel version of vtkExtractExodusGlobalTemporalVariables.
##
##  vtkPExtractExodusGlobalTemporalVariables is a parallel version of
##  vtkExtractExodusGlobalTemporalVariables that handles synchronization between
##  multiple ranks. Since vtkPExodusIIReader has explicit sycnchronization
##  between ranks its essential that downstream filters make consistent requests
##  on all ranks to avoid deadlocks. Since global variables need not be provided
##  on all ranks, without explicit coordination
##  vtkExtractExodusGlobalTemporalVariables may end up not making requests on
##  certain ranks causing deadlocks.
##

import
  vtkExtractExodusGlobalTemporalVariables, vtkFiltersParallelModule

discard "forward decl of vtkMultiProcessController"
type
  vtkPExtractExodusGlobalTemporalVariables* {.
      importcpp: "vtkPExtractExodusGlobalTemporalVariables",
      header: "vtkPExtractExodusGlobalTemporalVariables.h", bycopy.} = object of vtkExtractExodusGlobalTemporalVariables
    vtkPExtractExodusGlobalTemporalVariables*
        {.importc: "vtkPExtractExodusGlobalTemporalVariables".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPExtractExodusGlobalTemporalVariables {.
    importcpp: "vtkPExtractExodusGlobalTemporalVariables::New(@)",
    header: "vtkPExtractExodusGlobalTemporalVariables.h".}
type
  vtkPExtractExodusGlobalTemporalVariablesSuperclass* = vtkExtractExodusGlobalTemporalVariables

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPExtractExodusGlobalTemporalVariables::IsTypeOf(@)",
    header: "vtkPExtractExodusGlobalTemporalVariables.h".}
proc IsA*(this: var vtkPExtractExodusGlobalTemporalVariables; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPExtractExodusGlobalTemporalVariables.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPExtractExodusGlobalTemporalVariables {.
    importcpp: "vtkPExtractExodusGlobalTemporalVariables::SafeDownCast(@)",
    header: "vtkPExtractExodusGlobalTemporalVariables.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPExtractExodusGlobalTemporalVariables :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractExodusGlobalTemporalVariables :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPExtractExodusGlobalTemporalVariables :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPExtractExodusGlobalTemporalVariables :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPExtractExodusGlobalTemporalVariables; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkPExtractExodusGlobalTemporalVariables.h".}
proc SetController*(this: var vtkPExtractExodusGlobalTemporalVariables;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkPExtractExodusGlobalTemporalVariables.h".}
proc GetnameController*(this: var vtkPExtractExodusGlobalTemporalVariables): ptr vtkMultiProcessController {.
    importcpp: "GetnameController",
    header: "vtkPExtractExodusGlobalTemporalVariables.h".}
  ## /@}