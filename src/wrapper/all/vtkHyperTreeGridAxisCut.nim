## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridAxisCut.h
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
##  @class   vtkHyperTreeGridAxisCut
##  @brief   Axis aligned hyper tree grid cut
##
##
##  Cut an hyper tree grid along an axis aligned plane and output a hyper
##  tree grid lower dimensionality. Only works for 3D grids as inputs
##
##  NB: This new (2014-16) version of the class is not to be confused with
##  earlier (2012-13) version that produced a vtkPolyData output composed of
##  disjoint (no point sharing) quadrilaterals, with possibly superimposed
##  faces when cut plane contained inter-cell boundaries.
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm
##
##  @par Thanks:
##  This class was written by Guenole Harel and Jacques-Bernard Lekien 2014
##  This class was modified by Philippe Pebay, 2016
##  This class was modified by Jacques-Bernard Lekien, 2018
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkHyperTreeGridAxisCut_h [NewLine] # vtkHyperTreeGridAxisCut_h [NewLine] # vtkFiltersHyperTreeModule.h  For export macro # vtkHyperTreeGridAlgorithm.h [NewLine] class vtkBitArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
discard "forward decl of vtkHyperTreeGridNonOrientedGeometryCursor"
## !!!Ignored construct:  class VTKFILTERSHYPERTREE_EXPORT vtkHyperTreeGridAxisCut : public vtkHyperTreeGridAlgorithm { public : static vtkHyperTreeGridAxisCut * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridAxisCut :: IsTypeOf ( type ) ; } static vtkHyperTreeGridAxisCut * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridAxisCut * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridAxisCut * NewInstance ( ) const { return vtkHyperTreeGridAxisCut :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridAxisCut :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridAxisCut :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Normal axis: 0=X, 1=Y, 2=Z. Default is 0
##  virtual void SetPlaneNormalAxis ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PlaneNormalAxis  to  << _arg ) ; if ( this -> PlaneNormalAxis != ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> PlaneNormalAxis = ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetPlaneNormalAxisMinValue ( ) { return 0 ; } virtual int GetPlaneNormalAxisMaxValue ( ) { return 2 ; } ; virtual int GetPlaneNormalAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlaneNormalAxis  of  << this -> PlaneNormalAxis ) ; return this -> PlaneNormalAxis ; } ; /@} /@{ *
##  Position of plane: Axis constant. Default is 0.0
##  virtual void SetPlanePosition ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PlanePosition  to  << _arg ) ; if ( this -> PlanePosition != _arg ) { this -> PlanePosition = _arg ; this -> Modified ( ) ; } } ; virtual double GetPlaneNormalAxisPlanePosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlanePosition  of  << this -> PlanePosition ) ; return this -> PlanePosition ; } ; /@} protected : vtkHyperTreeGridAxisCut ( ) ; ~ vtkHyperTreeGridAxisCut ( ) override ;  For this algorithm the output is a vtkHyperTreeGrid instance int FillOutputPortInformation ( int , vtkInformation * ) override ; *
##  Main routine to generate hyper tree grid cut
##  int ProcessTrees ( vtkHyperTreeGrid * , vtkDataObject * ) override ; *
##  Recursively descend into tree down to leaves
##  void RecursivelyProcessTree ( vtkHyperTreeGridNonOrientedGeometryCursor * inCursor , vtkHyperTreeGridNonOrientedCursor * outCursor ) ; *
##  Direction of plane normal
##  int PlaneNormalAxis ; *
##  Intercept of plane along normal
##  double PlanePosition ; double PlanePositionRealUse ; *
##  Output material mask constructed by this filter
##  vtkBitArray * InMask ; vtkBitArray * OutMask ; *
##  Keep track of current index in output hyper tree grid
##  vtkIdType CurrentId ; private : vtkHyperTreeGridAxisCut ( const vtkHyperTreeGridAxisCut & ) = delete ; void operator = ( const vtkHyperTreeGridAxisCut & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
