## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMPASReader.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## =========================================================================
##
## Copyright (c) 2002-2005 Los Alamos National Laboratory
##
## This software and ancillary information known as vtk_ext (and herein
## called "SOFTWARE") is made available under the terms described below.
## The SOFTWARE has been approved for release with associated LA_CC
## Number 99-44, granted by Los Alamos National Laboratory in July 1999.
##
## Unless otherwise indicated, this SOFTWARE has been authored by an
## employee or employees of the University of California, operator of the
## Los Alamos National Laboratory under Contract No. W-7405-ENG-36 with
## the United States Department of Energy.
##
## The United States Government has rights to use, reproduce, and
## distribute this SOFTWARE.  The public may copy, distribute, prepare
## derivative works and publicly display this SOFTWARE without charge,
## provided that this Notice and any statement of authorship are
## reproduced on all copies.
##
## Neither the U. S. Government, the University of California, nor the
## Advanced Computing Laboratory makes any warranty, either express or
## implied, nor assumes any liability or responsibility for the use of
## this SOFTWARE.
##
## If SOFTWARE is modified to produce derivative works, such modified
## SOFTWARE should be clearly marked, so as not to confuse it with the
## version available from Los Alamos National Laboratory.
##
## =========================================================================
## *
##  @class   vtkMPASReader
##  @brief   Read an MPAS netCDF file
##
##  This program reads an MPAS netCDF data file to allow paraview to
##  display a dual-grid sphere or latlon projection.  Also allows
##  display of primal-grid sphere.
##  The variables that have time dim are available to ParaView.
##
##  Assume all variables are of interest if they have dims
##  (Time, nCells|nVertices, nVertLevels, [nTracers]).
##  Does not deal with edge data.
##
##  When using this reader, it is important that you remember to do the
## following:
##    1.  When changing a selected variable, remember to select it also
##        in the drop down box to "color by".  It doesn't color by that variable
##        automatically.
##    2.  When selecting multilayer sphere view, make layer thickness around
##        100,000.
##    3.  When selecting multilayer lat/lon view, make layer thickness around 10.
##    4.  Always click the -Z orientation after making a switch from lat/lon to
##        sphere, from single to multilayer or changing thickness.
##    5.  Be conservative on the number of changes you make before hitting Apply,
##        since there may be bugs in this reader.  Just make one change and then
##        hit Apply.
##
##
##  Christine Ahrens (cahrens@lanl.gov)
##  Version 1.3
##

import
  vtkIONetCDFModule, vtkUnstructuredGridAlgorithm

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkStdString"
discard "forward decl of vtkStringArray"
type
  vtkMPASReader* {.importcpp: "vtkMPASReader", header: "vtkMPASReader.h", bycopy.} = object of vtkUnstructuredGridAlgorithm
    vtkMPASReader* {.importc: "vtkMPASReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  First field part file giving path
    ##  Temporal domain
    ##  The current time
    ##  Observer to modify this object when array selections are modified
    ## *
    ##  Update the list of available dimensions. Only does work when
    ##  PointDataArraySelection or CellDataArraySelection is changed.
    ##
    ##  User option
    ##  Data file attribute
    ##  geometry
    ##  current extra point
    ##  current extra cell
    ##  x coord of point
    ##  y coord of point
    ##  z coord of point
    ##  original connections
    ##  modified connections
    ##  maps from added cell to original cell #
    ##  maps from added point to original point #
    ##  max cells
    ##  max points


proc New*(): ptr vtkMPASReader {.importcpp: "vtkMPASReader::New(@)",
                             header: "vtkMPASReader.h".}
type
  vtkMPASReaderSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMPASReader::IsTypeOf(@)", header: "vtkMPASReader.h".}
proc IsA*(this: var vtkMPASReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMPASReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMPASReader {.
    importcpp: "vtkMPASReader::SafeDownCast(@)", header: "vtkMPASReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMPASReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMPASReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMPASReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMPASReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMPASReader.h".}
## !!!Ignored construct:  /@{ *
##  Specify file name of MPAS data file to read.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the number of data cells
##  virtual int GetMaximumCellsMaximumCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumCells  of  << this -> MaximumCells ) ; return this -> MaximumCells ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the number of points
##  virtual int GetMaximumCellsMaximumCellsMaximumPointsMaximumPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumPoints  of  << this -> MaximumPoints ) ; return this -> MaximumPoints ; } ;
## Error: expected ';'!!!

proc GetNumberOfCellVars*(this: var vtkMPASReader): cint {.
    importcpp: "GetNumberOfCellVars", header: "vtkMPASReader.h".}
proc GetNumberOfPointVars*(this: var vtkMPASReader): cint {.
    importcpp: "GetNumberOfPointVars", header: "vtkMPASReader.h".}
proc GetOutput*(this: var vtkMPASReader): ptr vtkUnstructuredGrid {.
    importcpp: "GetOutput", header: "vtkMPASReader.h".}
proc GetOutput*(this: var vtkMPASReader; idx: cint): ptr vtkUnstructuredGrid {.
    importcpp: "GetOutput", header: "vtkMPASReader.h".}
proc SetUseDimensionedArrayNames*(this: var vtkMPASReader; _arg: bool) {.
    importcpp: "SetUseDimensionedArrayNames", header: "vtkMPASReader.h".}
## !!!Ignored construct:  virtual bool GetMaximumCellsMaximumCellsMaximumPointsMaximumPointsUseDimensionedArrayNames ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDimensionedArrayNames  of  << this -> UseDimensionedArrayNames ) ; return this -> UseDimensionedArrayNames ; } ;
## Error: expected ';'!!!

proc UseDimensionedArrayNamesOn*(this: var vtkMPASReader) {.
    importcpp: "UseDimensionedArrayNamesOn", header: "vtkMPASReader.h".}
proc UseDimensionedArrayNamesOff*(this: var vtkMPASReader) {.
    importcpp: "UseDimensionedArrayNamesOff", header: "vtkMPASReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  The following methods allow selective reading of solutions fields.
  ##  By default, ALL data fields on the nodes are read, but this can
  ##  be modified.
  ##
proc GetNumberOfPointArrays*(this: var vtkMPASReader): cint {.
    importcpp: "GetNumberOfPointArrays", header: "vtkMPASReader.h".}
proc GetPointArrayName*(this: var vtkMPASReader; index: cint): cstring {.
    importcpp: "GetPointArrayName", header: "vtkMPASReader.h".}
proc GetPointArrayStatus*(this: var vtkMPASReader; name: cstring): cint {.
    importcpp: "GetPointArrayStatus", header: "vtkMPASReader.h".}
proc SetPointArrayStatus*(this: var vtkMPASReader; name: cstring; status: cint) {.
    importcpp: "SetPointArrayStatus", header: "vtkMPASReader.h".}
proc DisableAllPointArrays*(this: var vtkMPASReader) {.
    importcpp: "DisableAllPointArrays", header: "vtkMPASReader.h".}
proc EnableAllPointArrays*(this: var vtkMPASReader) {.
    importcpp: "EnableAllPointArrays", header: "vtkMPASReader.h".}
proc GetNumberOfCellArrays*(this: var vtkMPASReader): cint {.
    importcpp: "GetNumberOfCellArrays", header: "vtkMPASReader.h".}
proc GetCellArrayName*(this: var vtkMPASReader; index: cint): cstring {.
    importcpp: "GetCellArrayName", header: "vtkMPASReader.h".}
proc GetCellArrayStatus*(this: var vtkMPASReader; name: cstring): cint {.
    importcpp: "GetCellArrayStatus", header: "vtkMPASReader.h".}
proc SetCellArrayStatus*(this: var vtkMPASReader; name: cstring; status: cint) {.
    importcpp: "SetCellArrayStatus", header: "vtkMPASReader.h".}
proc DisableAllCellArrays*(this: var vtkMPASReader) {.
    importcpp: "DisableAllCellArrays", header: "vtkMPASReader.h".}
proc EnableAllCellArrays*(this: var vtkMPASReader) {.
    importcpp: "EnableAllCellArrays", header: "vtkMPASReader.h".}
proc GetNumberOfDimensions*(this: var vtkMPASReader): vtkIdType {.
    importcpp: "GetNumberOfDimensions", header: "vtkMPASReader.h".}
proc GetDimensionName*(this: var vtkMPASReader; idx: cint): string {.
    importcpp: "GetDimensionName", header: "vtkMPASReader.h".}
proc GetAllDimensions*(this: var vtkMPASReader): ptr vtkStringArray {.
    importcpp: "GetAllDimensions", header: "vtkMPASReader.h".}
proc GetDimensionCurrentIndex*(this: var vtkMPASReader; dim: string): cint {.
    importcpp: "GetDimensionCurrentIndex", header: "vtkMPASReader.h".}
proc SetDimensionCurrentIndex*(this: var vtkMPASReader; dim: string; idx: cint) {.
    importcpp: "SetDimensionCurrentIndex", header: "vtkMPASReader.h".}
proc GetDimensionSize*(this: var vtkMPASReader; dim: string): cint {.
    importcpp: "GetDimensionSize", header: "vtkMPASReader.h".}
proc SetUseDimensionedArrayNamesVerticalDimension*(this: var vtkMPASReader;
    _arg: string) {.importcpp: "SetUseDimensionedArrayNamesVerticalDimension",
                  header: "vtkMPASReader.h".}
## !!!Ignored construct:  virtual std :: string GetMaximumCellsMaximumCellsMaximumPointsMaximumPointsUseDimensionedArrayNamesVerticalDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VerticalDimension  of  << this -> VerticalDimension ) ; return this -> VerticalDimension ; } ;
## Error: expected ';'!!!

proc SetVerticalLevel*(this: var vtkMPASReader; level: cint) {.
    importcpp: "SetVerticalLevel", header: "vtkMPASReader.h".}
proc GetVerticalLevel*(this: var vtkMPASReader): cint {.
    importcpp: "GetVerticalLevel", header: "vtkMPASReader.h".}
## !!!Ignored construct:  /@} virtual int * GetVerticalLevelRangeVerticalLevelRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << VerticalLevelRange  pointer  << this -> VerticalLevelRange ) ; return this -> VerticalLevelRange ; } VTK_WRAPEXCLUDE virtual void GetVerticalLevelRangeVerticalLevelRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> VerticalLevelRange [ 0 ] ; _arg2 = this -> VerticalLevelRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << VerticalLevelRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetVerticalLevelRangeVerticalLevelRange ( int _arg [ 2 ] ) { this -> GetVerticalLevelRangeVerticalLevelRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetUseDimensionedArrayNamesVerticalDimensionLayerThickness*(
    this: var vtkMPASReader; _arg: cint) {.importcpp: "SetUseDimensionedArrayNamesVerticalDimensionLayerThickness",
                                      header: "vtkMPASReader.h".}
## !!!Ignored construct:  virtual int GetMaximumCellsMaximumCellsMaximumPointsMaximumPointsUseDimensionedArrayNamesVerticalDimensionLayerThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LayerThickness  of  << this -> LayerThickness ) ; return this -> LayerThickness ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int * GetVerticalLevelRangeVerticalLevelRangeLayerThicknessRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LayerThicknessRange  pointer  << this -> LayerThicknessRange ) ; return this -> LayerThicknessRange ; } VTK_WRAPEXCLUDE virtual void GetVerticalLevelRangeVerticalLevelRangeLayerThicknessRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> LayerThicknessRange [ 0 ] ; _arg2 = this -> LayerThicknessRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LayerThicknessRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetVerticalLevelRangeVerticalLevelRangeLayerThicknessRange ( int _arg [ 2 ] ) { this -> GetVerticalLevelRangeVerticalLevelRangeLayerThicknessRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetCenterLon*(this: var vtkMPASReader; val: cint) {.importcpp: "SetCenterLon",
    header: "vtkMPASReader.h".}
## !!!Ignored construct:  virtual int * GetVerticalLevelRangeVerticalLevelRangeLayerThicknessRangeCenterLonRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CenterLonRange  pointer  << this -> CenterLonRange ) ; return this -> CenterLonRange ; } VTK_WRAPEXCLUDE virtual void GetVerticalLevelRangeVerticalLevelRangeLayerThicknessRangeCenterLonRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> CenterLonRange [ 0 ] ; _arg2 = this -> CenterLonRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CenterLonRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetVerticalLevelRangeVerticalLevelRangeLayerThicknessRangeCenterLonRange ( int _arg [ 2 ] ) { this -> GetVerticalLevelRangeVerticalLevelRangeLayerThicknessRangeCenterLonRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLon*(
    this: var vtkMPASReader; _arg: bool) {.importcpp: "SetUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLon",
                                      header: "vtkMPASReader.h".}
## !!!Ignored construct:  virtual bool GetMaximumCellsMaximumCellsMaximumPointsMaximumPointsUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLon ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectLatLon  of  << this -> ProjectLatLon ) ; return this -> ProjectLatLon ; } ;
## Error: expected ';'!!!

proc SetUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLonIsAtmosphere*(
    this: var vtkMPASReader; _arg: bool) {.importcpp: "SetUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLonIsAtmosphere",
                                      header: "vtkMPASReader.h".}
## !!!Ignored construct:  virtual bool GetMaximumCellsMaximumCellsMaximumPointsMaximumPointsUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLonIsAtmosphere ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IsAtmosphere  of  << this -> IsAtmosphere ) ; return this -> IsAtmosphere ; } ;
## Error: expected ';'!!!

proc SetUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLonIsAtmosphereIsZeroCentered*(
    this: var vtkMPASReader; _arg: bool) {.importcpp: "SetUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLonIsAtmosphereIsZeroCentered",
                                      header: "vtkMPASReader.h".}
## !!!Ignored construct:  virtual bool GetMaximumCellsMaximumCellsMaximumPointsMaximumPointsUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLonIsAtmosphereIsZeroCentered ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IsZeroCentered  of  << this -> IsZeroCentered ) ; return this -> IsZeroCentered ; } ;
## Error: expected ';'!!!

proc SetUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLonIsAtmosphereIsZeroCenteredShowMultilayerView*(
    this: var vtkMPASReader; _arg: bool) {.importcpp: "SetUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLonIsAtmosphereIsZeroCenteredShowMultilayerView",
                                      header: "vtkMPASReader.h".}
## !!!Ignored construct:  virtual bool GetMaximumCellsMaximumCellsMaximumPointsMaximumPointsUseDimensionedArrayNamesVerticalDimensionLayerThicknessProjectLatLonIsAtmosphereIsZeroCenteredShowMultilayerView ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowMultilayerView  of  << this -> ShowMultilayerView ) ; return this -> ShowMultilayerView ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Returns true if the given file can be read.
##  static int CanReadFile ( VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!

proc GetMTime*(this: var vtkMPASReader): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkMPASReader.h".}