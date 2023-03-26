## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPCorrelativeStatistics.h
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
## -------------------------------------------------------------------------
##   Copyright 2011 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##   -------------------------------------------------------------------------
## *
##  @class   vtkPCorrelativeStatistics
##  @brief   A class for parallel bivariate correlative statistics
##
##  vtkPCorrelativeStatistics is vtkCorrelativeStatistics subclass for parallel datasets.
##  It learns and derives the global statistical model on each node, but assesses each
##  individual data points on the node that owns it.
##
##  @par Thanks:
##  Thanks to Philippe Pebay from Sandia National Laboratories for implementing this class.
##

## !!!Ignored construct:  # vtkPCorrelativeStatistics_h [NewLine] # vtkPCorrelativeStatistics_h [NewLine] # vtkCorrelativeStatistics.h [NewLine] # vtkFiltersParallelStatisticsModule.h  For export macro [NewLine] class vtkMultiBlockDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSPARALLELSTATISTICS_EXPORT vtkPCorrelativeStatistics : public vtkCorrelativeStatistics { public : static vtkPCorrelativeStatistics * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCorrelativeStatistics Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCorrelativeStatistics :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPCorrelativeStatistics :: IsTypeOf ( type ) ; } static vtkPCorrelativeStatistics * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPCorrelativeStatistics * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPCorrelativeStatistics * NewInstance ( ) const { return vtkPCorrelativeStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCorrelativeStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPCorrelativeStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPCorrelativeStatistics :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the multiprocess controller. If no controller is set,
##  single process is assumed.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} *
##  Execute the parallel calculations required by the Learn option.
##  void Learn ( vtkTable * inData , vtkTable * inParameters , vtkMultiBlockDataSet * outMeta ) override ; *
##  Execute the calculations required by the Test option.
##  NB: Not implemented for more than 1 processor
##  void Test ( vtkTable * , vtkMultiBlockDataSet * , vtkTable * ) override ; protected : vtkPCorrelativeStatistics ( ) ; ~ vtkPCorrelativeStatistics ( ) override ; vtkMultiProcessController * Controller ; private : vtkPCorrelativeStatistics ( const vtkPCorrelativeStatistics & ) = delete ; void operator = ( const vtkPCorrelativeStatistics & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
