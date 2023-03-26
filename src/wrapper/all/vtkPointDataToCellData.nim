## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointDataToCellData.h
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
##  @class   vtkPointDataToCellData
##  @brief   map point data to cell data
##
##  vtkPointDataToCellData is a filter that transforms point data (i.e., data
##  specified per point) into cell data (i.e., data specified per cell).  By
##  default, the method of transformation is based on averaging the data
##  values of all the points defining a particular cell. Optionally (by enabling
##  CategoricalData), histograming can be used to assign the cell data. For
##  large datasets with several cell data arrays, the filter optionally
##  supports selective processing to speed up processing. Optionally, the
##  input point data can be passed through to the output as well.
##
##  @warning
##  This filter is an abstract filter, that is, the output is an abstract type
##  (i.e., vtkDataSet). Use the convenience methods (e.g.,
##  GetPolyDataOutput(), GetStructuredPointsOutput(), etc.) to get the type
##  of output you want.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkPointData vtkCellData vtkCellDataToPointData
##

## !!!Ignored construct:  # vtkPointDataToCellData_h [NewLine] # vtkPointDataToCellData_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] class VTKFILTERSCORE_EXPORT vtkPointDataToCellData : public vtkDataSetAlgorithm { public : /@{ *
##  Standard methods for instantiation, type information, and printing.
##  static vtkPointDataToCellData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointDataToCellData :: IsTypeOf ( type ) ; } static vtkPointDataToCellData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointDataToCellData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointDataToCellData * NewInstance ( ) const { return vtkPointDataToCellData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointDataToCellData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointDataToCellData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Control whether the input point data is to be passed to the output. If
##  on, then the input point data is passed through to the output; otherwise,
##  only generated cell data is placed into the output.
##  virtual void SetPassPointData ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassPointData  to  << _arg ) ; if ( this -> PassPointData != _arg ) { this -> PassPointData = _arg ; this -> Modified ( ) ; } } ; virtual bool GetPassPointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPointData  of  << this -> PassPointData ) ; return this -> PassPointData ; } ; virtual void PassPointDataOn ( ) { this -> SetPassPointData ( static_cast < bool > ( 1 ) ) ; } virtual void PassPointDataOff ( ) { this -> SetPassPointData ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Control whether the input point data is to be treated as categorical. If
##  the data is categorical, then the resultant cell data will be determined
##  by a "majority rules" vote (using a histogram of the point data scalar
##  values), with ties going to the smaller point data value.
##  virtual void SetPassPointDataCategoricalData ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CategoricalData  to  << _arg ) ; if ( this -> CategoricalData != _arg ) { this -> CategoricalData = _arg ; this -> Modified ( ) ; } } ; virtual bool GetPassPointDataCategoricalData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CategoricalData  of  << this -> CategoricalData ) ; return this -> CategoricalData ; } ; virtual void CategoricalDataOn ( ) { this -> SetPassPointDataCategoricalData ( static_cast < bool > ( 1 ) ) ; } virtual void CategoricalDataOff ( ) { this -> SetPassPointDataCategoricalData ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Activate selective processing of arrays. If inactive, only arrays selected
##  by the user will be considered by this filter. The default is true.
##  virtual void SetPassPointDataCategoricalDataProcessAllArrays ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProcessAllArrays  to  << _arg ) ; if ( this -> ProcessAllArrays != _arg ) { this -> ProcessAllArrays = _arg ; this -> Modified ( ) ; } } ; virtual bool GetPassPointDataCategoricalDataProcessAllArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProcessAllArrays  of  << this -> ProcessAllArrays ) ; return this -> ProcessAllArrays ; } ; virtual void ProcessAllArraysOn ( ) { this -> SetPassPointDataCategoricalDataProcessAllArrays ( static_cast < bool > ( 1 ) ) ; } virtual void ProcessAllArraysOff ( ) { this -> SetPassPointDataCategoricalDataProcessAllArrays ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Adds an array to be processed. This only has an effect if the
##  ProcessAllArrays option is turned off. If a name is already present,
##  nothing happens.
##  virtual void AddPointDataArray ( const char * name ) ; *
##  Removes an array to be processed. This only has an effect if the
##  ProcessAllArrays option is turned off. If the specified name is not
##  present, nothing happens.
##  virtual void RemovePointDataArray ( const char * name ) ; *
##  Removes all arrays to be processed from the list. This only has an effect
##  if the ProcessAllArrays option is turned off.
##  virtual void ClearPointDataArrays ( ) ; protected : vtkPointDataToCellData ( ) ; ~ vtkPointDataToCellData ( ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; bool PassPointData ; bool CategoricalData ; bool ProcessAllArrays ; class Internals ; Internals * Implementation ; private : vtkPointDataToCellData ( const vtkPointDataToCellData & ) = delete ; void operator = ( const vtkPointDataToCellData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
