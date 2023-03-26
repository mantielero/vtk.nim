## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataSilhouette.h
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
##  @class   vtkPolyDataSilhouette
##  @brief   sort polydata along camera view direction
##
##
##  vtkPolyDataSilhouette extracts a subset of a polygonal mesh edges to
##  generate an outline (silhouette) of the corresponding 3D object. In
##  addition, this filter can also extracts sharp edges (aka feature angles).
##  In order to use this filter you must specify the a point of view (origin) or
##  a direction (vector).  given this direction or origin, a silhouette is
##  generated wherever the surface's normal is orthogonal to the view direction.
##
##  @warning
##  when the active camera is used, almost everything is recomputed for each
##  frame, keep this in mind when dealing with extremely large surface data
##  sets.
##
##  @par Thanks:
##  Contribution by Thierry Carrard <br>
##  CEA/DIF - Commissariat a l'Energie Atomique, Centre DAM Ile-De-France <br>
##  BP12, F-91297 Arpajon, France. <br>
##

## !!!Ignored construct:  # vtkPolyDataSilhouette_h [NewLine] # vtkPolyDataSilhouette_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkCamera ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkProp3D"
discard "forward decl of vtkTransform"
discard "forward decl of vtkPolyDataEdges"
## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkPolyDataSilhouette : public vtkPolyDataAlgorithm { public : *
##  Instantiate object.
##  static vtkPolyDataSilhouette * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPolyDataSilhouette :: IsTypeOf ( type ) ; } static vtkPolyDataSilhouette * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPolyDataSilhouette * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPolyDataSilhouette * NewInstance ( ) const { return vtkPolyDataSilhouette :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataSilhouette :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataSilhouette :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Enables or Disables generation of silhouette edges along sharp edges
##  virtual void SetEnableFeatureAngle ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EnableFeatureAngle  to  << _arg ) ; if ( this -> EnableFeatureAngle != _arg ) { this -> EnableFeatureAngle = _arg ; this -> Modified ( ) ; } } ; virtual int GetEnableFeatureAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableFeatureAngle  of  << this -> EnableFeatureAngle ) ; return this -> EnableFeatureAngle ; } ; /@} /@{ *
##  Sets/Gets minimal angle for sharp edges detection. Default is 60
##  virtual void SetEnableFeatureAngleFeatureAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FeatureAngle  to  << _arg ) ; if ( this -> FeatureAngle != _arg ) { this -> FeatureAngle = _arg ; this -> Modified ( ) ; } } ; virtual double GetEnableFeatureAngleFeatureAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FeatureAngle  of  << this -> FeatureAngle ) ; return this -> FeatureAngle ; } ; /@} /@{ *
##  Enables or Disables generation of border edges. Note: borders exist only
##  in case of non closed surface
##  virtual void SetEnableFeatureAngleFeatureAngleBorderEdges ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BorderEdges  to  << _arg ) ; if ( this -> BorderEdges != _arg ) { this -> BorderEdges = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetEnableFeatureAngleFeatureAngleBorderEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BorderEdges  of  << this -> BorderEdges ) ; return this -> BorderEdges ; } ; virtual void BorderEdgesOn ( ) { this -> SetBorderEdges ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void BorderEdgesOff ( ) { this -> SetBorderEdges ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enables or Disables piece invariance. This is useful when dealing with
##  multi-block data sets. Note: requires one level of ghost cells
##  virtual void SetEnableFeatureAngleFeatureAngleBorderEdgesPieceInvariant ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PieceInvariant  to  << _arg ) ; if ( this -> PieceInvariant != _arg ) { this -> PieceInvariant = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetEnableFeatureAngleFeatureAngleBorderEdgesPieceInvariant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceInvariant  of  << this -> PieceInvariant ) ; return this -> PieceInvariant ; } ; virtual void PieceInvariantOn ( ) { this -> SetBorderEdgesPieceInvariant ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PieceInvariantOff ( ) { this -> SetBorderEdgesPieceInvariant ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} enum Directions { VTK_DIRECTION_SPECIFIED_VECTOR = 0 , VTK_DIRECTION_SPECIFIED_ORIGIN = 1 , VTK_DIRECTION_CAMERA_ORIGIN = 2 , VTK_DIRECTION_CAMERA_VECTOR = 3 } ; /@{ *
##  Specify how view direction is computed. By default, the
##  camera origin (eye) is used.
##  virtual void SetEnableFeatureAngleFeatureAngleBorderEdgesPieceInvariantDirection ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Direction  to  << _arg ) ; if ( this -> Direction != _arg ) { this -> Direction = _arg ; this -> Modified ( ) ; } } ; virtual int GetEnableFeatureAngleFeatureAngleBorderEdgesPieceInvariantDirection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Direction  of  << this -> Direction ) ; return this -> Direction ; } ; void SetDirectionToSpecifiedVector ( ) { this -> SetDirection ( VTK_DIRECTION_SPECIFIED_VECTOR ) ; } void SetDirectionToSpecifiedOrigin ( ) { this -> SetDirection ( VTK_DIRECTION_SPECIFIED_ORIGIN ) ; } void SetDirectionToCameraVector ( ) { this -> SetDirection ( VTK_DIRECTION_CAMERA_VECTOR ) ; } void SetDirectionToCameraOrigin ( ) { this -> SetDirection ( VTK_DIRECTION_CAMERA_ORIGIN ) ; } /@} /@{ *
##  Specify a camera that is used to define the view direction.  This ivar
##  only has effect if the direction is set to VTK_DIRECTION_CAMERA_ORIGIN or
##  VTK_DIRECTION_CAMERA_VECTOR, and a camera is specified.
##  virtual void SetCamera ( vtkCamera VTK_WRAP_EXTERN * ) ; virtual vtkCamera VTK_WRAP_EXTERN * GetnameCamera ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Camera  address  << static_cast < vtkCamera VTK_WRAP_EXTERN * > ( this -> Camera ) ) ; return this -> Camera ; } ; /@} /@{ *
##  Specify a transformation matrix (via the vtkProp3D::GetMatrix() method)
##  that is used to include the effects of transformation. This ivar only has
##  effect if the direction is set to VTK_DIRECTION_CAMERA_ORIGIN or
##  VTK_DIRECTION_CAMERA_VECTOR, and a camera is specified. Specifying the
##  vtkProp3D is optional.
##  void SetProp3D ( vtkProp3D VTK_WRAP_EXTERN * ) ; vtkProp3D VTK_WRAP_EXTERN * GetProp3D ( ) ; /@} /@{ *
##  Set/Get the sort direction. This ivar only has effect if the sort
##  direction is set to SetDirectionToSpecifiedVector(). The edge detection
##  occurs in the direction of the vector.
##  virtual void SetVector ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Vector  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Vector [ 0 ] != _arg1 ) || ( this -> Vector [ 1 ] != _arg2 ) || ( this -> Vector [ 2 ] != _arg3 ) ) { this -> Vector [ 0 ] = _arg1 ; this -> Vector [ 1 ] = _arg2 ; this -> Vector [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetVector ( const double _arg [ 3 ] ) { this -> SetVector ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetVector ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Vector  pointer  << this -> Vector ) ; return this -> Vector ; } VTK_WRAPEXCLUDE virtual void GetVector ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Vector [ i ] ; } } ; /@} /@{ *
##  Set/Get the sort origin. This ivar only has effect if the sort direction
##  is set to SetDirectionToSpecifiedOrigin(). The edge detection occurs in
##  the direction of the origin to each edge's center.
##  virtual void SetVectorOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Origin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Origin [ 0 ] != _arg1 ) || ( this -> Origin [ 1 ] != _arg2 ) || ( this -> Origin [ 2 ] != _arg3 ) ) { this -> Origin [ 0 ] = _arg1 ; this -> Origin [ 1 ] = _arg2 ; this -> Origin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetVectorOrigin ( const double _arg [ 3 ] ) { this -> SetVectorOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetVectorOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetVectorOrigin ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Origin [ i ] ; } } ; /@} *
##  Return MTime also considering the dependent objects: the camera
##  and/or the prop3D.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkPolyDataSilhouette ( ) ; ~ vtkPolyDataSilhouette ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ComputeProjectionVector ( double vector [ 3 ] , double origin [ 3 ] ) ; int Direction ; vtkCamera * Camera ; vtkProp3D * Prop3D ; vtkTransform * Transform ; double Vector [ 3 ] ; double Origin [ 3 ] ; int EnableFeatureAngle ; double FeatureAngle ; vtkTypeBool BorderEdges ; vtkTypeBool PieceInvariant ; vtkPolyDataEdges * PreComp ;  precomputed data for a given point of view private : vtkPolyDataSilhouette ( const vtkPolyDataSilhouette & ) = delete ; void operator = ( const vtkPolyDataSilhouette & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
