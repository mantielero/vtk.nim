## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSelectEnclosedPoints.h
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
##  @class   vtkSelectEnclosedPoints
##  @brief   mark points as to whether they are inside a closed surface
##
##  vtkSelectEnclosedPoints is a filter that evaluates all the input points to
##  determine whether they are in an enclosed surface. The filter produces a
##  (0,1) mask (in the form of a vtkDataArray) that indicates whether points
##  are outside (mask value=0) or inside (mask value=1) a provided surface.
##  (The name of the output vtkDataArray is "SelectedPoints".)
##
##  After running the filter, it is possible to query it as to whether a point
##  is inside/outside by invoking the IsInside(ptId) method.
##
##  @warning
##  The filter assumes that the surface is closed and manifold. A boolean flag
##  can be set to force the filter to first check whether this is true. If false,
##  all points will be marked outside. Note that if this check is not performed
##  and the surface is not closed, the results are undefined.
##
##  @warning
##  This filter produces and output data array, but does not modify the input
##  dataset. If you wish to extract cells or points, various threshold filters
##  are available (i.e., threshold the output array). Also, see the filter
##  vtkExtractEnclosedPoints which operates on point clouds.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkMaskPoints vtkExtractEnclosedPoints
##

## !!!Ignored construct:  # vtkSelectEnclosedPoints_h [NewLine] # vtkSelectEnclosedPoints_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkIntersectionCounter.h  to count intersections along ray [NewLine] class vtkUnsignedCharArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkAbstractCellLocator"
discard "forward decl of vtkStaticCellLocator"
discard "forward decl of vtkIdList"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkRandomPool"
## !!!Ignored construct:  class VTKFILTERSMODELING_EXPORT vtkSelectEnclosedPoints : public vtkDataSetAlgorithm { public : /@{ *
##  Standard methods for type information and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSelectEnclosedPoints :: IsTypeOf ( type ) ; } static vtkSelectEnclosedPoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSelectEnclosedPoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSelectEnclosedPoints * NewInstance ( ) const { return vtkSelectEnclosedPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSelectEnclosedPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSelectEnclosedPoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Instantiate this class.
##  static vtkSelectEnclosedPoints * New ( ) ; /@{ *
##  Set the surface to be used to test for containment. Two methods are
##  provided: one directly for vtkPolyData, and one for the output of a
##  filter.
##  void SetSurfaceData ( vtkPolyData * pd ) ; void SetSurfaceConnection ( vtkAlgorithmOutput * algOutput ) ; /@} /@{ *
##  Return a pointer to the enclosing surface.
##  vtkPolyData * GetSurface ( ) ; vtkPolyData * GetSurface ( vtkInformationVector * sourceInfo ) ; /@} /@{ *
##  By default, points inside the surface are marked inside or sent to
##  the output. If InsideOut is on, then the points outside the surface
##  are marked inside.
##  virtual void SetInsideOut ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InsideOut  to  << _arg ) ; if ( this -> InsideOut != _arg ) { this -> InsideOut = _arg ; this -> Modified ( ) ; } } ; virtual void InsideOutOn ( ) { this -> SetInsideOut ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InsideOutOff ( ) { this -> SetInsideOut ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ; /@} /@{ *
##  Specify whether to check the surface for closure. If on, then the
##  algorithm first checks to see if the surface is closed and manifold.
##  virtual void SetInsideOutCheckSurface ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CheckSurface  to  << _arg ) ; if ( this -> CheckSurface != _arg ) { this -> CheckSurface = _arg ; this -> Modified ( ) ; } } ; virtual void CheckSurfaceOn ( ) { this -> SetInsideOutCheckSurface ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CheckSurfaceOff ( ) { this -> SetInsideOutCheckSurface ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetInsideOutCheckSurface ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CheckSurface  of  << this -> CheckSurface ) ; return this -> CheckSurface ; } ; /@} *
##  Query an input point id as to whether it is inside or outside. Note that
##  the result requires that the filter execute first.
##  int IsInside ( vtkIdType inputPtId ) ; /@{ *
##  Specify the tolerance on the intersection. The tolerance is expressed as
##  a fraction of the diagonal of the bounding box of the enclosing surface.
##  virtual void SetTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Tolerance  to  << _arg ) ; if ( this -> Tolerance != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Tolerance = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetToleranceMinValue ( ) { return 0.0 ; } virtual double GetToleranceMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetInsideOutCheckSurfaceTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  This is a backdoor that can be used to test many points for containment.
##  First initialize the instance, then repeated calls to IsInsideSurface()
##  can be used without rebuilding the search structures. The Complete()
##  method releases memory.
##  void Initialize ( vtkPolyData * surface ) ; int IsInsideSurface ( double x [ 3 ] ) ; int IsInsideSurface ( double x , double y , double z ) ; void Complete ( ) ; /@} *
##  A static method for determining whether a point is inside a
##  surface. This is the heart of the algorithm and is thread safe. The user
##  must provide an input point x, the enclosing surface, the bounds of the
##  enclosing surface, the diagonal length of the enclosing surface, an
##  intersection tolerance, a cell locator for the surface, and two working
##  objects (cellIds, genCell) to support computation. Finally, in threaded
##  execution, generating random numbers is hard, so a precomputed random
##  sequence can be provided with an index into the sequence.
##  static int IsInsideSurface ( double x [ 3 ] , vtkPolyData * surface , double bds [ 6 ] , double length , double tol , vtkAbstractCellLocator * locator , vtkIdList * cellIds , vtkGenericCell * genCell , vtkIntersectionCounter & counter , vtkRandomPool * poole = nullptr , vtkIdType seqIdx = 0 ) ; *
##  A static method for determining whether a surface is closed. Provide as input
##  a vtkPolyData. The method returns >0 is the surface is closed and manifold.
##  static int IsSurfaceClosed ( vtkPolyData * surface ) ; protected : vtkSelectEnclosedPoints ( ) ; ~ vtkSelectEnclosedPoints ( ) override ; vtkTypeBool CheckSurface ; vtkTypeBool InsideOut ; double Tolerance ; vtkUnsignedCharArray * InsideOutsideArray ;  Internal structures for accelerating the intersection test vtkStaticCellLocator * CellLocator ; vtkIdList * CellIds ; vtkGenericCell * Cell ; vtkPolyData * Surface ; double Bounds [ 6 ] ; double Length ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; void ReportReferences ( vtkGarbageCollector * ) override ; private : vtkSelectEnclosedPoints ( const vtkSelectEnclosedPoints & ) = delete ; void operator = ( const vtkSelectEnclosedPoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
