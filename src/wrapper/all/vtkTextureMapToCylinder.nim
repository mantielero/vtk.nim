## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextureMapToCylinder.h
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
##  @class   vtkTextureMapToCylinder
##  @brief   generate texture coordinates by mapping points to cylinder
##
##  vtkTextureMapToCylinder is a filter that generates 2D texture coordinates
##  by mapping input dataset points onto a cylinder. The cylinder can either be
##  user specified or generated automatically. (The cylinder is generated
##  automatically by computing the axis of the cylinder.)  Note that the
##  generated texture coordinates for the s-coordinate ranges from (0-1)
##  (corresponding to angle of 0->360 around axis), while the mapping of
##  the t-coordinate is controlled by the projection of points along the axis.
##
##  To specify a cylinder manually, you must provide two points that
##  define the axis of the cylinder. The length of the axis will affect the
##  t-coordinates.
##
##  A special ivar controls how the s-coordinate is generated. If PreventSeam
##  is set to true, the s-texture varies from 0->1 and then 1->0 (corresponding
##  to angles of 0->180 and 180->360).
##
##  @warning
##  Since the resulting texture s-coordinate will lie between (0,1), and the
##  origin of the texture coordinates is not user-controllable, you may want
##  to use the class vtkTransformTexture to linearly scale and shift the origin
##  of the texture coordinates.
##
##  @sa
##  vtkTextureMapToPlane vtkTextureMapToSphere
##  vtkTransformTexture vtkThresholdTextureCoords
##

## !!!Ignored construct:  # vtkTextureMapToCylinder_h [NewLine] # vtkTextureMapToCylinder_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersTextureModule.h  For export macro [NewLine] class VTKFILTERSTEXTURE_EXPORT vtkTextureMapToCylinder : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTextureMapToCylinder :: IsTypeOf ( type ) ; } static vtkTextureMapToCylinder * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTextureMapToCylinder * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTextureMapToCylinder * NewInstance ( ) const { return vtkTextureMapToCylinder :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextureMapToCylinder :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextureMapToCylinder :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Create object with cylinder axis parallel to z-axis (points (0,0,-0.5)
##  and (0,0,0.5)). The PreventSeam ivar is set to true. The cylinder is
##  automatically generated.
##  static vtkTextureMapToCylinder * New ( ) ; /@{ *
##  Specify the first point defining the cylinder axis,
##  virtual void SetPoint1 ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Point1  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Point1 [ 0 ] != _arg1 ) || ( this -> Point1 [ 1 ] != _arg2 ) || ( this -> Point1 [ 2 ] != _arg3 ) ) { this -> Point1 [ 0 ] = _arg1 ; this -> Point1 [ 1 ] = _arg2 ; this -> Point1 [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPoint1 ( const double _arg [ 3 ] ) { this -> SetPoint1 ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPoint1 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point1  pointer  << this -> Point1 ) ; return this -> Point1 ; } VTK_WRAPEXCLUDE virtual void GetPoint1 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point1 [ i ] ; } } ; /@} /@{ *
##  Specify the second point defining the cylinder axis,
##  virtual void SetPoint1Point2 ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Point2  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Point2 [ 0 ] != _arg1 ) || ( this -> Point2 [ 1 ] != _arg2 ) || ( this -> Point2 [ 2 ] != _arg3 ) ) { this -> Point2 [ 0 ] = _arg1 ; this -> Point2 [ 1 ] = _arg2 ; this -> Point2 [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPoint1Point2 ( const double _arg [ 3 ] ) { this -> SetPoint1Point2 ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPoint1Point2 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point2  pointer  << this -> Point2 ) ; return this -> Point2 ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point2 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point2 [ i ] ; } } ; /@} /@{ *
##  Turn on/off automatic cylinder generation. This means it automatically
##  finds the cylinder center and axis.
##  virtual void SetAutomaticCylinderGeneration ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutomaticCylinderGeneration  to  << _arg ) ; if ( this -> AutomaticCylinderGeneration != _arg ) { this -> AutomaticCylinderGeneration = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetAutomaticCylinderGeneration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticCylinderGeneration  of  << this -> AutomaticCylinderGeneration ) ; return this -> AutomaticCylinderGeneration ; } ; virtual void AutomaticCylinderGenerationOn ( ) { this -> SetAutomaticCylinderGeneration ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AutomaticCylinderGenerationOff ( ) { this -> SetAutomaticCylinderGeneration ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control how the texture coordinates are generated. If PreventSeam is
##  set, the s-coordinate ranges from 0->1 and 1->0 corresponding to the
##  angle variation from 0->180 and 180->0. Otherwise, the s-coordinate
##  ranges from 0->1 from 0->360 degrees.
##  virtual void SetAutomaticCylinderGenerationPreventSeam ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PreventSeam  to  << _arg ) ; if ( this -> PreventSeam != _arg ) { this -> PreventSeam = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetAutomaticCylinderGenerationPreventSeam ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreventSeam  of  << this -> PreventSeam ) ; return this -> PreventSeam ; } ; virtual void PreventSeamOn ( ) { this -> SetAutomaticCylinderGenerationPreventSeam ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PreventSeamOff ( ) { this -> SetAutomaticCylinderGenerationPreventSeam ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkTextureMapToCylinder ( ) ; ~ vtkTextureMapToCylinder ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double Point1 [ 3 ] ; double Point2 [ 3 ] ; vtkTypeBool AutomaticCylinderGeneration ; vtkTypeBool PreventSeam ; private : vtkTextureMapToCylinder ( const vtkTextureMapToCylinder & ) = delete ; void operator = ( const vtkTextureMapToCylinder & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
