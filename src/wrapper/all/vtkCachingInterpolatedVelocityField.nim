## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCachingInterpolatedVelocityField.h
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
##  @class   vtkCachingInterpolatedVelocityField
##  @brief   Interface for obtaining
##  interpolated velocity values
##
##  vtkCachingInterpolatedVelocityField acts as a continuous velocity field
##  by performing cell interpolation on the underlying vtkDataSet.
##  This is a concrete sub-class of vtkFunctionSet with
##  NumberOfIndependentVariables = 4 (x,y,z,t) and
##  NumberOfFunctions = 3 (u,v,w). Normally, every time an evaluation
##  is performed, the cell which contains the point (x,y,z) has to
##  be found by calling FindCell. This is a computationally expensive
##  operation. In certain cases, the cell search can be avoided or shortened
##  by providing a guess for the cell id. For example, in streamline
##  integration, the next evaluation is usually in the same or a neighbour
##  cell. For this reason, vtkCachingInterpolatedVelocityField stores the last
##  cell id. If caching is turned on, it uses this id as the starting point.
##
##  @warning
##  vtkCachingInterpolatedVelocityField is not thread safe. A new instance should
##  be created by each thread.
##
##  @sa
##  vtkFunctionSet vtkStreamTracer
##
##  @todo
##  Need to clean up style to match vtk/Kitware standards. Please help.
##

## !!!Ignored construct:  # vtkCachingInterpolatedVelocityField_h [NewLine] # vtkCachingInterpolatedVelocityField_h [NewLine] # vtkDeprecation.h  for VTK_DEPRECATED_IN_9_2_0 # vtkFiltersFlowPathsModule.h  For export macro # vtkFunctionSet.h [NewLine] # vtkSmartPointer.h  this is allowed [NewLine] # < vector >  we need them [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkAbstractCellLocator"
discard "forward decl of IVFDataSetInfo"
type
  VTK_DEPRECATED_IN_9_2_0IVFCacheList* {.importcpp: "VTK_DEPRECATED_IN_9_2_0::IVFCacheList", header: "vtkCachingInterpolatedVelocityField.h",
                                        bycopy.} = object of vector[
      VTK_DEPRECATED_IN_9_2_0IVFDataSetInfo]


## ---------------------------------------------------------------------------

## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_2_0 ( Use vtkCompositeInterpolatedVelocityField instead of vtkCachingInterpolatedVelocityField  and set the desired strategy. ) VTKFILTERSFLOWPATHS_EXPORT vtkCachingInterpolatedVelocityField : public vtkFunctionSet { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkFunctionSet Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkFunctionSet :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCachingInterpolatedVelocityField :: IsTypeOf ( type ) ; } static vtkCachingInterpolatedVelocityField * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCachingInterpolatedVelocityField * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCachingInterpolatedVelocityField * NewInstance ( ) const { return vtkCachingInterpolatedVelocityField :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFunctionSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCachingInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCachingInterpolatedVelocityField :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct a vtkCachingInterpolatedVelocityField with no initial data set.
##  LastCellId is set to -1.
##  static vtkCachingInterpolatedVelocityField * New ( ) ; using Superclass :: FunctionValues ; /@{ *
##  Evaluate the velocity field, f={u,v,w}, at {x, y, z}.
##  returns 1 if valid, 0 if test failed
##  int FunctionValues ( double * x , double * f ) override ; virtual int InsideTest ( double * x ) ; /@} *
##  Add a dataset used by the interpolation function evaluation.
##  virtual void SetDataSet ( int I , vtkDataSet * dataset , bool staticdataset , vtkAbstractCellLocator * locator ) ; /@{ *
##  If you want to work with an arbitrary vector array, then set its name
##  here. By default this in nullptr and the filter will use the active vector
##  array.
##  virtual char * GetVectorsSelection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << VectorsSelection  of  << ( this -> VectorsSelection ? this -> VectorsSelection : (null) ) ) ; return this -> VectorsSelection ; } ; void SelectVectors ( const char * fieldName ) { this -> SetVectorsSelection ( fieldName ) ; } /@} *
##  Set LastCellId to c and LastCacheIndex datasetindex, cached from last evaluation.
##  If c isn't -1 then the corresponding cell is stored in Cache->Cell.
##  These values should be valid or an assertion will be triggered.
##  void SetLastCellInfo ( vtkIdType c , int datasetindex ) ; *
##  Set LastCellId to -1 and Cache to nullptr so that the next
##  search does not start from the previous cell.
##  void ClearLastCellInfo ( ) ; /@{ *
##  Returns the interpolation weights/pcoords cached from last evaluation
##  if the cached cell is valid (returns 1). Otherwise, it does not
##  change w and returns 0.
##  int GetLastWeights ( double * w ) ; int GetLastLocalCoordinates ( double pcoords [ 3 ] ) ; /@} /@{ *
##  Caching statistics.
##  virtual int GetCellCacheHit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellCacheHit  of  << this -> CellCacheHit ) ; return this -> CellCacheHit ; } ; virtual int GetCellCacheHitDataSetCacheHit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataSetCacheHit  of  << this -> DataSetCacheHit ) ; return this -> DataSetCacheHit ; } ; virtual int GetCellCacheHitDataSetCacheHitCacheMiss ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheMiss  of  << this -> CacheMiss ) ; return this -> CacheMiss ; } ; /@} protected : vtkCachingInterpolatedVelocityField ( ) ; ~ vtkCachingInterpolatedVelocityField ( ) override ; vtkGenericCell * TempCell ; int CellCacheHit ; int DataSetCacheHit ; int CacheMiss ; int LastCacheIndex ; int LastCellId ; IVFDataSetInfo * Cache ; IVFCacheList CacheList ; char * VectorsSelection ; std :: vector < double > Weights ; virtual void SetVectorsSelection ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VectorsSelection  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> VectorsSelection == nullptr && _arg == nullptr ) { return ; } if ( this -> VectorsSelection && _arg && ( ! strcmp ( this -> VectorsSelection , _arg ) ) ) { return ; } delete [ ] this -> VectorsSelection ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> VectorsSelection = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> VectorsSelection = nullptr ; } this -> Modified ( ) ; } ;  private versions which work on the passed dataset/cache
##  these do the real computation int FunctionValues ( IVFDataSetInfo * cache , double * x , double * f ) ; int InsideTest ( IVFDataSetInfo * cache , double * x ) ; friend class vtkTemporalInterpolatedVelocityField ; /@{ *
##  If all weights have been computed (parametric coords etc all valid)
##  then we can quickly interpolate a scalar/vector using the known weights
##  and the generic cell which has been stored.
##  This function is primarily reserved for use by
##  vtkTemporalInterpolatedVelocityField
##  void FastCompute ( IVFDataSetInfo * cache , double f [ 3 ] ) ; bool InterpolatePoint ( vtkPointData * outPD , vtkIdType outIndex ) ; bool InterpolatePoint ( vtkCachingInterpolatedVelocityField * inCIVF , vtkPointData * outPD , vtkIdType outIndex ) ; vtkGenericCell * GetLastCell ( ) ; /@} private : vtkCachingInterpolatedVelocityField ( const vtkCachingInterpolatedVelocityField & ) = delete ; void operator = ( const vtkCachingInterpolatedVelocityField & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ---------------------------------------------------------------------------
## /////////////////////////////////////////////////////////////////////////////
##  IVFDataSetInfo
## /////////////////////////////////////////////////////////////////////////////

when not defined(DOXYGEN_SHOULD_SKIP_THIS):
  type
    VTK_DEPRECATED_IN_9_2_0VTK_DEPRECATED_IN_9_2_0IVFDataSetInfo* {.importcpp: "VTK_DEPRECATED_IN_9_2_0::VTK_DEPRECATED_IN_9_2_0::IVFDataSetInfo",
        header: "vtkCachingInterpolatedVelocityField.h", bycopy.} = object
      DataSet* {.importc: "DataSet".}: vtkSmartPointer[vtkDataSet]
      BSPTree* {.importc: "BSPTree".}: vtkSmartPointer[
          VTK_DEPRECATED_IN_9_2_0vtkAbstractCellLocator]
      Cell* {.importc: "Cell".}: vtkSmartPointer[
          VTK_DEPRECATED_IN_9_2_0vtkGenericCell]
      PCoords* {.importc: "PCoords".}: array[3, cdouble]
      VelocityFloat* {.importc: "VelocityFloat".}: ptr cfloat
      VelocityDouble* {.importc: "VelocityDouble".}: ptr cdouble
      Tolerance* {.importc: "Tolerance".}: cdouble
      StaticDataSet* {.importc: "StaticDataSet".}: bool

  proc constructVTK_DEPRECATED_IN_9_2_0VTK_DEPRECATED_IN_9_2_0IVFDataSetInfo*(): VTK_DEPRECATED_IN_9_2_0VTK_DEPRECATED_IN_9_2_0IVFDataSetInfo {.
      constructor, importcpp: "VTK_DEPRECATED_IN_9_2_0::VTK_DEPRECATED_IN_9_2_0::IVFDataSetInfo(@)",
      header: "vtkCachingInterpolatedVelocityField.h".}
  proc constructVTK_DEPRECATED_IN_9_2_0VTK_DEPRECATED_IN_9_2_0IVFDataSetInfo*(
      ivfci: VTK_DEPRECATED_IN_9_2_0VTK_DEPRECATED_IN_9_2_0IVFDataSetInfo): VTK_DEPRECATED_IN_9_2_0VTK_DEPRECATED_IN_9_2_0IVFDataSetInfo {.
      constructor, importcpp: "VTK_DEPRECATED_IN_9_2_0::VTK_DEPRECATED_IN_9_2_0::IVFDataSetInfo(@)",
      header: "vtkCachingInterpolatedVelocityField.h".}
  proc SetDataSet*(this: var VTK_DEPRECATED_IN_9_2_0VTK_DEPRECATED_IN_9_2_0IVFDataSetInfo;
                  data: ptr vtkDataSet; velocity: cstring; staticdataset: bool;
                  locator: ptr VTK_DEPRECATED_IN_9_2_0vtkAbstractCellLocator) {.
      importcpp: "SetDataSet", header: "vtkCachingInterpolatedVelocityField.h".}
##  VTK-HeaderTest-Exclude: vtkCachingInterpolatedVelocityField.h
