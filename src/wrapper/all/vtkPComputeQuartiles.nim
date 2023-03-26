## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkPComputeQuartiles.h
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
##  @class   vtkPComputeQuartiles
##  @brief   A class for parallel univariate order statistics
##
##  `vtkPComputeQuartiles` computes the quartiles of the input table in a a distributed
##  environment.
##
##  @sa vtkPComputeQuartiles
##

## !!!Ignored construct:  # vtkPComputeQuartiles_h [NewLine] # vtkPComputeQuartiles_h [NewLine] # vtkComputeQuartiles.h [NewLine] # vtkFiltersParallelStatisticsModule.h  For export macro [NewLine] class vtkOrderStatistics ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSPARALLELSTATISTICS_EXPORT vtkPComputeQuartiles : public vtkComputeQuartiles { public : static vtkPComputeQuartiles * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkComputeQuartiles Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkComputeQuartiles :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPComputeQuartiles :: IsTypeOf ( type ) ; } static vtkPComputeQuartiles * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPComputeQuartiles * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPComputeQuartiles * NewInstance ( ) const { return vtkPComputeQuartiles :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkComputeQuartiles :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPComputeQuartiles :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPComputeQuartiles :: New ( ) ; } public : ; /@{ *
##  Get/Set the multiprocess controller. If no controller is set,
##  single process is assumed.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} protected : vtkPComputeQuartiles ( ) ; ~ vtkPComputeQuartiles ( ) override ; vtkOrderStatistics * CreateOrderStatisticsFilter ( ) override ; vtkMultiProcessController * Controller ; private : vtkPComputeQuartiles ( const vtkPComputeQuartiles & ) = delete ; void operator = ( const vtkPComputeQuartiles & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
