## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkPComputeQuantiles.h
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
##  @class   vtkPComputeQuantiles
##  @brief   A class for parallel univariate order statistics
##
##  `vtkPComputeQuantiles` computes the quantiles of the input table in a a distributed
##  environment.
##
##  @sa vtkPComputeQuantiles
##

## !!!Ignored construct:  # vtkPComputeQuantiles_h [NewLine] # vtkPComputeQuantiles_h [NewLine] # vtkComputeQuantiles.h [NewLine] # vtkFiltersParallelStatisticsModule.h  For export macro [NewLine] class vtkOrderStatistics ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSPARALLELSTATISTICS_EXPORT vtkPComputeQuantiles : public vtkComputeQuantiles { public : static vtkPComputeQuantiles * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkComputeQuantiles Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkComputeQuantiles :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPComputeQuantiles :: IsTypeOf ( type ) ; } static vtkPComputeQuantiles * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPComputeQuantiles * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPComputeQuantiles * NewInstance ( ) const { return vtkPComputeQuantiles :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkComputeQuantiles :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPComputeQuantiles :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPComputeQuantiles :: New ( ) ; } public : ; /@{ *
##  Get/Set the multiprocess controller. If no controller is set,
##  single process is assumed.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} protected : vtkPComputeQuantiles ( ) ; ~ vtkPComputeQuantiles ( ) override ; vtkOrderStatistics * CreateOrderStatisticsFilter ( ) override ; vtkMultiProcessController * Controller = nullptr ; private : vtkPComputeQuantiles ( const vtkPComputeQuantiles & ) = delete ; void operator = ( const vtkPComputeQuantiles & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
