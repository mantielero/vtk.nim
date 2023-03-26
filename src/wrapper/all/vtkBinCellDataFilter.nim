## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBinCellDataFilter.h
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
##  @class   vtkBinCellDataFilter
##  @brief   bin source cell data into input cells.
##
##  vtkBinCellDataFilter takes a source mesh containing scalar cell data, an
##  input mesh and a set of bin values and bins the source mesh's scalar cell
##  data into the cells of the input mesh. The resulting output mesh is identical
##  to the input mesh, with an additional cell data field, with tuple size equal
##  to the number of bins + 1, that represents a histogram of the cell data
##  values for all of the source cells whose centroid lie within the input cell.
##
##  This filter is useful for analyzing the efficacy of an input mesh's ability
##  to represent the cell data of the source mesh.
##

## !!!Ignored construct:  # vtkBinCellDataFilter_h [NewLine] # vtkBinCellDataFilter_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkDataSetAttributes.h  needed for vtkDataSetAttributes::FieldList # vtkFiltersCoreModule.h  For export macro [NewLine] # vtkContourValues.h  Needed for inline methods [NewLine] class vtkAbstractCellLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkBinCellDataFilter : public vtkDataSetAlgorithm { public : typedef vtkContourValues vtkBinValues ; *
##  Construct object with initial range (VTK_DOUBLE_MIN, VTK_DOUBLE_MAX) and
##  a single bin.
##  static vtkBinCellDataFilter * New ( ) ; /@{ *
##  Standard methods for type and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBinCellDataFilter :: IsTypeOf ( type ) ; } static vtkBinCellDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBinCellDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBinCellDataFilter * NewInstance ( ) const { return vtkBinCellDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBinCellDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBinCellDataFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Methods to set / get bin values.
##  void SetValue ( int i , double value ) ; double GetValue ( int i ) ; double * GetValues ( ) ; void GetValues ( double * binValues ) ; void SetNumberOfBins ( int numBins ) ; vtkIdType GetNumberOfBins ( ) ; void GenerateValues ( int numBins , double range [ 2 ] ) ; void GenerateValues ( int numBins , double rangeStart , double rangeEnd ) ; /@} /@{ *
##  Specify the data set whose cells will be counted.
##  The Input gives the geometry (the points and cells) for the output,
##  while the Source is used to determine how many source cells lie within
##  each input cell.
##  void SetSourceData ( vtkDataObject * source ) ; vtkDataObject * GetSource ( ) ; /@} *
##  Specify the data set whose cells will be counted.
##  The Input gives the geometry (the points and cells) for the output,
##  while the Source is used to determine how many source cells lie within
##  each input cell.
##  void SetSourceConnection ( vtkAlgorithmOutput * algOutput ) ; /@{ *
##  This flag is used only when a piece is requested to update.  By default
##  the flag is off.  Because no spatial correspondence between input pieces
##  and source pieces is known, all of the source has to be requested no
##  matter what piece of the output is requested.  When there is a spatial
##  correspondence, the user/application can set this flag.  This hint allows
##  the breakup of the probe operation to be much more efficient.  When piece
##  m of n is requested for update by the user, then only n of m needs to
##  be requested of the source.
##  virtual void SetSpatialMatch ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SpatialMatch  to  << _arg ) ; if ( this -> SpatialMatch != _arg ) { this -> SpatialMatch = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetSpatialMatch ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SpatialMatch  of  << this -> SpatialMatch ) ; return this -> SpatialMatch ; } ; virtual void SpatialMatchOn ( ) { this -> SetSpatialMatch ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SpatialMatchOff ( ) { this -> SetSpatialMatch ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set whether to store the number of nonzero bins for each cell.
##  On by default.
##  virtual void SetSpatialMatchStoreNumberOfNonzeroBins ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StoreNumberOfNonzeroBins  to  << _arg ) ; if ( this -> StoreNumberOfNonzeroBins != _arg ) { this -> StoreNumberOfNonzeroBins = _arg ; this -> Modified ( ) ; } } ; virtual void StoreNumberOfNonzeroBinsOn ( ) { this -> SetSpatialMatchStoreNumberOfNonzeroBins ( static_cast < bool > ( 1 ) ) ; } virtual void StoreNumberOfNonzeroBinsOff ( ) { this -> SetSpatialMatchStoreNumberOfNonzeroBins ( static_cast < bool > ( 0 ) ) ; } ; virtual bool GetSpatialMatchStoreNumberOfNonzeroBins ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StoreNumberOfNonzeroBins  of  << this -> StoreNumberOfNonzeroBins ) ; return this -> StoreNumberOfNonzeroBins ; } ; /@} /@{ *
##  Returns the name of the id array added to the output that holds the number
##  of nonzero bins per cell.
##  Set to "NumberOfNonzeroBins" by default.
##  virtual void SetNumberOfNonzeroBinsArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfNonzeroBinsArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> NumberOfNonzeroBinsArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> NumberOfNonzeroBinsArrayName && _arg && ( ! strcmp ( this -> NumberOfNonzeroBinsArrayName , _arg ) ) ) { return ; } delete [ ] this -> NumberOfNonzeroBinsArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> NumberOfNonzeroBinsArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> NumberOfNonzeroBinsArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetNumberOfNonzeroBinsArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfNonzeroBinsArrayName  of  << ( this -> NumberOfNonzeroBinsArrayName ? this -> NumberOfNonzeroBinsArrayName : (null) ) ) ; return this -> NumberOfNonzeroBinsArrayName ; } ; /@} /@{ *
##  Set the tolerance used to compute whether a cell centroid in the
##  source is in a cell of the input.  This value is only used
##  if ComputeTolerance is off.
##  virtual void SetSpatialMatchStoreNumberOfNonzeroBinsTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetSpatialMatchStoreNumberOfNonzeroBinsTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  Set whether to use the Tolerance field or precompute the tolerance.
##  When on, the tolerance will be computed and the field value is ignored.
##  Off by default.
##  virtual void SetSpatialMatchStoreNumberOfNonzeroBinsToleranceComputeTolerance ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeTolerance  to  << _arg ) ; if ( this -> ComputeTolerance != _arg ) { this -> ComputeTolerance = _arg ; this -> Modified ( ) ; } } ; virtual void ComputeToleranceOn ( ) { this -> SetSpatialMatchStoreNumberOfNonzeroBinsComputeTolerance ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeToleranceOff ( ) { this -> SetSpatialMatchStoreNumberOfNonzeroBinsComputeTolerance ( static_cast < bool > ( 0 ) ) ; } ; virtual bool GetSpatialMatchStoreNumberOfNonzeroBinsToleranceComputeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeTolerance  of  << this -> ComputeTolerance ) ; return this -> ComputeTolerance ; } ; /@} /@{ *
##  Set/get which component of the scalar array to bin; defaults to 0.
##  virtual void SetSpatialMatchStoreNumberOfNonzeroBinsToleranceComputeToleranceArrayComponent ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ArrayComponent  to  << _arg ) ; if ( this -> ArrayComponent != _arg ) { this -> ArrayComponent = _arg ; this -> Modified ( ) ; } } ; virtual int GetSpatialMatchStoreNumberOfNonzeroBinsToleranceComputeToleranceArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ; /@} enum CellOverlapCriterion { CELL_CENTROID = 0 , CELL_POINTS = 1 , } ; /@{ *
##  Set whether cell overlap is determined by source cell centroid or by source
##  cell points.
##  Centroid by default.
##  virtual void SetCellOverlapMethod ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CellOverlapMethod  to  << _arg ) ; if ( this -> CellOverlapMethod != ( _arg < CELL_CENTROID ? CELL_CENTROID : ( _arg > CELL_POINTS ? CELL_POINTS : _arg ) ) ) { this -> CellOverlapMethod = ( _arg < CELL_CENTROID ? CELL_CENTROID : ( _arg > CELL_POINTS ? CELL_POINTS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetCellOverlapMethodMinValue ( ) { return CELL_CENTROID ; } virtual int GetCellOverlapMethodMaxValue ( ) { return CELL_POINTS ; } ; virtual int GetSpatialMatchStoreNumberOfNonzeroBinsToleranceComputeToleranceArrayComponentCellOverlapMethod ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellOverlapMethod  of  << this -> CellOverlapMethod ) ; return this -> CellOverlapMethod ; } ; /@} /@{ *
##  Set/Get a spatial locator for speeding the search process. By
##  default an instance of vtkStaticCellLocator is used.
##  virtual void SetCellLocator ( vtkAbstractCellLocator * cellLocator ) ; virtual vtkAbstractCellLocator * GetnameCellLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CellLocator  address  << static_cast < vtkAbstractCellLocator * > ( this -> CellLocator ) ) ; return this -> CellLocator ; } ; /@} protected : vtkBinCellDataFilter ( ) ; ~ vtkBinCellDataFilter ( ) override ; vtkTypeBool SpatialMatch ; bool StoreNumberOfNonzeroBins ; double Tolerance ; bool ComputeTolerance ; int ArrayComponent ; int CellOverlapMethod ; vtkBinValues * BinValues ; vtkAbstractCellLocator * CellLocator ; virtual void CreateDefaultLocator ( ) ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * NumberOfNonzeroBinsArrayName ; private : vtkBinCellDataFilter ( const vtkBinCellDataFilter & ) = delete ; void operator = ( const vtkBinCellDataFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Set a particular bin value at bin number i. The index i ranges
##  between 0<=i<NumberOfBins.
##

proc SetValue*(i: cint; value: cdouble) {.importcpp: "VTKFILTERSCORE_EXPORT::SetValue(@)",
                                     header: "vtkBinCellDataFilter.h".}
## *
##  Get the ith bin value.
##

proc GetValue*(i: cint): cdouble {.importcpp: "VTKFILTERSCORE_EXPORT::GetValue(@)",
                               header: "vtkBinCellDataFilter.h".}
## *
##  Get a pointer to an array of bin values. There will be
##  GetNumberOfBins() values in the list.
##

proc GetValues*(): ptr cdouble {.importcpp: "VTKFILTERSCORE_EXPORT::GetValues(@)",
                             header: "vtkBinCellDataFilter.h".}
## *
##  Fill a supplied list with bin values. There will be
##  GetNumberOfBins() values in the list. Make sure you allocate
##  enough memory to hold the list.
##

proc GetValues*(binValues: ptr cdouble) {.importcpp: "VTKFILTERSCORE_EXPORT::GetValues(@)",
                                      header: "vtkBinCellDataFilter.h".}
## *
##  Set the number of bins to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##

proc SetNumberOfBins*(number: cint) {.importcpp: "VTKFILTERSCORE_EXPORT::SetNumberOfBins(@)",
                                   header: "vtkBinCellDataFilter.h".}
## *
##  Get the number of bins in the list of bin values, not counting the overflow
##  bin.
##

proc GetNumberOfBins*(): vtkIdType {.importcpp: "VTKFILTERSCORE_EXPORT::GetNumberOfBins(@)",
                                  header: "vtkBinCellDataFilter.h".}
## *
##  Generate numBins equally spaced bin values between specified
##  range. Bin values will include min/max range values.
##

proc GenerateValues*(numBins: cint; range: array[2, cdouble]) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GenerateValues(@)",
    header: "vtkBinCellDataFilter.h".}
## *
##  Generate numBins equally spaced bin values between specified
##  range. Bin values will include min/max range values.
##

proc GenerateValues*(numBins: cint; rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GenerateValues(@)",
    header: "vtkBinCellDataFilter.h".}