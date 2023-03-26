## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextureMapToSphere.h
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
##  @class   vtkTextureMapToSphere
##  @brief   generate texture coordinates by mapping points to sphere
##
##  vtkTextureMapToSphere is a filter that generates 2D texture coordinates by
##  mapping input dataset points onto a sphere. The sphere can either be user
##  specified or generated automatically. (The sphere is generated
##  automatically by computing the center (i.e., averaged coordinates) of the
##  sphere.)  Note that the generated texture coordinates range between
##  (0,1). The s-coordinate lies in the angular direction around the z-axis,
##  measured counter-clockwise from the x-axis. The t-coordinate lies in the
##  angular direction measured down from the north pole towards the south
##  pole.
##
##  A special ivar controls how the s-coordinate is generated. If PreventSeam
##  is set to true, the s-texture varies from 0->1 and then 1->0 (corresponding
##  to angles of 0->180 and 180->360).
##
##  @warning
##  The resulting texture coordinates will lie between (0,1), and the texture
##  coordinates are determined with respect to the modeler's x-y-z coordinate
##  system. Use the class vtkTransformTextureCoords to linearly scale and
##  shift the origin of the texture coordinates (if necessary).
##
##  @sa
##  vtkTextureMapToPlane vtkTextureMapToCylinder
##  vtkTransformTexture vtkThresholdTextureCoords
##

## !!!Ignored construct:  # vtkTextureMapToSphere_h [NewLine] # vtkTextureMapToSphere_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersTextureModule.h  For export macro [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSTEXTURE_EXPORT vtkTextureMapToSphere : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTextureMapToSphere :: IsTypeOf ( type ) ; } static vtkTextureMapToSphere * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTextureMapToSphere * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTextureMapToSphere * NewInstance ( ) const { return vtkTextureMapToSphere :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextureMapToSphere :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextureMapToSphere :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Create object with Center (0,0,0) and the PreventSeam ivar is set to
##  true. The sphere center is automatically computed.
##  static vtkTextureMapToSphere * New ( ) ; /@{ *
##  Specify a point defining the center of the sphere.
##  virtual void SetCenter ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Center  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Center [ 0 ] != _arg1 ) || ( this -> Center [ 1 ] != _arg2 ) || ( this -> Center [ 2 ] != _arg3 ) ) { this -> Center [ 0 ] = _arg1 ; this -> Center [ 1 ] = _arg2 ; this -> Center [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetCenter ( const double _arg [ 3 ] ) { this -> SetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ; /@} /@{ *
##  Turn on/off automatic sphere generation. This means it automatically
##  finds the sphere center.
##  virtual void SetAutomaticSphereGeneration ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutomaticSphereGeneration  to  << _arg ) ; if ( this -> AutomaticSphereGeneration != _arg ) { this -> AutomaticSphereGeneration = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetAutomaticSphereGeneration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticSphereGeneration  of  << this -> AutomaticSphereGeneration ) ; return this -> AutomaticSphereGeneration ; } ; virtual void AutomaticSphereGenerationOn ( ) { this -> SetAutomaticSphereGeneration ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AutomaticSphereGenerationOff ( ) { this -> SetAutomaticSphereGeneration ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control how the texture coordinates are generated. If PreventSeam is
##  set, the s-coordinate ranges from 0->1 and 1->0 corresponding to the
##  theta angle variation between 0->180 and 180->0 degrees. Otherwise, the
##  s-coordinate ranges from 0->1 between 0->360 degrees.
##  virtual void SetAutomaticSphereGenerationPreventSeam ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PreventSeam  to  << _arg ) ; if ( this -> PreventSeam != _arg ) { this -> PreventSeam = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetAutomaticSphereGenerationPreventSeam ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreventSeam  of  << this -> PreventSeam ) ; return this -> PreventSeam ; } ; virtual void PreventSeamOn ( ) { this -> SetAutomaticSphereGenerationPreventSeam ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PreventSeamOff ( ) { this -> SetAutomaticSphereGenerationPreventSeam ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@}
##  Computes the center point of the data set if AutomaticSphereGeneration is set to true.
##  virtual void ComputeCenter ( vtkDataSet * input ) ; protected : vtkTextureMapToSphere ( ) ; ~ vtkTextureMapToSphere ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double Center [ 3 ] ; vtkTypeBool AutomaticSphereGeneration ; vtkTypeBool PreventSeam ; private : vtkTextureMapToSphere ( const vtkTextureMapToSphere & ) = delete ; void operator = ( const vtkTextureMapToSphere & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
