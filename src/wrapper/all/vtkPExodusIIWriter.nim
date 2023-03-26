## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExodusIIWriter.h
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
##  @class   vtkPExodusIIWriter
##  @brief   Write Exodus II files
##
##      This is a vtkWriter that writes it's vtkUnstructuredGrid
##      input out to an Exodus II file.  Go to http://endo.sandia.gov/SEACAS/
##      for more information about the Exodus II format.
##
##      Exodus files contain much information that is not captured
##      in a vtkUnstructuredGrid, such as time steps, information
##      lines, node sets, and side sets.  This information can be
##      stored in a vtkModelMetadata object.
##
##      The vtkExodusReader and vtkPExodusReader can create
##      a vtkModelMetadata object and embed it in a vtkUnstructuredGrid
##      in a series of field arrays.  This writer searches for these
##      field arrays and will use the metadata contained in them
##      when creating the new Exodus II file.
##
##      You can also explicitly give the vtkExodusIIWriter a
##      vtkModelMetadata object to use when writing the file.
##
##      In the absence of the information provided by vtkModelMetadata,
##      if this writer is not part of a parallel application, we will use
##      reasonable defaults for all the values in the output Exodus file.
##      If you don't provide a block ID element array, we'll create a
##      block for each cell type that appears in the unstructured grid.
##
##      However if this writer is part of a parallel application (hence
##      writing out a distributed Exodus file), then we need at the very
##      least a list of all the block IDs that appear in the file.  And
##      we need the element array of block IDs for the input unstructured grid.
##
##      In the absence of a vtkModelMetadata object, you can also provide
##      time step information which we will include in the output Exodus
##      file.
##
##  @warning
##      If the input floating point field arrays and point locations are all
##      floats or all doubles, this class will operate more efficiently.
##      Mixing floats and doubles will slow you down, because Exodus II
##      requires that we write only floats or only doubles.
##
##  @warning
##      We use the terms "point" and "node" interchangeably.
##      Also, we use the terms "element" and "cell" interchangeably.
##

import
  vtkExodusIIWriter, vtkIOParallelExodusModule, vtkSmartPointer

discard "forward decl of vtkModelMetadata"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkPExodusIIWriter* {.importcpp: "vtkPExodusIIWriter",
                       header: "vtkPExodusIIWriter.h", bycopy.} = object of vtkExodusIIWriter
    vtkPExodusIIWriter* {.importc: "vtkPExodusIIWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPExodusIIWriter {.importcpp: "vtkPExodusIIWriter::New(@)",
                                  header: "vtkPExodusIIWriter.h".}
type
  vtkPExodusIIWriterSuperclass* = vtkExodusIIWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPExodusIIWriter::IsTypeOf(@)", header: "vtkPExodusIIWriter.h".}
proc IsA*(this: var vtkPExodusIIWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPExodusIIWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPExodusIIWriter {.
    importcpp: "vtkPExodusIIWriter::SafeDownCast(@)",
    header: "vtkPExodusIIWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPExodusIIWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExodusIIWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPExodusIIWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPExodusIIWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPExodusIIWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPExodusIIWriter.h".}