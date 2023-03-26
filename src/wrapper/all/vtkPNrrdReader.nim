##  -*- c++ -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPNrrdReader.h
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
##  @class   vtkPNrrdReader
##  @brief   Read nrrd files efficiently from parallel file systems (and reasonably well elsewhere).
##
##
##
##  vtkPNrrdReader is a subclass of vtkNrrdReader that will read Nrrd format
##  header information of the image before reading the data.  This means that the
##  reader will automatically set information like file dimensions.
##
##
##  @bug
##  There are several limitations on what type of nrrd files we can read.  This
##  reader only supports nrrd files in raw format.  Other encodings like ascii
##  and hex will result in errors.  When reading in detached headers, this only
##  supports reading one file that is detached.
##
##

import
  vtkIOMPIImageModule, vtkNrrdReader

discard "forward decl of vtkCharArray"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkMPIOpaqueFileHandle"
type
  vtkPNrrdReader* {.importcpp: "vtkPNrrdReader", header: "vtkPNrrdReader.h", bycopy.} = object of vtkNrrdReader
    vtkPNrrdReader* {.importc: "vtkPNrrdReader".}: VTK_NEWINSTANCE
    ## /@}

  vtkPNrrdReaderSuperclass* = vtkNrrdReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPNrrdReader::IsTypeOf(@)", header: "vtkPNrrdReader.h".}
proc IsA*(this: var vtkPNrrdReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPNrrdReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPNrrdReader {.
    importcpp: "vtkPNrrdReader::SafeDownCast(@)", header: "vtkPNrrdReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPNrrdReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNrrdReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPNrrdReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPNrrdReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkPNrrdReader {.importcpp: "vtkPNrrdReader::New(@)",
                              header: "vtkPNrrdReader.h".}
proc PrintSelf*(this: var vtkPNrrdReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPNrrdReader.h".}
proc GetnameController*(this: var vtkPNrrdReader): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPNrrdReader.h".}
proc SetController*(this: var vtkPNrrdReader; a2: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkPNrrdReader.h".}