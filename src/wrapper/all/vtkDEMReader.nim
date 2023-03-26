## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDEMReader.h
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
##  @class   vtkDEMReader
##  @brief   read a digital elevation model (DEM) file
##
##  vtkDEMReader reads digital elevation files and creates image data.
##  Digital elevation files are produced by the
##  <A HREF="http://www.usgs.gov">US Geological Survey</A>.
##  A complete description of the DEM file is located at the USGS site.
##  The reader reads the entire dem file and create a vtkImageData that
##  contains a single scalar component that is the elevation in meters.
##  The spacing is also expressed in meters. A number of get methods
##  provide access to fields on the header.
##

import
  vtkIOImageModule, vtkImageAlgorithm

type
  vtkDEMReader* {.importcpp: "vtkDEMReader", header: "vtkDEMReader.h", bycopy.} = object of vtkImageAlgorithm
    vtkDEMReader* {.importc: "vtkDEMReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkDEMReader {.importcpp: "vtkDEMReader::New(@)",
                            header: "vtkDEMReader.h".}
type
  vtkDEMReaderSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDEMReader::IsTypeOf(@)", header: "vtkDEMReader.h".}
proc IsA*(this: var vtkDEMReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDEMReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDEMReader {.
    importcpp: "vtkDEMReader::SafeDownCast(@)", header: "vtkDEMReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDEMReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDEMReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDEMReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDEMReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDEMReader.h".}
## !!!Ignored construct:  /@{ *
##  Specify file name of Digital Elevation Model (DEM) file
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

const
  vtkDEMReaderREFERENCE_SEA_LEVEL* = 0
  vtkDEMReaderREFERENCE_ELEVATION_BOUNDS* = 1

proc SetElevationReference*(this: var vtkDEMReader; _arg: cint) {.
    importcpp: "SetElevationReference", header: "vtkDEMReader.h".}
proc GetElevationReferenceMinValue*(this: var vtkDEMReader): cint {.
    importcpp: "GetElevationReferenceMinValue", header: "vtkDEMReader.h".}
proc GetElevationReferenceMaxValue*(this: var vtkDEMReader): cint {.
    importcpp: "GetElevationReferenceMaxValue", header: "vtkDEMReader.h".}
## !!!Ignored construct:  virtual int GetElevationReference ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ElevationReference  of  << this -> ElevationReference ) ; return this -> ElevationReference ; } ;
## Error: expected ';'!!!

proc SetElevationReferenceToSeaLevel*(this: var vtkDEMReader) {.
    importcpp: "SetElevationReferenceToSeaLevel", header: "vtkDEMReader.h".}
proc SetElevationReferenceToElevationBounds*(this: var vtkDEMReader) {.
    importcpp: "SetElevationReferenceToElevationBounds", header: "vtkDEMReader.h".}
proc GetElevationReferenceAsString*(this: var vtkDEMReader): cstring {.
    importcpp: "GetElevationReferenceAsString", header: "vtkDEMReader.h".}
proc GetMapLabel*(this: var vtkDEMReader): cstring {.importcpp: "GetMapLabel",
    header: "vtkDEMReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Code 1=DEM-1, 2=DEM_2, ...
  ##
## !!!Ignored construct:  virtual int GetElevationReferenceDEMLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DEMLevel  of  << this -> DEMLevel ) ; return this -> DEMLevel ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Code 1=regular, 2=random, reserved for future use
##  virtual int GetElevationReferenceDEMLevelElevationPatternElevationPattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ElevationPattern  of  << this -> ElevationPattern ) ; return this -> ElevationPattern ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Ground planimetric reference system
##  virtual int GetElevationReferenceDEMLevelElevationPatternElevationPatternGroundSystemGroundSystem ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GroundSystem  of  << this -> GroundSystem ) ; return this -> GroundSystem ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Zone in ground planimetric reference system
##  virtual int GetElevationReferenceDEMLevelElevationPatternElevationPatternGroundSystemGroundSystemGroundZoneGroundZone ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GroundZone  of  << this -> GroundZone ) ; return this -> GroundZone ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Map Projection parameters. All are zero.
##  virtual float * GetProjectionParametersProjectionParameters ( ) VTK_SIZEHINT ( 15 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionParameters  pointer  << this -> ProjectionParameters ) ; return this -> ProjectionParameters ; } VTK_WRAPEXCLUDE virtual void GetProjectionParametersProjectionParameters ( float data [ 15 ] ) { for ( int i = 0 ; i < 15 ; i ++ ) { data [ i ] = this -> ProjectionParameters [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Defining unit of measure for ground planimetric coordinates throughout
##  the file. 0 = radians, 1 = feet, 2 = meters, 3 = arc-seconds.
##  virtual int GetElevationReferenceDEMLevelElevationPatternElevationPatternGroundSystemGroundSystemGroundZoneGroundZonePlaneUnitOfMeasurePlaneUnitOfMeasure ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlaneUnitOfMeasure  of  << this -> PlaneUnitOfMeasure ) ; return this -> PlaneUnitOfMeasure ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Defining unit of measure for elevation coordinates throughout
##  the file. 1 = feet, 2 = meters
##  virtual int GetElevationReferenceDEMLevelElevationPatternElevationPatternGroundSystemGroundSystemGroundZoneGroundZonePlaneUnitOfMeasurePlaneUnitOfMeasureElevationUnitOfMeasureElevationUnitOfMeasure ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ElevationUnitOfMeasure  of  << this -> ElevationUnitOfMeasure ) ; return this -> ElevationUnitOfMeasure ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Number of sides in the polygon which defines the coverage of
##  the DEM file. Set to 4.
##  virtual int GetElevationReferenceDEMLevelElevationPatternElevationPatternGroundSystemGroundSystemGroundZoneGroundZonePlaneUnitOfMeasurePlaneUnitOfMeasureElevationUnitOfMeasureElevationUnitOfMeasurePolygonSizePolygonSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolygonSize  of  << this -> PolygonSize ) ; return this -> PolygonSize ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Minimum and maximum elevation for the DEM. The units in the file
##  are in ElevationUnitOfMeasure. This class converts them to meters.
##  virtual float * GetProjectionParametersProjectionParametersElevationBoundsElevationBounds ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ElevationBounds  pointer  << this -> ElevationBounds ) ; return this -> ElevationBounds ; } VTK_WRAPEXCLUDE virtual void GetProjectionParametersProjectionParametersElevationBoundsElevationBounds ( float data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ElevationBounds [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Counterclockwise angle (in radians) from the primary axis of the planimetric
##  reference to the primary axis of the DEM local reference system.
##  IGNORED BY THIS IMPLEMENTATION.
##  virtual float GetElevationReferenceDEMLevelElevationPatternElevationPatternGroundSystemGroundSystemGroundZoneGroundZonePlaneUnitOfMeasurePlaneUnitOfMeasureElevationUnitOfMeasureElevationUnitOfMeasurePolygonSizePolygonSizeLocalRotationLocalRotation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LocalRotation  of  << this -> LocalRotation ) ; return this -> LocalRotation ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Accuracy code for elevations. 0=unknown accuracy
##  virtual int GetElevationReferenceDEMLevelElevationPatternElevationPatternGroundSystemGroundSystemGroundZoneGroundZonePlaneUnitOfMeasurePlaneUnitOfMeasureElevationUnitOfMeasureElevationUnitOfMeasurePolygonSizePolygonSizeLocalRotationLocalRotationAccuracyCodeAccuracyCode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AccuracyCode  of  << this -> AccuracyCode ) ; return this -> AccuracyCode ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  DEM spatial resolution for x,y,z. Values are expressed in units of resolution.
##  Since elevations are read as integers, this permits fractional elevations.
##  virtual float * GetProjectionParametersProjectionParametersElevationBoundsElevationBoundsSpatialResolutionSpatialResolution ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SpatialResolution  pointer  << this -> SpatialResolution ) ; return this -> SpatialResolution ; } VTK_WRAPEXCLUDE virtual void GetProjectionParametersProjectionParametersElevationBoundsElevationBoundsSpatialResolutionSpatialResolution ( float data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SpatialResolution [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  The number of rows and columns in the DEM.
##  virtual int * GetProjectionParametersProjectionParametersElevationBoundsElevationBoundsSpatialResolutionSpatialResolutionProfileDimensionProfileDimension ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ProfileDimension  pointer  << this -> ProfileDimension ) ; return this -> ProfileDimension ; } VTK_WRAPEXCLUDE virtual void GetProjectionParametersProjectionParametersElevationBoundsElevationBoundsSpatialResolutionSpatialResolutionProfileDimensionProfileDimension ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ProfileDimension [ i ] ; } } ;
## Error: expected ';'!!!

proc RequestInformation*(this: var vtkDEMReader; a2: ptr vtkInformation;
                        a3: ptr ptr vtkInformationVector;
                        a4: ptr vtkInformationVector): cint {.
    importcpp: "RequestInformation", header: "vtkDEMReader.h".}