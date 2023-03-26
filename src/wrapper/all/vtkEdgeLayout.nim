## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEdgeLayout.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkEdgeLayout
##  @brief   layout graph edges
##
##
##  This class is a shell for many edge layout strategies which may be set
##  using the SetLayoutStrategy() function.  The layout strategies do the
##  actual work.
##

import
  vtkGraphAlgorithm, vtkInfovisLayoutModule

discard "forward decl of vtkEdgeLayoutStrategy"
discard "forward decl of vtkEventForwarderCommand"
type
  vtkEdgeLayout* {.importcpp: "vtkEdgeLayout", header: "vtkEdgeLayout.h", bycopy.} = object of vtkGraphAlgorithm
    vtkEdgeLayout* {.importc: "vtkEdgeLayout".}: VTK_NEWINSTANCE
    ## /@{
    ## *
    ##  This intercepts events from the strategy object and re-emits them
    ##  as if they came from the layout engine itself.
    ##
    ## /@}


proc New*(): ptr vtkEdgeLayout {.importcpp: "vtkEdgeLayout::New(@)",
                             header: "vtkEdgeLayout.h".}
type
  vtkEdgeLayoutSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEdgeLayout::IsTypeOf(@)", header: "vtkEdgeLayout.h".}
proc IsA*(this: var vtkEdgeLayout; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkEdgeLayout.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEdgeLayout {.
    importcpp: "vtkEdgeLayout::SafeDownCast(@)", header: "vtkEdgeLayout.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEdgeLayout :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEdgeLayout :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEdgeLayout :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkEdgeLayout; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkEdgeLayout.h".}
proc SetLayoutStrategy*(this: var vtkEdgeLayout; strategy: ptr vtkEdgeLayoutStrategy) {.
    importcpp: "SetLayoutStrategy", header: "vtkEdgeLayout.h".}
proc GetnameLayoutStrategy*(this: var vtkEdgeLayout): ptr vtkEdgeLayoutStrategy {.
    importcpp: "GetnameLayoutStrategy", header: "vtkEdgeLayout.h".}
  ## /@}
  ## *
  ##  Get the modification time of the layout algorithm.
  ##
proc GetMTime*(this: var vtkEdgeLayout): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkEdgeLayout.h".}