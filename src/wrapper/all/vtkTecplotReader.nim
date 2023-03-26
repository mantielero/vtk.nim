## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTecplotReader.h
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
## ****************************************************************************
##
##  Copyright (c) 2000 - 2009, Lawrence Livermore National Security, LLC
##  Produced at the Lawrence Livermore National Laboratory
##  LLNL-CODE-400124
##  All rights reserved.
##
##  This file was adapted from the ASCII Tecplot reader of VisIt. For details,
##  see https://visit.llnl.gov/.  The full copyright notice is contained in the
##  file COPYRIGHT located at the root of the VisIt distribution or at
##  http://www.llnl.gov/visit/copyright.html.
##
## ***************************************************************************
## *
##  @class   vtkTecplotReader
##  @brief   A concrete class to read an ASCII Tecplot file.
##
##
##   vtkTecplotReader parses an ASCII Tecplot file to get a vtkMultiBlockDataSet
##   object made up of several vtkDataSet objects, of which each is of type
##   either vtkStructuredGrid or vtkUnstructuredGrid. Each vtkDataSet object
##   maintains the geometry, topology, and some associated attributes describing
##   physical properties.
##
##   Tecplot treats 3D coordinates (only one or two coordinates might be
##   explicitly specified in a file) as variables too, whose names (e.g.,
##   'X' / 'x' / 'I', 'Y' / 'y' / 'J', 'Z' / 'z' / 'K') are provided in the
##   variables list (the 'VARIABLES' section). These names are then followed
##   in the list by those of other traditional variables or attributes (node-
##   based and / or cell-based data with the mode specified via token 'VAR
##   LOCATION', to be extracted to create vtkPointData and / or vtkCellData).
##   Each zone described afterwards (in the 'ZONE's section) provides the
##   specific values of the aforementioned variables (including 3D coordinates),
##   in the same order as indicated by the variable-names list, through either
##   POINT-packing (i.e., tuple-based storage) or BLOCK-packing (component-based
##   storage). In particular, the first / description line of each zone tells
##   the type of all the constituent cells as the connectivity / topology
##   information. In other words, the entire dataset is made up of multiple zones
##   (blocks), of which each maintains a set of cells of the same type ('BRICK',
##   'TRIANGLE', 'QUADRILATERAL', 'TETRAHEDRON', and 'POINT' in Tecplot terms).
##   In addition, the description line of each zone specifies the zone name,
##   dimensionality information (size of each dimension for a structured zone),
##   number of nodes, and number of cells. Information about the file format is
##   available at http://download.tecplot.com/360/dataformat.pdf.
##
##  @warning
##   vtkTecplotReader is currently a simplified ASCII Tecplot reader and some
##   functionalities (e.g., extraction of sections 'GEOMETRY', 'TEXT', and 'DATA
##   SETAUXDATA', access to multiple time steps, in addition to the construction
##   of vtkRectilinearGrid and vtkImageData objects) are not supported.
##
##  @par Thanks:
##   This class is a VTK implementation of VisIt's ASCII Tecplot reader.
##
##  @sa
##   vtkPoints vtkStructuredGrid vtkUnstructuredGrid vtkPointData vtkCellData
##   vtkDataSet vtkMultiBlockDataSet
##

import
  vtkIOGeometryModule, vtkMultiBlockDataSetAlgorithm

discard "forward decl of vtkPoints"
discard "forward decl of vtkCellData"
discard "forward decl of vtkPointData"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkTecplotReaderInternal"
type
  vtkTecplotReader* {.importcpp: "vtkTecplotReader", header: "vtkTecplotReader.h",
                     bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkTecplotReader* {.importc: "vtkTecplotReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTecplotReader {.importcpp: "vtkTecplotReader::New(@)",
                                header: "vtkTecplotReader.h".}
type
  vtkTecplotReaderSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTecplotReader::IsTypeOf(@)", header: "vtkTecplotReader.h".}
proc IsA*(this: var vtkTecplotReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTecplotReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTecplotReader {.
    importcpp: "vtkTecplotReader::SafeDownCast(@)", header: "vtkTecplotReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTecplotReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTecplotReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTecplotReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTecplotReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTecplotReader.h".}
## !!!Ignored construct:  /@{ *
##  Get the number of all variables (including 3D coordinates).
##  virtual int GetNumberOfVariablesNumberOfVariables ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfVariables  of  << this -> NumberOfVariables ) ; return this -> NumberOfVariables ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Specify a Tecplot ASCII file for data loading.
##  void SetFileName ( VTK_FILEPATH const char * fileName ) ;
## Error: token expected: ) but got: *!!!

proc GetDataTitle*(this: var vtkTecplotReader): cstring {.importcpp: "GetDataTitle",
    header: "vtkTecplotReader.h".}
proc GetNumberOfBlocks*(this: var vtkTecplotReader): cint {.
    importcpp: "GetNumberOfBlocks", header: "vtkTecplotReader.h".}
proc GetBlockName*(this: var vtkTecplotReader; blockIdx: cint): cstring {.
    importcpp: "GetBlockName", header: "vtkTecplotReader.h".}
proc GetNumberOfDataAttributes*(this: var vtkTecplotReader): cint {.
    importcpp: "GetNumberOfDataAttributes", header: "vtkTecplotReader.h".}
proc GetDataAttributeName*(this: var vtkTecplotReader; attrIndx: cint): cstring {.
    importcpp: "GetDataAttributeName", header: "vtkTecplotReader.h".}
proc IsDataAttributeCellBased*(this: var vtkTecplotReader; attrName: cstring): cint {.
    importcpp: "IsDataAttributeCellBased", header: "vtkTecplotReader.h".}
proc IsDataAttributeCellBased*(this: var vtkTecplotReader; attrIndx: cint): cint {.
    importcpp: "IsDataAttributeCellBased", header: "vtkTecplotReader.h".}
proc GetNumberOfDataArrays*(this: var vtkTecplotReader): cint {.
    importcpp: "GetNumberOfDataArrays", header: "vtkTecplotReader.h".}
proc GetDataArrayName*(this: var vtkTecplotReader; arrayIdx: cint): cstring {.
    importcpp: "GetDataArrayName", header: "vtkTecplotReader.h".}
proc GetDataArrayStatus*(this: var vtkTecplotReader; arayName: cstring): cint {.
    importcpp: "GetDataArrayStatus", header: "vtkTecplotReader.h".}
proc SetDataArrayStatus*(this: var vtkTecplotReader; arayName: cstring; bChecked: cint) {.
    importcpp: "SetDataArrayStatus", header: "vtkTecplotReader.h".}