## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkOrderStatistics.h
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
## -------------------------------------------------------------------------
##   Copyright 2011 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##   -------------------------------------------------------------------------
## *
##  @class   vtkOrderStatistics
##  @brief   A class for univariate order statistics
##
##
##  Given a selection of columns of interest in an input data table, this
##  class provides the following functionalities, depending on the
##  execution mode it is executed in:
##  * Learn: calculate histogram.
##  * Derive: calculate PDFs and arbitrary quantiles. Provide specific names when 5-point
##    statistics (minimum, 1st quartile, median, third quartile, maximum) requested.
##  * Assess: given an input data set and a set of q-quantiles, label each datum
##    either with the quantile interval to which it belongs, or 0 if it is smaller
##    than smaller quantile, or q if it is larger than largest quantile.
##  * Test: calculate Kolmogorov-Smirnov goodness-of-fit statistic between CDF based on
##    model quantiles, and empirical CDF
##
##  @par Thanks:
##  Thanks to Philippe Pebay and David Thompson from Sandia National Laboratories
##  for implementing this class.
##  Updated by Philippe Pebay, Kitware SAS 2012
##

## !!!Ignored construct:  # vtkOrderStatistics_h [NewLine] # vtkOrderStatistics_h [NewLine] # vtkFiltersStatisticsModule.h  For export macro # vtkStatisticsAlgorithm.h [NewLine] class vtkMultiBlockDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkStringArray"
discard "forward decl of vtkTable"
discard "forward decl of vtkVariant"
## !!!Ignored construct:  class VTKFILTERSSTATISTICS_EXPORT vtkOrderStatistics : public vtkStatisticsAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStatisticsAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStatisticsAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOrderStatistics :: IsTypeOf ( type ) ; } static vtkOrderStatistics * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOrderStatistics * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOrderStatistics * NewInstance ( ) const { return vtkOrderStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOrderStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOrderStatistics :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkOrderStatistics * New ( ) ; *
##  The type of quantile definition.
##  enum QuantileDefinitionType { InverseCDF = 0 ,  Identical to method 1 of R InverseCDFAveragedSteps = 1 ,  Identical to method 2 of R, ignored for non-numeric types NearestObservation = 2  Identical to method 3 of R } ; /@{ *
##  Set/Get the number of quantiles (with uniform spacing).
##  virtual void SetNumberOfIntervals ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfIntervals  to  << _arg ) ; if ( this -> NumberOfIntervals != _arg ) { this -> NumberOfIntervals = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetNumberOfIntervals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIntervals  of  << this -> NumberOfIntervals ) ; return this -> NumberOfIntervals ; } ; /@} /@{ *
##  Set the quantile definition.
##  virtual void SetNumberOfIntervalsQuantileDefinition ( QuantileDefinitionType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  QuantileDefinition  to  << _arg ) ; if ( this -> QuantileDefinition != _arg ) { this -> QuantileDefinition = _arg ; this -> Modified ( ) ; } } ; void SetQuantileDefinition ( int ) ; /@} /@{ *
##  Set/Get whether quantization will be allowed to enforce maximum histogram size.
##  virtual void SetNumberOfIntervalsQuantileDefinitionQuantize ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Quantize  to  << _arg ) ; if ( this -> Quantize != _arg ) { this -> Quantize = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNumberOfIntervalsQuantize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Quantize  of  << this -> Quantize ) ; return this -> Quantize ; } ; /@} /@{ *
##  Set/Get the maximum histogram size.
##  This maximum size is enforced only when Quantize is TRUE.
##  virtual void SetNumberOfIntervalsQuantileDefinitionQuantizeMaximumHistogramSize ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumHistogramSize  to  << _arg ) ; if ( this -> MaximumHistogramSize != _arg ) { this -> MaximumHistogramSize = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetNumberOfIntervalsQuantizeMaximumHistogramSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumHistogramSize  of  << this -> MaximumHistogramSize ) ; return this -> MaximumHistogramSize ; } ; /@} *
##  Get the quantile definition.
##  vtkIdType GetQuantileDefinition ( ) { return static_cast < vtkIdType > ( this -> QuantileDefinition ) ; } *
##  A convenience method (in particular for access from other applications) to
##  set parameter values.
##  Return true if setting of requested parameter name was executed, false otherwise.
##  bool SetParameter ( const char * parameter , int index , vtkVariant value ) override ; *
##  Given a collection of models, calculate aggregate model
##  NB: not implemented
##  void Aggregate ( vtkDataObjectCollection * , vtkMultiBlockDataSet * ) override { return ; } /@{ *
##  If there is a ghost array in the input, then ghosts matching `GhostsToSkip` mask
##  will be skipped. It is set to 0xff by default (every ghosts types are skipped).
##
##  @sa
##  vtkDataSetAttributes
##  vtkFieldData
##  vtkPointData
##  vtkCellData
##  virtual void SetNumberOfIntervalsQuantileDefinitionQuantizeMaximumHistogramSizeGhostsToSkip ( unsigned char _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GhostsToSkip  to  << _arg ) ; if ( this -> GhostsToSkip != _arg ) { this -> GhostsToSkip = _arg ; this -> Modified ( ) ; } } ; virtual unsigned char GetNumberOfIntervalsQuantizeMaximumHistogramSizeGhostsToSkip ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostsToSkip  of  << this -> GhostsToSkip ) ; return this -> GhostsToSkip ; } ; /@} protected : vtkOrderStatistics ( ) ; ~ vtkOrderStatistics ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Execute the calculations required by the Learn option.
##  void Learn ( vtkTable * , vtkTable * , vtkMultiBlockDataSet * ) override ; *
##  Execute the calculations required by the Derive option.
##  void Derive ( vtkMultiBlockDataSet * ) override ; *
##  Execute the calculations required by the Test option.
##  void Test ( vtkTable * , vtkMultiBlockDataSet * , vtkTable * ) override ; *
##  Execute the calculations required by the Assess option.
##  void Assess ( vtkTable * inData , vtkMultiBlockDataSet * inMeta , vtkTable * outData ) override { this -> Superclass :: Assess ( inData , inMeta , outData , 1 ) ; } *
##  Provide the appropriate assessment functor.
##  void SelectAssessFunctor ( vtkTable * outData , vtkDataObject * inMeta , vtkStringArray * rowNames , AssessFunctor * & dfunc ) override ; vtkIdType NumberOfIntervals ; QuantileDefinitionType QuantileDefinition ; bool Quantize ; vtkIdType MaximumHistogramSize ; vtkIdType NumberOfGhosts ; unsigned char GhostsToSkip ; private : vtkOrderStatistics ( const vtkOrderStatistics & ) = delete ; void operator = ( const vtkOrderStatistics & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
