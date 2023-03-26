## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUniformHyperTreeGrid.h
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
##  @class   vtkUniformHyperTreeGrid
##  @brief   A specifalized type of vtkHyperTreeGrid for the case
##  when root cells have uniform sizes in each direction
##
##  @sa
##  vtkHyperTree vtkHyperTreeGrid vtkRectilinearGrid
##
##  @par Thanks:
##  This class was written by Philippe Pebay, NexGen Analytics 2017
##  JB modify for introduce Scales by Jacques-Bernard Lekien, CEA 2018.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkUniformHyperTreeGrid_h [NewLine] # vtkUniformHyperTreeGrid_h [NewLine] # limits.h  UINT_MAX [NewLine] # < algorithm >  std::min/std::max # < cmath >  std::round # < memory >  std::shared_ptr [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkHyperTreeGrid.h [NewLine] class vtkDoubleArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkHyperTreeGridScales"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkUniformHyperTreeGrid : public vtkHyperTreeGrid { public : static vtkUniformHyperTreeGrid * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGrid Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGrid :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUniformHyperTreeGrid :: IsTypeOf ( type ) ; } static vtkUniformHyperTreeGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUniformHyperTreeGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUniformHyperTreeGrid * NewInstance ( ) const { return vtkUniformHyperTreeGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUniformHyperTreeGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUniformHyperTreeGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Return what type of dataset this is.
##  int GetDataObjectType ( ) override { return VTK_UNIFORM_HYPER_TREE_GRID ; } *
##  Copy the internal geometric and topological structure of a
##  vtkUniformHyperTreeGrid object.
##  void CopyStructure ( vtkDataObject * ) override ; void Initialize ( ) override ; /@{ *
##  Set/Get origin of grid
##  virtual void SetOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Origin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Origin [ 0 ] != _arg1 ) || ( this -> Origin [ 1 ] != _arg2 ) || ( this -> Origin [ 2 ] != _arg3 ) ) { this -> Origin [ 0 ] = _arg1 ; this -> Origin [ 1 ] = _arg2 ; this -> Origin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOrigin ( const double _arg [ 3 ] ) { this -> SetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double _arg [ 3 ] ) { this -> GetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/Get scale of root cells along each direction
##  void SetGridScale ( double , double , double ) ; void SetGridScale ( double * ) ; virtual double * GetOriginGridScale ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << GridScale  pointer  << this -> GridScale ) ; return this -> GridScale ; } VTK_WRAPEXCLUDE virtual void GetOriginGridScale ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> GridScale [ 0 ] ; _arg2 = this -> GridScale [ 1 ] ; _arg3 = this -> GridScale [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << GridScale  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginGridScale ( double _arg [ 3 ] ) { this -> GetOriginGridScale ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} *
##  Set all scales at once when root cells are d-cubes
##  void SetGridScale ( double ) ; *
##  Return a pointer to the geometry bounding box in the form
##  (xmin,xmax, ymin,ymax, zmin,zmax).
##  THIS METHOD IS NOT THREAD SAFE.
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ; /@{ *
##  Set/Get the grid coordinates in the x-direction.
##  NB: Set method deactivated in the case of uniform grids.
##  Use SetSize() instead.
##  void SetXCoordinates ( vtkDataArray * XCoordinates ) override ; vtkDataArray * GetXCoordinates ( ) override ;  JB A faire pour les Get !
##   const vtkDataArray* GetXCoordinates() const override {
##     throw std::domain_error("Cannot use GetZCoordinates on UniformHyperTreeGrid");
##   }
##  /@} /@{ *
##  Set/Get the grid coordinates in the y-direction.
##  NB: Set method deactivated in the case of uniform grids.
##  Use SetSize() instead.
##  void SetYCoordinates ( vtkDataArray * YCoordinates ) override ; vtkDataArray * GetYCoordinates ( ) override ;  JB A faire pour les Get !
##   const vtkDataArray* GetYCoordinates() const override {
##     throw std::domain_error("Cannot use GetZCoordinates on UniformHyperTreeGrid");
##   }
##  /@} /@{ *
##  Set/Get the grid coordinates in the z-direction.
##  NB: Set method deactivated in the case of uniform grids.
##  Use SetSize() instead.
##  void SetZCoordinates ( vtkDataArray * ZCoordinates ) override ; vtkDataArray * GetZCoordinates ( ) override ;  JB A faire pour les Get !
##   const vtkDataArray* GetZCoordinates() const override {
##     throw std::domain_error("Cannot use GetZCoordinates on UniformHyperTreeGrid");
##   }
##   JB A faire pour les autre Get !
## /@} /@{ *
##  JB Augented services on Coordinates.
##  void CopyCoordinates ( const vtkHyperTreeGrid * output ) override ; void SetFixedCoordinates ( unsigned int axis , double value ) override ; /@} *
##  Convert the global index of a root to its Spacial coordinates origin and size.
##  void GetLevelZeroOriginAndSizeFromIndex ( vtkIdType , double * , double * ) override ; *
##  Convert the global index of a root to its Spacial coordinates origin and size.
##  void GetLevelZeroOriginFromIndex ( vtkIdType , double * ) override ; *
##  Create shallow copy of hyper tree grid.
##  void ShallowCopy ( vtkDataObject * ) override ; *
##  Create deep copy of hyper tree grid.
##  void DeepCopy ( vtkDataObject * ) override ; *
##  Return the actual size of the data bytes
##  unsigned long GetActualMemorySizeBytes ( ) override ; *
##  Return tree located at given index of hyper tree grid
##  NB: This will construct a new HyperTree if grid slot is empty.
##  vtkHyperTree * GetTree ( vtkIdType , bool create = false ) override ; protected : *
##  Constructor
##  vtkUniformHyperTreeGrid ( ) ; *
##  Destructor
##  ~ vtkUniformHyperTreeGrid ( ) override ; *
##  Grid Origin
##  double Origin [ 3 ] ; *
##  Element sizes in each direction
##  double GridScale [ 3 ] ; /@{ *
##  Keep track of whether coordinates have been explicitly computed
##  bool ComputedXCoordinates ; bool ComputedYCoordinates ; bool ComputedZCoordinates ; /@} unsigned int FindDichotomicX ( double value ) const override { if ( value < this -> Origin [ 0 ] || value > this -> Origin [ 0 ] + this -> GridScale [ 0 ] * ( this -> GetDimensions ( ) [ 0 ] - 1 ) ) { return UINT_MAX ; } return std :: round ( ( value - this -> Origin [ 0 ] ) / this -> GridScale [ 0 ] ) ; } unsigned int FindDichotomicY ( double value ) const override { if ( value < this -> Origin [ 1 ] || value > this -> Origin [ 1 ] + this -> GridScale [ 1 ] * ( this -> GetDimensions ( ) [ 1 ] - 1 ) ) { return UINT_MAX ; } return std :: round ( ( value - this -> Origin [ 1 ] ) / this -> GridScale [ 1 ] ) ; } unsigned int FindDichotomicZ ( double value ) const override { if ( value < this -> Origin [ 2 ] || value > this -> Origin [ 2 ] + this -> GridScale [ 2 ] * ( this -> GetDimensions ( ) [ 2 ] - 1 ) ) { return UINT_MAX ; } return std :: round ( ( value - this -> Origin [ 2 ] ) / this -> GridScale [ 2 ] ) ; } *
##  JB Storage of pre-computed per-level cell scales
##  mutable std :: shared_ptr < vtkHyperTreeGridScales > Scales ; private : vtkUniformHyperTreeGrid ( const vtkUniformHyperTreeGrid & ) = delete ; void operator = ( const vtkUniformHyperTreeGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
