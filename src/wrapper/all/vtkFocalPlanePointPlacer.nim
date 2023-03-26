## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFocalPlanePointPlacer.h
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
##  .SECTION Description
##
##
##  .SECTION See Also

## !!!Ignored construct:  # vtkFocalPlanePointPlacer_h [NewLine] # vtkFocalPlanePointPlacer_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkPointPlacer.h [NewLine] class vtkRenderer ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkFocalPlanePointPlacer : public vtkPointPlacer { public : *
##  Instantiate this class.
##  static vtkFocalPlanePointPlacer * New ( ) ; /@{ *
##  Standard methods for instances of this class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointPlacer Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointPlacer :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFocalPlanePointPlacer :: IsTypeOf ( type ) ; } static vtkFocalPlanePointPlacer * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFocalPlanePointPlacer * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFocalPlanePointPlacer * NewInstance ( ) const { return vtkFocalPlanePointPlacer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFocalPlanePointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFocalPlanePointPlacer :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@}  Description:
##  Given a renderer and a display position, compute
##  the world position and orientation. The orientation
##  computed by the placer will always line up with the
##  standard coordinate axes. The world position will be
##  computed by projecting the display position onto the
##  focal plane. This method is typically used to place a
##  point for the first time. int ComputeWorldPosition ( vtkRenderer * ren , double displayPos [ 2 ] , double worldPos [ 3 ] , double worldOrient [ 9 ] ) override ; *
##  Given a renderer, a display position, and a reference
##  world position, compute a new world position. The
##  orientation will be the standard coordinate axes, and the
##  computed world position will be created by projecting
##  the display point onto a plane that is parallel to
##  the focal plane and runs through the reference world
##  position. This method is typically used to move existing
##  points.
##  int ComputeWorldPosition ( vtkRenderer * ren , double displayPos [ 2 ] , double refWorldPos [ 3 ] , double worldPos [ 3 ] , double worldOrient [ 9 ] ) override ; /@{ *
##  Validate a world position. All world positions
##  are valid so these methods always return 1.
##  int ValidateWorldPosition ( double worldPos [ 3 ] ) override ; int ValidateWorldPosition ( double worldPos [ 3 ] , double worldOrient [ 9 ] ) override ; /@} /@{ *
##  Optionally specify a signed offset from the focal plane for the points to
##  be placed at.  If negative, the constraint plane is offset closer to the
##  camera. If positive, its further away from the camera.
##  virtual void SetOffset ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Offset  to  << _arg ) ; if ( this -> Offset != _arg ) { this -> Offset = _arg ; this -> Modified ( ) ; } } ; virtual double GetOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Offset  of  << this -> Offset ) ; return this -> Offset ; } ; /@} /@{ *
##  Optionally Restrict the points to a set of bounds. The placer will
##  invalidate points outside these bounds.
##  virtual void SetPointBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << PointBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> PointBounds [ 0 ] != _arg1 ) || ( this -> PointBounds [ 1 ] != _arg2 ) || ( this -> PointBounds [ 2 ] != _arg3 ) || ( this -> PointBounds [ 3 ] != _arg4 ) || ( this -> PointBounds [ 4 ] != _arg5 ) || ( this -> PointBounds [ 5 ] != _arg6 ) ) { this -> PointBounds [ 0 ] = _arg1 ; this -> PointBounds [ 1 ] = _arg2 ; this -> PointBounds [ 2 ] = _arg3 ; this -> PointBounds [ 3 ] = _arg4 ; this -> PointBounds [ 4 ] = _arg5 ; this -> PointBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetPointBounds ( const double _arg [ 6 ] ) { this -> SetPointBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetPointBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PointBounds  pointer  << this -> PointBounds ) ; return this -> PointBounds ; } VTK_WRAPEXCLUDE virtual void GetPointBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> PointBounds [ 0 ] ; _arg2 = this -> PointBounds [ 1 ] ; _arg3 = this -> PointBounds [ 2 ] ; _arg4 = this -> PointBounds [ 3 ] ; _arg5 = this -> PointBounds [ 4 ] ; _arg6 = this -> PointBounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PointBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPointBounds ( double _arg [ 6 ] ) { this -> GetPointBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} protected : vtkFocalPlanePointPlacer ( ) ; ~ vtkFocalPlanePointPlacer ( ) override ; void GetCurrentOrientation ( double worldOrient [ 9 ] ) ; double PointBounds [ 6 ] ; double Offset ; private : vtkFocalPlanePointPlacer ( const vtkFocalPlanePointPlacer & ) = delete ; void operator = ( const vtkFocalPlanePointPlacer & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
