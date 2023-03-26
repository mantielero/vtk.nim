## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPDescriptiveStatistics.h
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
##  @class   vtkPDescriptiveStatistics
##  @brief   A class for parallel univariate descriptive statistics
##
##  vtkPDescriptiveStatistics is vtkDescriptiveStatistics subclass for parallel datasets.
##  It learns and derives the global statistical model on each node, but assesses each
##  individual data points on the node that owns it.
##
##  @note Kurtosis formula in "Formulas for robust, one-pass parallel computation
##  of covariances and Arbitrary-Order Statistical Moments", P. Pébay, 2008,  has an error
##  (equation 1.6 in the paper). A correct formula can be found in
##  "Formulas for the Computation of Higher-
##  Order Central Moments", P. Pébay, T.B. Terriberry, H. Kolla, J. Bennett, 2016, at equation 3.6.
##  The latter one is being used to compute the 4th moment from partial ones across ranks.
##
##  @par Thanks:
##  Thanks to Philippe Pebay from Sandia National Laboratories for implementing this class.
##

## !!!Ignored construct:  # vtkPDescriptiveStatistics_h [NewLine] # vtkPDescriptiveStatistics_h [NewLine] # vtkDescriptiveStatistics.h [NewLine] # vtkFiltersParallelStatisticsModule.h  For export macro [NewLine] class vtkMultiBlockDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSPARALLELSTATISTICS_EXPORT vtkPDescriptiveStatistics : public vtkDescriptiveStatistics { public : static vtkPDescriptiveStatistics * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDescriptiveStatistics Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDescriptiveStatistics :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPDescriptiveStatistics :: IsTypeOf ( type ) ; } static vtkPDescriptiveStatistics * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPDescriptiveStatistics * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPDescriptiveStatistics * NewInstance ( ) const { return vtkPDescriptiveStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDescriptiveStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPDescriptiveStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPDescriptiveStatistics :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the multiprocess controller. If no controller is set,
##  single process is assumed.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} *
##  Execute the parallel calculations required by the Learn option.
##  void Learn ( vtkTable * inData , vtkTable * inParameters , vtkMultiBlockDataSet * outMeta ) override ; protected : vtkPDescriptiveStatistics ( ) ; ~ vtkPDescriptiveStatistics ( ) override ; vtkMultiProcessController * Controller ; private : vtkPDescriptiveStatistics ( const vtkPDescriptiveStatistics & ) = delete ; void operator = ( const vtkPDescriptiveStatistics & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
