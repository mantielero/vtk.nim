## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAppendCompositeDataLeaves.h
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
##  @class   vtkAppendCompositeDataLeaves
##  @brief   appends one or more composite datasets with the same structure together into a single
##  output composite dataset
##
##  vtkAppendCompositeDataLeaves is a filter that takes input composite datasets with the same
##  structure: (1) the same number of entries and -- if any children are composites -- the
##  same constraint holds from them; and (2) the same type of dataset at each position.
##  It then creates an output dataset with the same structure whose leaves contain all the
##  cells from the datasets at the corresponding leaves of the input datasets.
##
##  Currently, this filter only supports "appending" of a few types for the leaf
##  nodes and the logic used for each supported data type is as follows:
##
##  \li vtkUnstructuredGrid - appends all unstructured grids from the leaf
##      location on all inputs into a single unstructured grid for the
##      corresponding location in the output composite dataset. PointData and
##      CellData arrays are extracted and appended only if they are available in
##      all datasets.(For example, if one dataset has scalars but another does
##      not, scalars will not be appended.)
##
##  \li vtkPolyData - appends all polydatas from the leaf location on all inputs
##      into a single polydata for the corresponding location in the output
##      composite dataset. PointData and CellData arrays are extracted and
##      appended only if they are available in all datasets.(For example, if one
##      dataset has scalars but another does not, scalars will not be appended.)
##
##  \li vtkImageData/vtkUniformGrid - simply passes the first non-null
##      grid for a particular location to corresponding location in the output.
##
##  \li vtkTable - simply passes the first non-null vtkTable for a particular
##      location to the corresponding location in the output.
##
##  Other types of leaf datasets will be ignored and their positions in the
##  output dataset will be nullptr pointers.
##
##  @sa
##  vtkAppendPolyData vtkAppendFilter
##

import
  vtkCompositeDataSetAlgorithm, vtkFiltersCoreModule

discard "forward decl of vtkCompositeDataIterator"
discard "forward decl of vtkDataSet"
type
  vtkAppendCompositeDataLeaves* {.importcpp: "vtkAppendCompositeDataLeaves",
                                 header: "vtkAppendCompositeDataLeaves.h", bycopy.} = object of vtkCompositeDataSetAlgorithm
    vtkAppendCompositeDataLeaves* {.importc: "vtkAppendCompositeDataLeaves".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAppendCompositeDataLeaves {.
    importcpp: "vtkAppendCompositeDataLeaves::New(@)",
    header: "vtkAppendCompositeDataLeaves.h".}
type
  vtkAppendCompositeDataLeavesSuperclass* = vtkCompositeDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAppendCompositeDataLeaves::IsTypeOf(@)",
    header: "vtkAppendCompositeDataLeaves.h".}
proc IsA*(this: var vtkAppendCompositeDataLeaves; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAppendCompositeDataLeaves.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAppendCompositeDataLeaves {.
    importcpp: "vtkAppendCompositeDataLeaves::SafeDownCast(@)",
    header: "vtkAppendCompositeDataLeaves.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAppendCompositeDataLeaves :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositeDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAppendCompositeDataLeaves :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAppendCompositeDataLeaves :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAppendCompositeDataLeaves; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkAppendCompositeDataLeaves.h".}
proc SetAppendFieldData*(this: var vtkAppendCompositeDataLeaves; _arg: vtkTypeBool) {.
    importcpp: "SetAppendFieldData", header: "vtkAppendCompositeDataLeaves.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAppendFieldData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AppendFieldData  of  << this -> AppendFieldData ) ; return this -> AppendFieldData ; } ;
## Error: expected ';'!!!

proc AppendFieldDataOn*(this: var vtkAppendCompositeDataLeaves) {.
    importcpp: "AppendFieldDataOn", header: "vtkAppendCompositeDataLeaves.h".}
proc AppendFieldDataOff*(this: var vtkAppendCompositeDataLeaves) {.
    importcpp: "AppendFieldDataOff", header: "vtkAppendCompositeDataLeaves.h".}
  ## /@}