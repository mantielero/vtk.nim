## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageActorPointPlacer.h
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
##  @class   vtkImageActorPointPlacer
##  @brief   Converts 2D display positions to world positions such that they lie on an ImageActor
##
##  This PointPlacer is used to constrain the placement of points on the
##  supplied image actor. Additionally, you may set bounds to restrict the
##  placement of the points. The placement of points will then be constrained
##  to lie not only on the ImageActor but also within the bounds specified.
##  If no bounds are specified, they may lie anywhere on the supplied ImageActor.
##

## !!!Ignored construct:  # vtkImageActorPointPlacer_h [NewLine] # vtkImageActorPointPlacer_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkPointPlacer.h [NewLine] class vtkBoundedPlanePointPlacer ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImageActor"
discard "forward decl of vtkRenderer"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkImageActorPointPlacer : public vtkPointPlacer { public : *
##  Instantiate this class.
##  static vtkImageActorPointPlacer * New ( ) ; /@{ *
##  Standard methods for instances of this class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointPlacer Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointPlacer :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageActorPointPlacer :: IsTypeOf ( type ) ; } static vtkImageActorPointPlacer * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageActorPointPlacer * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageActorPointPlacer * NewInstance ( ) const { return vtkImageActorPointPlacer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageActorPointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageActorPointPlacer :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Given and renderer and a display position in pixels,
##  find a world position and orientation. In this class
##  an internal vtkBoundedPlanePointPlacer is used to compute
##  the world position and orientation. The internal placer
##  is set to use the plane of the image actor and the bounds
##  of the image actor as the constraints for placing points.
##  int ComputeWorldPosition ( vtkRenderer * ren , double displayPos [ 2 ] , double worldPos [ 3 ] , double worldOrient [ 9 ] ) override ; *
##  This method is identical to the one above since the
##  reference position is ignored by the bounded plane
##  point placer.
##  int ComputeWorldPosition ( vtkRenderer * ren , double displayPos [ 2 ] , double refWorldPos [ 2 ] , double worldPos [ 3 ] , double worldOrient [ 9 ] ) override ; *
##  This method validates a world position by checking to see
##  if the world position is valid according to the constraints
##  of the internal placer (essentially - is this world position
##  on the image?)
##  int ValidateWorldPosition ( double worldPos [ 3 ] ) override ; *
##  This method is identical to the one above since the bounded
##  plane point placer ignores orientation
##  int ValidateWorldPosition ( double worldPos [ 3 ] , double worldOrient [ 9 ] ) override ; *
##  Update the world position and orientation according the
##  the current constraints of the placer. Will be called
##  by the representation when it notices that this placer
##  has been modified.
##  int UpdateWorldPosition ( vtkRenderer * ren , double worldPos [ 3 ] , double worldOrient [ 9 ] ) override ; *
##  A method for configuring the internal placer according
##  to the constraints of the image actor.
##  Called by the representation to give the placer a chance
##  to update itself, which may cause the MTime to change,
##  which would then cause the representation to update
##  all of its points
##  int UpdateInternalState ( ) override ; /@{ *
##  Set / get the reference vtkImageActor used to place the points.
##  An image actor must be set for this placer to work. An internal
##  bounded plane point placer is created and set to match the bounds
##  of the displayed image.
##  void SetImageActor ( vtkImageActor * ) ; virtual vtkImageActor * GetnameImageActor ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ImageActor  address  << static_cast < vtkImageActor * > ( this -> ImageActor ) ) ; return this -> ImageActor ; } ; /@} /@{ *
##  Optionally, you may set bounds to restrict the placement of the points.
##  The placement of points will then be constrained to lie not only on
##  the ImageActor but also within the bounds specified. If no bounds are
##  specified, they may lie anywhere on the supplied ImageActor.
##  virtual void SetBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Bounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> Bounds [ 0 ] != _arg1 ) || ( this -> Bounds [ 1 ] != _arg2 ) || ( this -> Bounds [ 2 ] != _arg3 ) || ( this -> Bounds [ 3 ] != _arg4 ) || ( this -> Bounds [ 4 ] != _arg5 ) || ( this -> Bounds [ 5 ] != _arg6 ) ) { this -> Bounds [ 0 ] = _arg1 ; this -> Bounds [ 1 ] = _arg2 ; this -> Bounds [ 2 ] = _arg3 ; this -> Bounds [ 3 ] = _arg4 ; this -> Bounds [ 4 ] = _arg5 ; this -> Bounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetBounds ( const double _arg [ 6 ] ) { this -> SetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> Bounds [ 0 ] ; _arg2 = this -> Bounds [ 1 ] ; _arg3 = this -> Bounds [ 2 ] ; _arg4 = this -> Bounds [ 3 ] ; _arg5 = this -> Bounds [ 4 ] ; _arg6 = this -> Bounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBounds ( double _arg [ 6 ] ) { this -> GetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} *
##  Set the world tolerance. This propagates it to the internal
##  BoundedPlanePointPlacer.
##  void SetWorldTolerance ( double tol ) override ; protected : vtkImageActorPointPlacer ( ) ; ~ vtkImageActorPointPlacer ( ) override ;  The reference image actor. Must be configured before this placer
##  is used. vtkImageActor * ImageActor ;  The internal placer. vtkBoundedPlanePointPlacer * Placer ;  Used to keep track of whether the bounds of the
##  input image have changed double SavedBounds [ 6 ] ;  See the SetBounds method double Bounds [ 6 ] ; private : vtkImageActorPointPlacer ( const vtkImageActorPointPlacer & ) = delete ; void operator = ( const vtkImageActorPointPlacer & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
