## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridAxisClip.h
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
##  @class   vtkHyperTreeGridAxisClip
##  @brief   Axis aligned hyper tree grid clip
##
##
##  Clip an hyper tree grid along an axis aligned plane or box and output
##  a hyper tree grid with same dimensionality.
##  This filter also allows for reversal of the direction of what is inside
##  versus what is outside by setting the InsideOut instance variable.
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm
##
##  @par Thanks:
##  This class was written by Philippe Pebay on a idea of Guenole Harel and Jacques-Bernard Lekien,
##  2016 This class was modified by Jacques-Bernard Lekien, 2018 This work was supported by
##  Commissariat a l'Energie Atomique CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkHyperTreeGridAxisClip_h [NewLine] # vtkHyperTreeGridAxisClip_h [NewLine] # vtkFiltersHyperTreeModule.h  For export macro # vtkHyperTreeGridAlgorithm.h [NewLine] class vtkBitArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkQuadric"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
discard "forward decl of vtkHyperTreeGridNonOrientedGeometryCursor"
## !!!Ignored construct:  class VTKFILTERSHYPERTREE_EXPORT vtkHyperTreeGridAxisClip : public vtkHyperTreeGridAlgorithm { public : static vtkHyperTreeGridAxisClip * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridAxisClip :: IsTypeOf ( type ) ; } static vtkHyperTreeGridAxisClip * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridAxisClip * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridAxisClip * NewInstance ( ) const { return vtkHyperTreeGridAxisClip :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridAxisClip :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridAxisClip :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Methods by which the hyper tree grid input may be clipped:
##  PLANE: Clip with an axis-aligned plane defined by normal and intercept.
##  BOX: Clip with an axis-aligned rectangular prism defined by its extremal coordinates.
##  QUADRIC: Clip with an axis-aligned quadric defined by its coefficients.
##  enum ClipType { PLANE = 0 , BOX , QUADRIC , } ; /@{ *
##  Set/get type of clip.
##  Default value is 0 (plane clip).
##  virtual void SetClipType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ClipType  to  << _arg ) ; if ( this -> ClipType != ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> ClipType = ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetClipTypeMinValue ( ) { return 0 ; } virtual int GetClipTypeMaxValue ( ) { return 2 ; } ; virtual int GetClipType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClipType  of  << this -> ClipType ) ; return this -> ClipType ; } ; void SetClipTypeToPlane ( ) { this -> SetClipType ( vtkHyperTreeGridAxisClip :: PLANE ) ; } void SetClipTypeToBox ( ) { this -> SetClipType ( vtkHyperTreeGridAxisClip :: BOX ) ; } void SetClipTypeToQuadric ( ) { this -> SetClipType ( vtkHyperTreeGridAxisClip :: QUADRIC ) ; } /@} /@{ *
##  Set/get normal axis of clipping plane: 0=X, 1=Y, 2=Z.
##  Default value is 0 (X-axis normal).
##  virtual void SetClipTypePlaneNormalAxis ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PlaneNormalAxis  to  << _arg ) ; if ( this -> PlaneNormalAxis != ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> PlaneNormalAxis = ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetClipTypeMinValuePlaneNormalAxisMinValue ( ) { return 0 ; } virtual int GetClipTypeMaxValuePlaneNormalAxisMaxValue ( ) { return 2 ; } ; virtual int GetClipTypePlaneNormalAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlaneNormalAxis  of  << this -> PlaneNormalAxis ) ; return this -> PlaneNormalAxis ; } ; /@} /@{ *
##  Set/get position of clipping plane: intercept along normal axis.
##  Default value is 0.0.
##  virtual void SetPlanePosition ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PlanePosition  to  << _arg ) ; if ( this -> PlanePosition != _arg ) { this -> PlanePosition = _arg ; this -> Modified ( ) ; } } ; virtual double GetClipTypePlaneNormalAxisPlanePosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlanePosition  of  << this -> PlanePosition ) ; return this -> PlanePosition ; } ; /@} /@{ *
##  Set/get bounds of clipping box.
##  virtual void SetBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Bounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> Bounds [ 0 ] != _arg1 ) || ( this -> Bounds [ 1 ] != _arg2 ) || ( this -> Bounds [ 2 ] != _arg3 ) || ( this -> Bounds [ 3 ] != _arg4 ) || ( this -> Bounds [ 4 ] != _arg5 ) || ( this -> Bounds [ 5 ] != _arg6 ) ) { this -> Bounds [ 0 ] = _arg1 ; this -> Bounds [ 1 ] = _arg2 ; this -> Bounds [ 2 ] = _arg3 ; this -> Bounds [ 3 ] = _arg4 ; this -> Bounds [ 4 ] = _arg5 ; this -> Bounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetBounds ( const double _arg [ 6 ] ) { this -> SetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> Bounds [ i ] ; } } ; void GetMinimumBounds ( double [ 3 ] ) ; void GetMaximumBounds ( double [ 3 ] ) ; /@} /@{ *
##  Set/Get the InsideOut flag, in the case of clip by hyperplane.
##  When off, a cell is clipped out when its origin is above said plane
##  intercept along the considered direction, inside otherwise.
##  When on, a cell is clipped out when its origin + size is below said
##  said plane intercept along the considered direction.
##  virtual void SetPlanePositionInsideOut ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InsideOut  to  << _arg ) ; if ( this -> InsideOut != _arg ) { this -> InsideOut = _arg ; this -> Modified ( ) ; } } ; virtual bool GetClipTypePlaneNormalAxisPlanePositionInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ; virtual void InsideOutOn ( ) { this -> SetInsideOut ( static_cast < bool > ( 1 ) ) ; } virtual void InsideOutOff ( ) { this -> SetInsideOut ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the clipping quadric function.
##  virtual void SetQuadric ( vtkQuadric * ) ; virtual vtkQuadric * GetnameQuadric ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Quadric  address  << static_cast < vtkQuadric * > ( this -> Quadric ) ) ; return this -> Quadric ; } ; /@} /@{ *
##  Helpers to set/get the 10 coefficients of the quadric function
##  void SetQuadricCoefficients ( double a , double b , double c , double d , double e , double f , double g , double h , double i , double j ) { double array [ 10 ] = { a , b , c , d , e , f , g , h , i , j } ; this -> SetQuadricCoefficients ( array ) ; } void SetQuadricCoefficients ( double [ 10 ] ) ; void GetQuadricCoefficients ( double [ 10 ] ) ; double * GetQuadricCoefficients ( ) ; /@} *
##  Override GetMTime because we delegate to a vtkQuadric.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkHyperTreeGridAxisClip ( ) ; ~ vtkHyperTreeGridAxisClip ( ) override ;  For this algorithm the output is a vtkHyperTreeGrid instance int FillOutputPortInformation ( int , vtkInformation * ) override ; *
##  Decide whether the cell is clipped out
##  bool IsClipped ( vtkHyperTreeGridNonOrientedGeometryCursor * ) ; *
##  Main routine to generate hyper tree grid clip
##  int ProcessTrees ( vtkHyperTreeGrid * , vtkDataObject * ) override ; *
##  Recursively descend into tree down to leaves
##  void RecursivelyProcessTree ( vtkHyperTreeGridNonOrientedGeometryCursor * inCursor , vtkHyperTreeGridNonOrientedCursor * outCursor ) ; *
##  Type of clip to be performed
##  int ClipType ; *
##  Direction of clipping plane normal
##  int PlaneNormalAxis ; *
##  Intercept of clipping plane along normal
##  double PlanePosition ; double PlanePositionRealUse ; *
##  Bounds of axis-aligned clipping box
##  double Bounds [ 6 ] ; *
##  Coefficients of axis-aligned quadric
##  vtkQuadric * Quadric ; *
##  Decide what is inside versus what is out
##  bool InsideOut ; *
##  Output material mask constructed by this filter
##  vtkBitArray * InMask ; vtkBitArray * OutMask ; *
##  Keep track of current index in output hyper tree grid
##  vtkIdType CurrentId ; private : vtkHyperTreeGridAxisClip ( const vtkHyperTreeGridAxisClip & ) = delete ; void operator = ( const vtkHyperTreeGridAxisClip & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
