## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPAutoCorrelativeStatistics.h
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
##  @class   vtkPAutoCorrelativeStatistics
##  @brief   A class for parallel auto-correlative statistics
##
##  vtkPAutoCorrelativeStatistics is vtkAutoCorrelativeStatistics subclass for parallel datasets.
##  It learns and derives the global statistical model on each node, but assesses each
##  individual data points on the node that owns it.
##
##  @par Thanks:
##  This class was written by Philippe Pebay, Kitware SAS 2012.
##

## !!!Ignored construct:  # vtkPAutoCorrelativeStatistics_h [NewLine] # vtkPAutoCorrelativeStatistics_h [NewLine] # vtkAutoCorrelativeStatistics.h [NewLine] # vtkFiltersParallelStatisticsModule.h  For export macro [NewLine] class vtkMultiBlockDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSPARALLELSTATISTICS_EXPORT vtkPAutoCorrelativeStatistics : public vtkAutoCorrelativeStatistics { public : static vtkPAutoCorrelativeStatistics * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAutoCorrelativeStatistics Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAutoCorrelativeStatistics :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPAutoCorrelativeStatistics :: IsTypeOf ( type ) ; } static vtkPAutoCorrelativeStatistics * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPAutoCorrelativeStatistics * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPAutoCorrelativeStatistics * NewInstance ( ) const { return vtkPAutoCorrelativeStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAutoCorrelativeStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPAutoCorrelativeStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPAutoCorrelativeStatistics :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the multiprocess controller. If no controller is set,
##  single process is assumed.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} *
##  Execute the parallel calculations required by the Learn option.
##  void Learn ( vtkTable * inData , vtkTable * inParameters , vtkMultiBlockDataSet * outMeta ) override ; *
##  Execute the calculations required by the Test option.
##  NB: Not implemented for more than 1 processor
##  void Test ( vtkTable * , vtkMultiBlockDataSet * , vtkTable * ) override ; protected : vtkPAutoCorrelativeStatistics ( ) ; ~ vtkPAutoCorrelativeStatistics ( ) override ; vtkMultiProcessController * Controller ; private : vtkPAutoCorrelativeStatistics ( const vtkPAutoCorrelativeStatistics & ) = delete ; void operator = ( const vtkPAutoCorrelativeStatistics & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
