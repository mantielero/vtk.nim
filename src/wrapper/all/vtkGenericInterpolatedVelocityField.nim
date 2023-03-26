## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericInterpolatedVelocityField.h
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
##  @class   vtkGenericInterpolatedVelocityField
##  @brief   Interface for obtaining
##  interpolated velocity values
##
##  vtkGenericInterpolatedVelocityField acts as a continuous velocity field
##  by performing cell interpolation on the underlying vtkDataSet.
##  This is a concrete sub-class of vtkFunctionSet with
##  NumberOfIndependentVariables = 4 (x,y,z,t) and
##  NumberOfFunctions = 3 (u,v,w). Normally, every time an evaluation
##  is performed, the cell which contains the point (x,y,z) has to
##  be found by calling FindCell. This is a computationally expansive
##  operation. In certain cases, the cell search can be avoided or shortened
##  by providing a guess for the cell iterator. For example, in streamline
##  integration, the next evaluation is usually in the same or a neighbour
##  cell. For this reason, vtkGenericInterpolatedVelocityField stores the last
##  cell iterator. If caching is turned on, it uses this iterator as the
##  starting point.
##
##  @warning
##  vtkGenericInterpolatedVelocityField is not thread safe. A new instance
##  should be created by each thread.
##
##  @sa
##  vtkFunctionSet vtkGenericStreamTracer
##

## !!!Ignored construct:  # vtkGenericInterpolatedVelocityField_h [NewLine] # vtkGenericInterpolatedVelocityField_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkFunctionSet.h [NewLine] class vtkGenericDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkGenericCellIterator"
discard "forward decl of vtkGenericAdaptorCell"
discard "forward decl of vtkGenericInterpolatedVelocityFieldDataSetsType"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkGenericInterpolatedVelocityField : public vtkFunctionSet { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkFunctionSet Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkFunctionSet :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGenericInterpolatedVelocityField :: IsTypeOf ( type ) ; } static vtkGenericInterpolatedVelocityField * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGenericInterpolatedVelocityField * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGenericInterpolatedVelocityField * NewInstance ( ) const { return vtkGenericInterpolatedVelocityField :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFunctionSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericInterpolatedVelocityField :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct a vtkGenericInterpolatedVelocityField with no initial data set.
##  Caching is on. LastCellId is set to -1.
##  static vtkGenericInterpolatedVelocityField * New ( ) ; using Superclass :: FunctionValues ; *
##  Evaluate the velocity field, f, at (x, y, z, t).
##  For now, t is ignored.
##  int FunctionValues ( double * x , double * f ) override ; *
##  Add a dataset used for the implicit function evaluation.
##  If more than one dataset is added, the evaluation point is
##  searched in all until a match is found. THIS FUNCTION
##  DOES NOT CHANGE THE REFERENCE COUNT OF dataset FOR THREAD
##  SAFETY REASONS.
##  virtual void AddDataSet ( vtkGenericDataSet * dataset ) ; *
##  Set the last cell id to -1 so that the next search does not
##  start from the previous cell
##  void ClearLastCell ( ) ; *
##  Return the cell cached from last evaluation.
##  vtkGenericAdaptorCell * GetLastCell ( ) ; *
##  Returns the interpolation weights cached from last evaluation
##  if the cached cell is valid (returns 1). Otherwise, it does not
##  change w and returns 0.
##  int GetLastLocalCoordinates ( double pcoords [ 3 ] ) ; /@{ *
##  Turn caching on/off.
##  virtual vtkTypeBool GetCaching ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Caching  of  << this -> Caching ) ; return this -> Caching ; } ; virtual void SetCaching ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Caching  to  << _arg ) ; if ( this -> Caching != _arg ) { this -> Caching = _arg ; this -> Modified ( ) ; } } ; virtual void CachingOn ( ) { this -> SetCaching ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CachingOff ( ) { this -> SetCaching ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Caching statistics.
##  virtual int GetCachingCacheHit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheHit  of  << this -> CacheHit ) ; return this -> CacheHit ; } ; virtual int GetCachingCacheHitCacheMiss ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheMiss  of  << this -> CacheMiss ) ; return this -> CacheMiss ; } ; /@} /@{ *
##  If you want to work with an arbitrary vector array, then set its name
##  here. By default this in nullptr and the filter will use the active vector
##  array.
##  virtual char * GetVectorsSelection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << VectorsSelection  of  << ( this -> VectorsSelection ? this -> VectorsSelection : (null) ) ) ; return this -> VectorsSelection ; } ; void SelectVectors ( const char * fieldName ) { this -> SetVectorsSelection ( fieldName ) ; } /@} /@{ *
##  Returns the last dataset that was visited. Can be used
##  as a first guess as to where the next point will be as
##  well as to avoid searching through all datasets to get
##  more information about the point.
##  virtual vtkGenericDataSet * GetnameLastDataSet ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LastDataSet  address  << static_cast < vtkGenericDataSet * > ( this -> LastDataSet ) ) ; return this -> LastDataSet ; } ; /@} *
##  Copy the user set parameters from source. This copies
##  the Caching parameters. Sub-classes can add more after
##  chaining.
##  virtual void CopyParameters ( vtkGenericInterpolatedVelocityField * from ) ; protected : vtkGenericInterpolatedVelocityField ( ) ; ~ vtkGenericInterpolatedVelocityField ( ) override ; vtkGenericCellIterator * GenCell ;  last cell double LastPCoords [ 3 ] ;  last local coordinates int CacheHit ; int CacheMiss ; vtkTypeBool Caching ; vtkGenericDataSet * LastDataSet ; virtual void SetVectorsSelection ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VectorsSelection  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> VectorsSelection == nullptr && _arg == nullptr ) { return ; } if ( this -> VectorsSelection && _arg && ( ! strcmp ( this -> VectorsSelection , _arg ) ) ) { return ; } delete [ ] this -> VectorsSelection ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> VectorsSelection = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> VectorsSelection = nullptr ; } this -> Modified ( ) ; } ; char * VectorsSelection ; vtkGenericInterpolatedVelocityFieldDataSetsType * DataSets ; int FunctionValues ( vtkGenericDataSet * dataset , double * x , double * f ) ; static const double TOLERANCE_SCALE ; private : vtkGenericInterpolatedVelocityField ( const vtkGenericInterpolatedVelocityField & ) = delete ; void operator = ( const vtkGenericInterpolatedVelocityField & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
