## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEmptyRepresentation.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkEmptyRepresentation
##
##
##

import
  vtkDataRepresentation, vtkSmartPointer, vtkViewsCoreModule

discard "forward decl of vtkConvertSelectionDomain"
type
  vtkEmptyRepresentation* {.importcpp: "vtkEmptyRepresentation",
                           header: "vtkEmptyRepresentation.h", bycopy.} = object of vtkDataRepresentation
    vtkEmptyRepresentation* {.importc: "vtkEmptyRepresentation".}: VTK_NEWINSTANCE


proc New*(): ptr vtkEmptyRepresentation {.importcpp: "vtkEmptyRepresentation::New(@)",
                                      header: "vtkEmptyRepresentation.h".}
type
  vtkEmptyRepresentationSuperclass* = vtkDataRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEmptyRepresentation::IsTypeOf(@)",
    header: "vtkEmptyRepresentation.h".}
proc IsA*(this: var vtkEmptyRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkEmptyRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEmptyRepresentation {.
    importcpp: "vtkEmptyRepresentation::SafeDownCast(@)",
    header: "vtkEmptyRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEmptyRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEmptyRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEmptyRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkEmptyRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkEmptyRepresentation.h".}
proc GetInternalAnnotationOutputPort*(this: var vtkEmptyRepresentation): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalAnnotationOutputPort",
    header: "vtkEmptyRepresentation.h".}
proc GetInternalAnnotationOutputPort*(this: var vtkEmptyRepresentation; port: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalAnnotationOutputPort",
    header: "vtkEmptyRepresentation.h".}
proc GetInternalAnnotationOutputPort*(this: var vtkEmptyRepresentation; port: cint;
                                     conn: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetInternalAnnotationOutputPort",
    header: "vtkEmptyRepresentation.h".}