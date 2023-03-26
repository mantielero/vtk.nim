## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridPlaneCutter.h
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
##  @class   vtkHyperTreeGridPlaneCutter
##  @brief   cut an hyper tree grid volume with
##  a plane and generate a polygonal cut surface.
##
##
##  vtkHyperTreeGridPlaneCutter is a filter that takes as input an hyper tree
##  grid and a single plane and generates the polygonal data intersection surface.
##  This cut is computed at the leaf cells of the hyper tree.
##  It is left as an option to decide whether the cut should be computed over
##  the original AMR mesh or over its dual; in the latter case, perfect
##  connectivity (i.e., mesh conformity in the FE sense) is achieved at the
##  cost of interpolation to the dual of the input AMR mesh, and therefore
##  of missing intersection plane pieces near the primal boundary.
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm
##
##  @par Thanks:
##  This class was written by Philippe Pebay on a idea of Guenole Harel and Jacques-Bernard Lekien,
##  2016 This class was modified by Rogeli Grima Torres, 2016 This class was modified by
##  Jacques-Bernard Lekien, 2018 This work was supported by Commissariat a l'Energie Atomique CEA,
##  DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkHyperTreeGridPlaneCutter_h [NewLine] # vtkHyperTreeGridPlaneCutter_h [NewLine] # vtkFiltersHyperTreeModule.h  For export macro # vtkHyperTreeGridAlgorithm.h [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCutter"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPoints"
discard "forward decl of vtkHyperTreeGridNonOrientedGeometryCursor"
discard "forward decl of vtkHyperTreeGridNonOrientedMooreSuperCursor"
## !!!Ignored construct:  class VTKFILTERSHYPERTREE_EXPORT vtkHyperTreeGridPlaneCutter : public vtkHyperTreeGridAlgorithm { public : static vtkHyperTreeGridPlaneCutter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridPlaneCutter :: IsTypeOf ( type ) ; } static vtkHyperTreeGridPlaneCutter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridPlaneCutter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridPlaneCutter * NewInstance ( ) const { return vtkHyperTreeGridPlaneCutter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridPlaneCutter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridPlaneCutter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the plane with its [a,b,c,d] Cartesian coefficients:
##  a*x + b*y + c*z = d
##  void SetPlane ( double a , double b , double c , double d ) ; virtual double * GetPlane ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Plane  pointer  << this -> Plane ) ; return this -> Plane ; } VTK_WRAPEXCLUDE virtual void GetPlane ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> Plane [ 0 ] ; _arg2 = this -> Plane [ 1 ] ; _arg3 = this -> Plane [ 2 ] ; _arg4 = this -> Plane [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Plane  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPlane ( double _arg [ 4 ] ) { this -> GetPlane ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} /@{ *
##  Returns 0 if plane's normal is aligned with X axis, 1 if it is aligned with Y axis, 2 if it
##  is aligned with Z axis. Returns -1 if not aligned with any principal axis.
##  virtual int GetAxisAlignment ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AxisAlignment  of  << this -> AxisAlignment ) ; return this -> AxisAlignment ; } ; /@} /@{ *
##  Returns true if plane's normal is aligned with the corresponding axis, false elsewise.
##  bool IsPlaneOrthogonalToXAxis ( ) { return this -> AxisAlignment == 0 ; } bool IsPlaneOrthogonalToYAxis ( ) { return this -> AxisAlignment == 1 ; } bool IsPlaneOrthogonalToZAxis ( ) { return this -> AxisAlignment == 2 ; } }@ /@{ *
##  Set/Get whether output mesh should be computed on dual grid
##  virtual void SetDual ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Dual  to  << _arg ) ; if ( this -> Dual != _arg ) { this -> Dual = _arg ; this -> Modified ( ) ; } } ; virtual int GetAxisAlignmentDual ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dual  of  << this -> Dual ) ; return this -> Dual ; } ; virtual void DualOn ( ) { this -> SetDual ( static_cast < int > ( 1 ) ) ; } virtual void DualOff ( ) { this -> SetDual ( static_cast < int > ( 0 ) ) ; } ; /@} protected : vtkHyperTreeGridPlaneCutter ( ) ; ~ vtkHyperTreeGridPlaneCutter ( ) override ; *
##  Resets every attributes to a minimal state needed for the algorithm to execute
##  virtual void Reset ( ) ; *
##  For this algorithm the output is a vtkPolyData instance
##  int FillOutputPortInformation ( int , vtkInformation * ) override ; *
##  Top-level routine to generate plane cut
##  int ProcessTrees ( vtkHyperTreeGrid * , vtkDataObject * ) override ; *
##  Recursively descend into tree down to leaves, cutting primal cells
##  void RecursivelyProcessTreePrimal ( vtkHyperTreeGridNonOrientedGeometryCursor * ) ; *
##  Recursively decide whether cell is intersected by plane
##  bool RecursivelyPreProcessTree ( vtkHyperTreeGridNonOrientedGeometryCursor * ) ; *
##  Recursively descend into tree down to leaves, cutting dual cells
##  void RecursivelyProcessTreeDual ( vtkHyperTreeGridNonOrientedMooreSuperCursor * ) ; *
##  Check if a cursor is intersected by a plane
##  bool CheckIntersection ( double [ 8 ] [ 3 ] , double [ 8 ] ) ;  Check if a cursor is intersected by a plane.
##  Don't return function evaluations bool CheckIntersection ( double [ 8 ] [ 3 ] ) ; *
##  Compute the intersection between an edge and a plane
##  void PlaneCut ( int , int , double [ 8 ] [ 3 ] , int & , double [ ] [ 3 ] ) ; *
##  Reorder cut points following the perimeter of the cut.
##  void ReorderCutPoints ( int , double [ ] [ 3 ] ) ; *
##  Storage for the plane cutter parameters
##  double Plane [ 4 ] ; *
##  Decide whether output mesh should be a computed on dual grid
##  int Dual ; *
##  Storage for pre-selected cells to be processed in dual mode
##  vtkBitArray * SelectedCells ; *
##  Storage for points of output unstructured mesh
##  vtkPoints * Points ; *
##  Storage for cells of output unstructured mesh
##  vtkCellArray * Cells ; *
##  Storage for dual vertex indices
##  vtkIdList * Leaves ; *
##  Storage for dual vertices at center of primal cells
##  vtkPoints * Centers ; *
##  Cutter to be used on dual cells
##  vtkCutter * Cutter ; *
##  material Mask
##  vtkBitArray * InMask ; *
##  Flag computed at plane creation to know wether it is aligned with x, y or z axis
##  int AxisAlignment ; private : vtkHyperTreeGridPlaneCutter ( const vtkHyperTreeGridPlaneCutter & ) = delete ; void operator = ( const vtkHyperTreeGridPlaneCutter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
