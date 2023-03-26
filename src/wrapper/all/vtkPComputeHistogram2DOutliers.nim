## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPComputeHistogram2DOutliers.h
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
##   Copyright 2009 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkPComputeHistogram2DOutliers
##  @brief   extract outlier rows from
##   a vtkTable based on input 2D histograms, in parallel.
##
##
##   This class does exactly the same this as vtkComputeHistogram2DOutliers,
##   but does it in a multi-process environment.  After each node
##   computes their own local outliers, class does an AllGather
##   that distributes the outliers to every node.  This could probably just
##   be a Gather onto the root node instead.
##
##   After this operation, the row selection will only contain local row ids,
##   since I'm not sure how to deal with distributed ids.
##
##  @sa
##   vtkComputeHistogram2DOutliers
##
##  @par Thanks:
##   Developed by David Feng at Sandia National Laboratories
## ------------------------------------------------------------------------------
##

## !!!Ignored construct:  # vtkPComputeHistogram2DOutliers_h [NewLine] # vtkPComputeHistogram2DOutliers_h [NewLine] ------------------------------------------------------------------------------ # vtkComputeHistogram2DOutliers.h [NewLine] # vtkFiltersParallelImagingModule.h  For export macro ------------------------------------------------------------------------------ class vtkMultiProcessController ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] ------------------------------------------------------------------------------ class VTKFILTERSPARALLELIMAGING_EXPORT vtkPComputeHistogram2DOutliers : public vtkComputeHistogram2DOutliers { public : static vtkPComputeHistogram2DOutliers * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkComputeHistogram2DOutliers Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkComputeHistogram2DOutliers :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPComputeHistogram2DOutliers :: IsTypeOf ( type ) ; } static vtkPComputeHistogram2DOutliers * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPComputeHistogram2DOutliers * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPComputeHistogram2DOutliers * NewInstance ( ) const { return vtkPComputeHistogram2DOutliers :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkComputeHistogram2DOutliers :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPComputeHistogram2DOutliers :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPComputeHistogram2DOutliers :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; protected : vtkPComputeHistogram2DOutliers ( ) ; ~ vtkPComputeHistogram2DOutliers ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkMultiProcessController * Controller ; private : vtkPComputeHistogram2DOutliers ( const vtkPComputeHistogram2DOutliers & ) = delete ; void operator = ( const vtkPComputeHistogram2DOutliers & ) = delete ; } ;
## Error: did not expect [NewLine]!!!
