## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGraphAlgorithm.h
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
##  @class   vtkGraphAlgorithm
##  @brief   Superclass for algorithms that produce only graph as output
##
##
##  vtkGraphAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this class
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be Graph. If that
##  isn't the case then please override this method in your subclass.
##  You should implement the subclass's algorithm into
##  RequestData( request, inputVec, outputVec).
##
##  @par Thanks:
##  Thanks to Patricia Crossno, Ken Moreland, Andrew Wilson and Brian Wylie from
##  Sandia National Laboratories for their help in developing this class.
##

import
  vtkAlgorithm, vtkCommonExecutionModelModule, vtkGraph

discard "forward decl of vtkDataSet"
type
  vtkGraphAlgorithm* {.importcpp: "vtkGraphAlgorithm",
                      header: "vtkGraphAlgorithm.h", bycopy.} = object of vtkAlgorithm
    vtkGraphAlgorithm* {.importc: "vtkGraphAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGraphAlgorithm {.importcpp: "vtkGraphAlgorithm::New(@)",
                                 header: "vtkGraphAlgorithm.h".}
type
  vtkGraphAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGraphAlgorithm::IsTypeOf(@)", header: "vtkGraphAlgorithm.h".}
proc IsA*(this: var vtkGraphAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGraphAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGraphAlgorithm {.
    importcpp: "vtkGraphAlgorithm::SafeDownCast(@)", header: "vtkGraphAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGraphAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGraphAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGraphAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGraphAlgorithm.h".}
proc ProcessRequest*(this: var vtkGraphAlgorithm; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkGraphAlgorithm.h".}
proc GetOutput*(this: var vtkGraphAlgorithm): ptr vtkGraph {.importcpp: "GetOutput",
    header: "vtkGraphAlgorithm.h".}
proc GetOutput*(this: var vtkGraphAlgorithm; index: cint): ptr vtkGraph {.
    importcpp: "GetOutput", header: "vtkGraphAlgorithm.h".}
proc SetInputData*(this: var vtkGraphAlgorithm; obj: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkGraphAlgorithm.h".}
proc SetInputData*(this: var vtkGraphAlgorithm; index: cint; obj: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkGraphAlgorithm.h".}