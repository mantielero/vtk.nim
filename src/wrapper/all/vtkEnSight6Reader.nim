## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEnSight6Reader.h
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
##  @class   vtkEnSight6Reader
##  @brief   class to read EnSight6 files
##
##  vtkEnSight6Reader is a class to read EnSight6 files into vtk.
##  Because the different parts of the EnSight data can be of various data
##  types, this reader produces multiple outputs, one per part in the input
##  file.
##  All variable information is being stored in field data.  The descriptions
##  listed in the case file are used as the array names in the field data.
##  For complex vector variables, the description is appended with _r (for the
##  array of real values) and _i (for the array if imaginary values).  Complex
##  scalar variables are stored as a single array with 2 components, real and
##  imaginary, listed in that order.
##  @warning
##  You must manually call Update on this reader and then connect the rest
##  of the pipeline because (due to the nature of the file format) it is
##  not possible to know ahead of time how many outputs you will have or
##  what types they will be.
##  This reader can only handle static EnSight datasets (both static geometry
##  and variables).
##

import
  vtkEnSightReader, vtkIOEnSightModule

discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkPoints"
type
  vtkEnSight6Reader* {.importcpp: "vtkEnSight6Reader",
                      header: "vtkEnSight6Reader.h", bycopy.} = object of vtkEnSightReader
    vtkEnSight6Reader* {.importc: "vtkEnSight6Reader".}: VTK_NEWINSTANCE
    ##  matching of node ids to point ids


proc New*(): ptr vtkEnSight6Reader {.importcpp: "vtkEnSight6Reader::New(@)",
                                 header: "vtkEnSight6Reader.h".}
type
  vtkEnSight6ReaderSuperclass* = vtkEnSightReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEnSight6Reader::IsTypeOf(@)", header: "vtkEnSight6Reader.h".}
proc IsA*(this: var vtkEnSight6Reader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkEnSight6Reader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEnSight6Reader {.
    importcpp: "vtkEnSight6Reader::SafeDownCast(@)", header: "vtkEnSight6Reader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEnSight6Reader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkEnSightReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEnSight6Reader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEnSight6Reader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkEnSight6Reader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkEnSight6Reader.h".}