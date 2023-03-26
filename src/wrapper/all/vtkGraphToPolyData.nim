## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGraphToPolyData.h
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
##  @class   vtkGraphToPolyData
##  @brief   convert a vtkGraph to vtkPolyData
##
##
##  Converts a vtkGraph to a vtkPolyData.  This assumes that the points
##  of the graph have already been filled (perhaps by vtkGraphLayout),
##  and coverts all the edge of the graph into lines in the polydata.
##  The vertex data is passed along to the point data, and the edge data
##  is passed along to the cell data.
##
##  Only the owned graph edges (i.e. edges with ghost level 0) are copied
##  into the vtkPolyData.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkGraphToPolyData* {.importcpp: "vtkGraphToPolyData",
                       header: "vtkGraphToPolyData.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkGraphToPolyData* {.importc: "vtkGraphToPolyData".}: VTK_NEWINSTANCE
    ## *
    ##  Convert the vtkGraph into vtkPolyData.
    ##


proc New*(): ptr vtkGraphToPolyData {.importcpp: "vtkGraphToPolyData::New(@)",
                                  header: "vtkGraphToPolyData.h".}
type
  vtkGraphToPolyDataSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGraphToPolyData::IsTypeOf(@)", header: "vtkGraphToPolyData.h".}
proc IsA*(this: var vtkGraphToPolyData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGraphToPolyData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGraphToPolyData {.
    importcpp: "vtkGraphToPolyData::SafeDownCast(@)",
    header: "vtkGraphToPolyData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGraphToPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGraphToPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGraphToPolyData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGraphToPolyData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGraphToPolyData.h".}
proc SetEdgeGlyphOutput*(this: var vtkGraphToPolyData; _arg: bool) {.
    importcpp: "SetEdgeGlyphOutput", header: "vtkGraphToPolyData.h".}
## !!!Ignored construct:  virtual bool GetEdgeGlyphOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeGlyphOutput  of  << this -> EdgeGlyphOutput ) ; return this -> EdgeGlyphOutput ; } ;
## Error: expected ';'!!!

proc EdgeGlyphOutputOn*(this: var vtkGraphToPolyData) {.
    importcpp: "EdgeGlyphOutputOn", header: "vtkGraphToPolyData.h".}
proc EdgeGlyphOutputOff*(this: var vtkGraphToPolyData) {.
    importcpp: "EdgeGlyphOutputOff", header: "vtkGraphToPolyData.h".}
  ## /@}
  ## /@{
  ## *
  ##  The position of the glyph point along the edge.
  ##  0 puts a glyph point at the source of each edge.
  ##  1 puts a glyph point at the target of each edge.
  ##  An intermediate value will place the glyph point between the source and target.
  ##  The default value is 1.
  ##
proc SetEdgeGlyphOutputEdgeGlyphPosition*(this: var vtkGraphToPolyData;
    _arg: cdouble) {.importcpp: "SetEdgeGlyphOutputEdgeGlyphPosition",
                   header: "vtkGraphToPolyData.h".}
## !!!Ignored construct:  virtual double GetEdgeGlyphOutputEdgeGlyphPosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeGlyphPosition  of  << this -> EdgeGlyphPosition ) ; return this -> EdgeGlyphPosition ; } ;
## Error: expected ';'!!!
