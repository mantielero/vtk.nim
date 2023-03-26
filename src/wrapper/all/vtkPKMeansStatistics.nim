## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPKMeansStatistics.h
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
##  @class   vtkPKMeansStatisitcs
##  @brief   A class for parallel k means clustering
##
##  vtkPKMeansStatistics is vtkKMeansStatistics subclass for parallel datasets.
##  It learns and derives the global statistical model on each node, but assesses each
##  individual data points on the node that owns it.
##
##  @par Thanks:
##  Thanks to Janine Bennett, Philippe Pebay and David Thompson from Sandia National Laboratories for
##  implementing this class.
##

## !!!Ignored construct:  # vtkPKMeansStatistics_h [NewLine] # vtkPKMeansStatistics_h [NewLine] # vtkFiltersParallelStatisticsModule.h  For export macro # vtkKMeansStatistics.h [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCommunicator"
## !!!Ignored construct:  class VTKFILTERSPARALLELSTATISTICS_EXPORT vtkPKMeansStatistics : public vtkKMeansStatistics { public : static vtkPKMeansStatistics * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkKMeansStatistics Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkKMeansStatistics :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPKMeansStatistics :: IsTypeOf ( type ) ; } static vtkPKMeansStatistics * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPKMeansStatistics * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPKMeansStatistics * NewInstance ( ) const { return vtkPKMeansStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkKMeansStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPKMeansStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPKMeansStatistics :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the multiprocess controller. If no controller is set,
##  single process is assumed.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} *
##  Subroutine to update new cluster centers from the old centers.
##  void UpdateClusterCenters ( vtkTable * newClusterElements , vtkTable * curClusterElements , vtkIdTypeArray * numMembershipChanges , vtkIdTypeArray * numElementsInCluster , vtkDoubleArray * error , vtkIdTypeArray * startRunID , vtkIdTypeArray * endRunID , vtkIntArray * computeRun ) override ; *
##  Subroutine to get the total number of data objects.
##  vtkIdType GetTotalNumberOfObservations ( vtkIdType numObservations ) override ; *
##  Subroutine to initialize cluster centerss if not provided by the user.
##  void CreateInitialClusterCenters ( vtkIdType numToAllocate , vtkIdTypeArray * numberOfClusters , vtkTable * inData , vtkTable * curClusterElements , vtkTable * newClusterElements ) override ; protected : vtkPKMeansStatistics ( ) ; ~ vtkPKMeansStatistics ( ) override ; vtkMultiProcessController * Controller ; private : vtkPKMeansStatistics ( const vtkPKMeansStatistics & ) = delete ; void operator = ( const vtkPKMeansStatistics & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
