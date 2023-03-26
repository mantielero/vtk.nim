## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTableAlgorithm.h
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
##  @class   vtkTableAlgorithm
##  @brief   Superclass for algorithms that produce only vtkTables as output
##
##
##  vtkTableAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this class
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be Tree. If that
##  isn't the case then please override this method in your subclass.
##
##  @par Thanks:
##  Thanks to Brian Wylie for creating this class.
##

import
  vtkAlgorithm, vtkCommonExecutionModelModule

discard "forward decl of vtkDataSet"
discard "forward decl of vtkTable"
type
  vtkTableAlgorithm* {.importcpp: "vtkTableAlgorithm",
                      header: "vtkTableAlgorithm.h", bycopy.} = object of vtkAlgorithm
    vtkTableAlgorithm* {.importc: "vtkTableAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTableAlgorithm {.importcpp: "vtkTableAlgorithm::New(@)",
                                 header: "vtkTableAlgorithm.h".}
type
  vtkTableAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTableAlgorithm::IsTypeOf(@)", header: "vtkTableAlgorithm.h".}
proc IsA*(this: var vtkTableAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTableAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTableAlgorithm {.
    importcpp: "vtkTableAlgorithm::SafeDownCast(@)", header: "vtkTableAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTableAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTableAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTableAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTableAlgorithm.h".}
proc ProcessRequest*(this: var vtkTableAlgorithm; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkTableAlgorithm.h".}
proc GetOutput*(this: var vtkTableAlgorithm): ptr vtkTable {.importcpp: "GetOutput",
    header: "vtkTableAlgorithm.h".}
proc GetOutput*(this: var vtkTableAlgorithm; index: cint): ptr vtkTable {.
    importcpp: "GetOutput", header: "vtkTableAlgorithm.h".}
proc SetInputData*(this: var vtkTableAlgorithm; obj: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkTableAlgorithm.h".}
proc SetInputData*(this: var vtkTableAlgorithm; index: cint; obj: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkTableAlgorithm.h".}