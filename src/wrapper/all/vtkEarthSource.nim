## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEarthSource.h
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
##  @class   vtkEarthSource
##  @brief   create the continents of the Earth as a sphere
##
##  vtkEarthSource creates a spherical rendering of the geographical shapes
##  of the major continents of the earth. The OnRatio determines
##  how much of the data is actually used. The radius defines the radius
##  of the sphere at which the continents are placed. Obtains data from
##  an embedded array of coordinates.
##

## !!!Ignored construct:  # vtkEarthSource_h [NewLine] # vtkEarthSource_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSHYBRID_EXPORT vtkEarthSource : public vtkPolyDataAlgorithm { public : static vtkEarthSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEarthSource :: IsTypeOf ( type ) ; } static vtkEarthSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEarthSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEarthSource * NewInstance ( ) const { return vtkEarthSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEarthSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEarthSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set radius of earth.
##  virtual void SetRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValue ( ) { return 0.0 ; } virtual double GetRadiusMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Turn on every nth entity. This controls how much detail the model
##  will have. The maximum ratio is sixteen. (The smaller OnRatio, the more
##  detail there is.)
##  virtual void SetRadiusOnRatio ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OnRatio  to  << _arg ) ; if ( this -> OnRatio != ( _arg < 1 ? 1 : ( _arg > 16 ? 16 : _arg ) ) ) { this -> OnRatio = ( _arg < 1 ? 1 : ( _arg > 16 ? 16 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueOnRatioMinValue ( ) { return 1 ; } virtual int GetRadiusMaxValueOnRatioMaxValue ( ) { return 16 ; } ; virtual int GetRadiusOnRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OnRatio  of  << this -> OnRatio ) ; return this -> OnRatio ; } ; /@} /@{ *
##  Turn on/off drawing continents as filled polygons or as wireframe outlines.
##  Warning: some graphics systems will have trouble with the very large, concave
##  filled polygons. Recommend you use OutlienOn (i.e., disable filled polygons)
##  for now.
##  virtual void SetOutline ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Outline  to  << _arg ) ; if ( this -> Outline != _arg ) { this -> Outline = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRadiusOnRatioOutline ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Outline  of  << this -> Outline ) ; return this -> Outline ; } ; virtual void OutlineOn ( ) { this -> SetOutline ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OutlineOff ( ) { this -> SetOutline ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkEarthSource ( ) ; ~ vtkEarthSource ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double Radius ; int OnRatio ; vtkTypeBool Outline ; private : vtkEarthSource ( const vtkEarthSource & ) = delete ; void operator = ( const vtkEarthSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
