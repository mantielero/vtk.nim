## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitSelectionLoop.h
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
##  @class   vtkImplicitSelectionLoop
##  @brief   implicit function for a selection loop
##
##  vtkImplicitSelectionLoop computes the implicit function value and
##  function gradient for an irregular, cylinder-like object whose cross
##  section is defined by a set of points forming a loop. The loop need
##  not be convex nor its points coplanar. However, the loop must be
##  non-self-intersecting when projected onto the plane defined by the
##  accumulated cross product around the loop (i.e., the axis of the
##  loop). (Alternatively, you can specify the normal to use.)
##
##  The following procedure is used to compute the implicit function
##  value for a point x. Each point of the loop is first projected onto
##  the plane defined by the loop normal. This forms a polygon. Then,
##  to evaluate the implicit function value, inside/outside tests are
##  used to determine if x is inside the polygon, and the distance to
##  the loop boundary is computed (negative values are inside the
##  loop).
##
##  One example application of this implicit function class is to draw a
##  loop on the surface of a mesh, and use the loop to clip or extract
##  cells from within the loop. Remember, the selection loop is "infinite"
##  in length, you can use a plane (in boolean combination) to cap the extent
##  of the selection loop. Another trick is to use a connectivity filter to
##  extract the closest region to a given point (i.e., one of the points used
##  to define the selection loop).
##
##  @sa
##  vtkImplicitFunction vtkImplicitBoolean vtkExtractGeometry vtkClipPolyData
##  vtkConnectivityFilter vtkPolyDataConnectivityFilter
##

## !!!Ignored construct:  # vtkImplicitSelectionLoop_h [NewLine] # vtkImplicitSelectionLoop_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkImplicitFunction.h [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolygon"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkImplicitSelectionLoop : public vtkImplicitFunction { public : /@{ *
##  Standard VTK methods for printing and type information.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImplicitFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImplicitFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitSelectionLoop :: IsTypeOf ( type ) ; } static vtkImplicitSelectionLoop * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitSelectionLoop * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitSelectionLoop * NewInstance ( ) const { return vtkImplicitSelectionLoop :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitSelectionLoop :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitSelectionLoop :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Instantiate object with no initial loop.
##  static vtkImplicitSelectionLoop * New ( ) ; /@{ *
##  Evaluate selection loop returning a signed distance.
##  using vtkImplicitFunction :: EvaluateFunction ; double EvaluateFunction ( double x [ 3 ] ) override ; /@} *
##  Evaluate selection loop returning the gradient.
##  void EvaluateGradient ( double x [ 3 ] , double n [ 3 ] ) override ; /@{ *
##  Set/Get the array of point coordinates defining the loop. There must
##  be at least three points used to define a loop.
##  virtual void SetLoop ( vtkPoints * ) ; virtual vtkPoints * GetnameLoop ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Loop  address  << static_cast < vtkPoints * > ( this -> Loop ) ) ; return this -> Loop ; } ; /@} /@{ *
##  Turn on/off automatic normal generation. By default, the normal is
##  computed from the accumulated cross product of the edges. You can also
##  specify the normal to use.
##  virtual void SetAutomaticNormalGeneration ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutomaticNormalGeneration  to  << _arg ) ; if ( this -> AutomaticNormalGeneration != _arg ) { this -> AutomaticNormalGeneration = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetAutomaticNormalGeneration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticNormalGeneration  of  << this -> AutomaticNormalGeneration ) ; return this -> AutomaticNormalGeneration ; } ; virtual void AutomaticNormalGenerationOn ( ) { this -> SetAutomaticNormalGeneration ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AutomaticNormalGenerationOff ( ) { this -> SetAutomaticNormalGeneration ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set / get the normal used to determine whether a point is inside or outside
##  the selection loop.
##  virtual void SetNormal ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Normal  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Normal [ 0 ] != _arg1 ) || ( this -> Normal [ 1 ] != _arg2 ) || ( this -> Normal [ 2 ] != _arg3 ) ) { this -> Normal [ 0 ] = _arg1 ; this -> Normal [ 1 ] = _arg2 ; this -> Normal [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNormal ( const double _arg [ 3 ] ) { this -> SetNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ; /@} *
##  Overload GetMTime() because we depend on the Loop
##  vtkMTimeType GetMTime ( ) override ; protected : vtkImplicitSelectionLoop ( ) ; ~ vtkImplicitSelectionLoop ( ) override ; vtkPoints * Loop ; double Normal [ 3 ] ; vtkTypeBool AutomaticNormalGeneration ; private : void Initialize ( ) ; vtkPolygon * Polygon ; double Origin [ 3 ] ; double Bounds [ 6 ] ;  bounds of the projected polyon double DeltaX ; double DeltaY ; double DeltaZ ; vtkTimeStamp InitializationTime ; private : vtkImplicitSelectionLoop ( const vtkImplicitSelectionLoop & ) = delete ; void operator = ( const vtkImplicitSelectionLoop & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
