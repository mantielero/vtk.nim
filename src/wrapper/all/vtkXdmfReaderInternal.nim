## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXdmfReaderInternal.h
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
##  @class   vtkXdmfReaderInternal
##
##

##  NAMING CONVENTION *********************************************************
##  * all member variables of the type XdmfXml* begin with XML eg. XMLNode
##  * all non-member variables of the type XdmfXml* begin with xml eg. xmlNode
##  * all member variables of the type XdmfElement (and subclasses) begin with
##    XMF eg. XMFGrid
##  * all non-member variables of the type XdmfElement (and subclasses) begin
##    with xmf eg. xmfGrid
##  ***************************************************************************

import
  vtkMutableDirectedGraph, vtkSILBuilder, vtk_xdmf2

## ?

## ?

## ?

## ?

## ?

## ?

discard "forward decl of vtkXdmfDomain"
type
  vtkXdmfDocument* {.importcpp: "vtkXdmfDocument",
                    header: "vtkXdmfReaderInternal.h", bycopy.} = object ## ---------------------------------------------------------------------------
                                                                    ## /@{
                                                                    ## *
                                                                    ##  Parse an xmf file (or string). Both these methods use caching hence calling
                                                                    ##  these methods repeatedly with the same argument will NOT result in
                                                                    ##  re-parsing of the xmf.
                                                                    ##
                                                                    ##  Populates the list of domains.


proc Parse*(this: var vtkXdmfDocument; xmffilename: cstring): bool {.
    importcpp: "Parse", header: "vtkXdmfReaderInternal.h".}
proc ParseString*(this: var vtkXdmfDocument; xmfdata: cstring; length: csize_t): bool {.
    importcpp: "ParseString", header: "vtkXdmfReaderInternal.h".}
proc GetDomains*(this: var vtkXdmfDocument): vector[string] {.
    importcpp: "GetDomains", header: "vtkXdmfReaderInternal.h".}
proc SetActiveDomain*(this: var vtkXdmfDocument; domainname: cstring): bool {.
    importcpp: "SetActiveDomain", header: "vtkXdmfReaderInternal.h".}
proc SetActiveDomain*(this: var vtkXdmfDocument; index: cint): bool {.
    importcpp: "SetActiveDomain", header: "vtkXdmfReaderInternal.h".}
proc GetActiveDomain*(this: var vtkXdmfDocument): ptr vtkXdmfDomain {.
    importcpp: "GetActiveDomain", header: "vtkXdmfReaderInternal.h".}
proc constructvtkXdmfDocument*(): vtkXdmfDocument {.constructor,
    importcpp: "vtkXdmfDocument(@)", header: "vtkXdmfReaderInternal.h".}
proc destroyvtkXdmfDocument*(this: var vtkXdmfDocument) {.
    importcpp: "#.~vtkXdmfDocument()", header: "vtkXdmfReaderInternal.h".}
##  I don't use vtkDataArraySelection since it's very slow when it comes to large
##  number of arrays.

type
  vtkXdmfArraySelection* {.importcpp: "vtkXdmfArraySelection",
                          header: "vtkXdmfReaderInternal.h", bycopy.} = object of map[
      string, bool]


proc Merge*(this: var vtkXdmfArraySelection; other: vtkXdmfArraySelection) {.
    importcpp: "Merge", header: "vtkXdmfReaderInternal.h".}
proc AddArray*(this: var vtkXdmfArraySelection; name: cstring; status: bool = true) {.
    importcpp: "AddArray", header: "vtkXdmfReaderInternal.h".}
proc ArrayIsEnabled*(this: var vtkXdmfArraySelection; name: cstring): bool {.
    importcpp: "ArrayIsEnabled", header: "vtkXdmfReaderInternal.h".}
proc HasArray*(this: var vtkXdmfArraySelection; name: cstring): bool {.
    importcpp: "HasArray", header: "vtkXdmfReaderInternal.h".}
proc GetArraySetting*(this: var vtkXdmfArraySelection; name: cstring): cint {.
    importcpp: "GetArraySetting", header: "vtkXdmfReaderInternal.h".}
proc SetArrayStatus*(this: var vtkXdmfArraySelection; name: cstring; status: bool) {.
    importcpp: "SetArrayStatus", header: "vtkXdmfReaderInternal.h".}
proc GetArrayName*(this: var vtkXdmfArraySelection; index: cint): cstring {.
    importcpp: "GetArrayName", header: "vtkXdmfReaderInternal.h".}
proc GetNumberOfArrays*(this: var vtkXdmfArraySelection): cint {.
    importcpp: "GetNumberOfArrays", header: "vtkXdmfReaderInternal.h".}
## ***************************************************************************

type
  vtkXdmfDomain* {.importcpp: "vtkXdmfDomain", header: "vtkXdmfReaderInternal.h",
                  bycopy.} = object ## ---------------------------------------------------------------------------
                                 ##  does not take ownership of the DOM, however the xmlDom must exist as long
                                 ##  as the instance is in use.
                                 ## *
                                 ##  There are a few meta-information that we need to collect from the domain
                                 ##  * number of data-arrays so that the user can choose which to load.
                                 ##  * grid-structure so that the user can choose the hierarchy
                                 ##  * time information so that reader can report the number of timesteps
                                 ##  available.
                                 ##  This does another book-keeping task of ensuring that all grids have valid
                                 ##  names. If a grid is not named, then we make up a name.
                                 ##  TODO: We can use GRID centered attributes to create hierarchies in the SIL.
                                 ##
    ##  these are node indices used when building the SIL.
    ## < Only discrete timesteps are currently
    ##   supported.


proc constructvtkXdmfDomain*(xmlDom: ptr XdmfDOM; domain_index: cint): vtkXdmfDomain {.
    constructor, importcpp: "vtkXdmfDomain(@)", header: "vtkXdmfReaderInternal.h".}
proc IsValid*(this: var vtkXdmfDomain): bool {.importcpp: "IsValid",
    header: "vtkXdmfReaderInternal.h".}
proc GetSIL*(this: var vtkXdmfDomain): ptr vtkGraph {.importcpp: "GetSIL",
    header: "vtkXdmfReaderInternal.h".}
proc GetNumberOfGrids*(this: var vtkXdmfDomain): XdmfInt64 {.
    importcpp: "GetNumberOfGrids", header: "vtkXdmfReaderInternal.h".}
proc GetGrid*(this: var vtkXdmfDomain; cc: XdmfInt64): ptr XdmfGrid {.
    importcpp: "GetGrid", header: "vtkXdmfReaderInternal.h".}
proc GetVTKDataType*(this: var vtkXdmfDomain): cint {.importcpp: "GetVTKDataType",
    header: "vtkXdmfReaderInternal.h".}
proc GetTimeSteps*(this: var vtkXdmfDomain): map[XdmfFloat64, cint] {.
    importcpp: "GetTimeSteps", header: "vtkXdmfReaderInternal.h".}
proc GetTimeStepsRev*(this: var vtkXdmfDomain): map[cint, XdmfFloat64] {.
    importcpp: "GetTimeStepsRev", header: "vtkXdmfReaderInternal.h".}
proc GetIndexForTime*(this: var vtkXdmfDomain; time: cdouble): cint {.
    importcpp: "GetIndexForTime", header: "vtkXdmfReaderInternal.h".}
proc GetTimeForIndex*(this: var vtkXdmfDomain; index: cint): XdmfFloat64 {.
    importcpp: "GetTimeForIndex", header: "vtkXdmfReaderInternal.h".}
proc GetGrid*(this: var vtkXdmfDomain; xmfGrid: ptr XdmfGrid; time: cdouble): ptr XdmfGrid {.
    importcpp: "GetGrid", header: "vtkXdmfReaderInternal.h".}
proc IsStructured*(this: var vtkXdmfDomain; a2: ptr XdmfGrid): bool {.
    importcpp: "IsStructured", header: "vtkXdmfReaderInternal.h".}
proc GetWholeExtent*(this: var vtkXdmfDomain; a2: ptr XdmfGrid; extents: array[6, cint]): bool {.
    importcpp: "GetWholeExtent", header: "vtkXdmfReaderInternal.h".}
proc GetOriginAndSpacing*(this: var vtkXdmfDomain; a2: ptr XdmfGrid;
                         origin: array[3, cdouble]; spacing: array[3, cdouble]): bool {.
    importcpp: "GetOriginAndSpacing", header: "vtkXdmfReaderInternal.h".}
proc destroyvtkXdmfDomain*(this: var vtkXdmfDomain) {.
    importcpp: "#.~vtkXdmfDomain()", header: "vtkXdmfReaderInternal.h".}
proc GetVTKDataType*(this: var vtkXdmfDomain; xmfGrid: ptr XdmfGrid): cint {.
    importcpp: "GetVTKDataType", header: "vtkXdmfReaderInternal.h".}
proc GetDataDimensionality*(xmfGrid: ptr XdmfGrid): cint {.
    importcpp: "vtkXdmfDomain::GetDataDimensionality(@)",
    header: "vtkXdmfReaderInternal.h".}
proc GetPointArraySelection*(this: var vtkXdmfDomain): ptr vtkXdmfArraySelection {.
    importcpp: "GetPointArraySelection", header: "vtkXdmfReaderInternal.h".}
proc GetCellArraySelection*(this: var vtkXdmfDomain): ptr vtkXdmfArraySelection {.
    importcpp: "GetCellArraySelection", header: "vtkXdmfReaderInternal.h".}
proc GetGridSelection*(this: var vtkXdmfDomain): ptr vtkXdmfArraySelection {.
    importcpp: "GetGridSelection", header: "vtkXdmfReaderInternal.h".}
proc GetSetsSelection*(this: var vtkXdmfDomain): ptr vtkXdmfArraySelection {.
    importcpp: "GetSetsSelection", header: "vtkXdmfReaderInternal.h".}
##  VTK-HeaderTest-Exclude: vtkXdmfReaderInternal.h
