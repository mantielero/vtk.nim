## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResliceCursorPolyDataAlgorithm.h
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
##  @class   vtkResliceCursorPolyDataAlgorithm
##  @brief   generates a 2D reslice cursor polydata
##
##  vtkResliceCursorPolyDataAlgorithm is a class that generates a 2D
##  reslice cursor vtkPolyData, suitable for rendering within a
##  vtkResliceCursorActor. The class takes as input the reslice plane
##  normal index (an index into the normal plane maintained by the reslice
##  cursor object) and generates the polydata represeting the other two
##  reslice axes suitable for rendering on a slice through this plane.
##  The cursor consists of two intersection axes lines that meet at the
##  cursor focus. These lines may have a user defined thickness. They
##  need not be orthogonal to each other.
##  @sa
##  vtkResliceCursorActor vtkResliceCursor vtkResliceCursorWidget
##

## !!!Ignored construct:  # vtkResliceCursorPolyDataAlgorithm_h [NewLine] # vtkResliceCursorPolyDataAlgorithm_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkCutter ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkResliceCursor"
discard "forward decl of vtkPlane"
discard "forward decl of vtkBox"
discard "forward decl of vtkClipPolyData"
discard "forward decl of vtkLinearExtrusionFilter"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkResliceCursorPolyDataAlgorithm : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkResliceCursorPolyDataAlgorithm :: IsTypeOf ( type ) ; } static vtkResliceCursorPolyDataAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkResliceCursorPolyDataAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkResliceCursorPolyDataAlgorithm * NewInstance ( ) const { return vtkResliceCursorPolyDataAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResliceCursorPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResliceCursorPolyDataAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkResliceCursorPolyDataAlgorithm * New ( ) ; /@{ *
##  Which of the 3 axes defines the reslice plane normal ?
##  virtual void SetReslicePlaneNormal ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReslicePlaneNormal  to  << _arg ) ; if ( this -> ReslicePlaneNormal != _arg ) { this -> ReslicePlaneNormal = _arg ; this -> Modified ( ) ; } } ; virtual int GetReslicePlaneNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReslicePlaneNormal  of  << this -> ReslicePlaneNormal ) ; return this -> ReslicePlaneNormal ; } ; /@} enum { XAxis = 0 , YAxis , ZAxis } ; *
##  Set the planes that correspond to the reslice axes.
##  void SetReslicePlaneNormalToXAxis ( ) { this -> SetReslicePlaneNormal ( XAxis ) ; } void SetReslicePlaneNormalToYAxis ( ) { this -> SetReslicePlaneNormal ( YAxis ) ; } void SetReslicePlaneNormalToZAxis ( ) { this -> SetReslicePlaneNormal ( ZAxis ) ; } /@{ *
##  Set the Reslice cursor from which to generate the polydata representation
##  virtual void SetResliceCursor ( vtkResliceCursor * ) ; virtual vtkResliceCursor * GetnameResliceCursor ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ResliceCursor  address  << static_cast < vtkResliceCursor * > ( this -> ResliceCursor ) ) ; return this -> ResliceCursor ; } ; /@} /@{ *
##  Set/Get the slice bounds, ie the slice of this view on which to display
##  the reslice cursor.
##  virtual void SetSliceBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << SliceBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> SliceBounds [ 0 ] != _arg1 ) || ( this -> SliceBounds [ 1 ] != _arg2 ) || ( this -> SliceBounds [ 2 ] != _arg3 ) || ( this -> SliceBounds [ 3 ] != _arg4 ) || ( this -> SliceBounds [ 4 ] != _arg5 ) || ( this -> SliceBounds [ 5 ] != _arg6 ) ) { this -> SliceBounds [ 0 ] = _arg1 ; this -> SliceBounds [ 1 ] = _arg2 ; this -> SliceBounds [ 2 ] = _arg3 ; this -> SliceBounds [ 3 ] = _arg4 ; this -> SliceBounds [ 4 ] = _arg5 ; this -> SliceBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetSliceBounds ( const double _arg [ 6 ] ) { this -> SetSliceBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetSliceBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SliceBounds  pointer  << this -> SliceBounds ) ; return this -> SliceBounds ; } VTK_WRAPEXCLUDE virtual void GetSliceBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> SliceBounds [ 0 ] ; _arg2 = this -> SliceBounds [ 1 ] ; _arg3 = this -> SliceBounds [ 2 ] ; _arg4 = this -> SliceBounds [ 3 ] ; _arg5 = this -> SliceBounds [ 4 ] ; _arg6 = this -> SliceBounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SliceBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSliceBounds ( double _arg [ 6 ] ) { this -> GetSliceBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Get either one of the axes that this object produces. Depending on
##  the mode, one renders either the centerline axes or both the
##  centerline axes and the slab
##  virtual vtkPolyData * GetCenterlineAxis1 ( ) ; virtual vtkPolyData * GetCenterlineAxis2 ( ) ; virtual vtkPolyData * GetThickSlabAxis1 ( ) ; virtual vtkPolyData * GetThickSlabAxis2 ( ) ; /@} /@{ *
##  Get the index of the axes and the planes that they represent
##  virtual int GetAxis1 ( ) ; virtual int GetAxis2 ( ) ; virtual int GetPlaneAxis1 ( ) ; virtual int GetPlaneAxis2 ( ) ; /@} *
##  Convenience method that, given one plane, returns the other plane
##  that this class represents.
##  int GetOtherPlaneForAxis ( int p ) ; *
##  Get the MTime. Check the MTime of the internal ResliceCursor as well, if
##  one has been set
##  vtkMTimeType GetMTime ( ) override ; protected : vtkResliceCursorPolyDataAlgorithm ( ) ; ~ vtkResliceCursorPolyDataAlgorithm ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void GetSlabPolyData ( int axis , int planeAxis , vtkPolyData * pd ) ; virtual void CutAndClip ( vtkPolyData * in , vtkPolyData * out ) ;  Build the reslice slab axis void BuildResliceSlabAxisTopology ( ) ; int ReslicePlaneNormal ; vtkResliceCursor * ResliceCursor ; vtkCutter * Cutter ; vtkPlane * SlicePlane ; vtkBox * Box ; vtkClipPolyData * ClipWithBox ; double SliceBounds [ 6 ] ; bool Extrude ; vtkLinearExtrusionFilter * ExtrusionFilter1 ; vtkLinearExtrusionFilter * ExtrusionFilter2 ; vtkPolyData * ThickAxes [ 2 ] ; private : vtkResliceCursorPolyDataAlgorithm ( const vtkResliceCursorPolyDataAlgorithm & ) = delete ; void operator = ( const vtkResliceCursorPolyDataAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
