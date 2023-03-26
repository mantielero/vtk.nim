## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkAutoCorrelativeStatistics.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkAutoCorrelativeStatistics
##  @brief   A class for univariate auto-correlative statistics
##
##
##  Given a selection of columns of interest in an input data table, this
##  class provides the following functionalities, depending on the chosen
##  execution options:
##  * Learn: calculate sample mean and M2 aggregates for each variable w.r.t. itself
##    (cf. P. Pebay, Formulas for robust, one-pass parallel computation of covariances
##    and Arbitrary-Order Statistical Moments, Sandia Report SAND2008-6212, Sep 2008,
##    http://infoserve.sandia.gov/sand_doc/2008/086212.pdf for details)
##    for each specified time lag.
##  * Derive: calculate unbiased autocovariance matrix estimators and its determinant,
##    linear regressions, and Pearson correlation coefficient, for each specified
##    time lag.
##  * Assess: given an input data set, two means and a 2x2 covariance matrix,
##    mark each datum with corresponding relative deviation (2-dimensional Mahlanobis
##    distance).
##
##
##  @par Thanks:
##  This class was written by Philippe Pebay, Kitware SAS 2012
##

## !!!Ignored construct:  # vtkAutoCorrelativeStatistics_h [NewLine] # vtkAutoCorrelativeStatistics_h [NewLine] # vtkFiltersStatisticsModule.h  For export macro # vtkStatisticsAlgorithm.h [NewLine] class vtkMultiBlockDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkStringArray"
discard "forward decl of vtkTable"
discard "forward decl of vtkVariant"
discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKFILTERSSTATISTICS_EXPORT vtkAutoCorrelativeStatistics : public vtkStatisticsAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStatisticsAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStatisticsAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAutoCorrelativeStatistics :: IsTypeOf ( type ) ; } static vtkAutoCorrelativeStatistics * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAutoCorrelativeStatistics * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAutoCorrelativeStatistics * NewInstance ( ) const { return vtkAutoCorrelativeStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAutoCorrelativeStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAutoCorrelativeStatistics :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkAutoCorrelativeStatistics * New ( ) ; /@{ *
##  Set/get the cardinality of the data set at given time, i.e., of
##  any given time slice. It cannot be negative.
##  The input data set is assumed to have a cardinality which
##  is a multiple of this value.
##  The default is 0, meaning that the user must specify a value
##  that is consistent with the input data set.
##  virtual void SetSliceCardinality ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SliceCardinality  to  << _arg ) ; if ( this -> SliceCardinality != ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> SliceCardinality = ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetSliceCardinalityMinValue ( ) { return 0 ; } virtual vtkIdType GetSliceCardinalityMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetSliceCardinality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SliceCardinality  of  << this -> SliceCardinality ) ; return this -> SliceCardinality ; } ; /@} *
##  Given a collection of models, calculate aggregate model
##  void Aggregate ( vtkDataObjectCollection * , vtkMultiBlockDataSet * ) override ; protected : vtkAutoCorrelativeStatistics ( ) ; ~ vtkAutoCorrelativeStatistics ( ) override ; *
##  Execute the calculations required by the Learn option, given some input Data
##  NB: input parameters are unused.
##  void Learn ( vtkTable * , vtkTable * , vtkMultiBlockDataSet * ) override ; *
##  Execute the calculations required by the Derive option.
##  void Derive ( vtkMultiBlockDataSet * ) override ; *
##  Execute the calculations required by the Test option.
##  void Test ( vtkTable * , vtkMultiBlockDataSet * , vtkTable * ) override { return ; } *
##  Execute the calculations required by the Assess option.
##  void Assess ( vtkTable * inData , vtkMultiBlockDataSet * inMeta , vtkTable * outData ) override { this -> Superclass :: Assess ( inData , inMeta , outData , 1 ) ; } *
##  Calculate p-value. This will be overridden using the object factory with an
##  R implementation if R is present.
##  virtual vtkDoubleArray * CalculatePValues ( vtkDoubleArray * ) ; *
##  Provide the appropriate assessment functor.
##  void SelectAssessFunctor ( vtkTable * outData , vtkDataObject * inMeta , vtkStringArray * rowNames , AssessFunctor * & dfunc ) override ; vtkIdType SliceCardinality ; private : vtkAutoCorrelativeStatistics ( const vtkAutoCorrelativeStatistics & ) = delete ; void operator = ( const vtkAutoCorrelativeStatistics & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
