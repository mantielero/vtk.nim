## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkSubGroup.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkSubGroup
##  @brief   scalable collective communication for a
##       subset of members of a parallel VTK application
##
##
##      This class provides scalable broadcast, reduce, etc. using
##      only a vtkMultiProcessController. It does not require MPI.
##      Users are vtkPKdTree and vtkDistributedDataFilter.
##
##  @attention
##  This class will be deprecated soon.  Instead of using this class, use the
##  collective and subgrouping operations now built into
##  vtkMultiProcessController.  The only reason this class is not deprecated
##  already is because vtkPKdTree relies heavily on this class in ways that are
##  not easy to work around.  Since vtkPKdTree is due for a major overhaul
##  anyway, we are leaving things the way they are for now.
##
##  @sa
##       vtkPKdTree vtkDistributedDataFilter
##

## !!!Ignored construct:  # vtkSubGroup_h [NewLine] # vtkSubGroup_h [NewLine] # vtkObject.h [NewLine] # vtkParallelCoreModule.h  For export macro [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCommunicator"
## !!!Ignored construct:  class VTKPARALLELCORE_EXPORT vtkSubGroup : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSubGroup :: IsTypeOf ( type ) ; } static vtkSubGroup * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSubGroup * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSubGroup * NewInstance ( ) const { return vtkSubGroup :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSubGroup :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSubGroup :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkSubGroup * New ( ) ;  The wrapper gets confused here and falls down. enum { MINOP = 1 , MAXOP = 2 , SUMOP = 3 } ; *
##  Initialize a communication subgroup for the processes
##  with rank p0 through p1 of the given communicator.  (So
##  vtkSubGroup is limited to working with subgroups that
##  are identified by a contiguous set of rank IDs.)
##  The third argument is the callers rank, which must
##  in the range from p0 through p1.
##  int Initialize ( int p0 , int p1 , int me , int tag , vtkCommunicator * c ) ; int Gather ( int * data , int * to , int length , int root ) ; int Gather ( char * data , char * to , int length , int root ) ; int Gather ( float * data , float * to , int length , int root ) ; # VTK_USE_64BIT_IDS [NewLine] int Gather ( vtkIdType * data , vtkIdType * to , int length , int root ) ; # [NewLine] int Broadcast ( float * data , int length , int root ) ; int Broadcast ( double * data , int length , int root ) ; int Broadcast ( int * data , int length , int root ) ; int Broadcast ( char * data , int length , int root ) ; # VTK_USE_64BIT_IDS [NewLine] int Broadcast ( vtkIdType * data , int length , int root ) ; # [NewLine] int ReduceSum ( int * data , int * to , int length , int root ) ; int ReduceMax ( float * data , float * to , int length , int root ) ; int ReduceMax ( double * data , double * to , int length , int root ) ; int ReduceMax ( int * data , int * to , int length , int root ) ; int ReduceMin ( float * data , float * to , int length , int root ) ; int ReduceMin ( double * data , double * to , int length , int root ) ; int ReduceMin ( int * data , int * to , int length , int root ) ; int AllReduceUniqueList ( int * list , int len , int * * newList ) ; int MergeSortedUnique ( int * list1 , int len1 , int * list2 , int len2 , int * * newList ) ; void setGatherPattern ( int root , int length ) ; int getLocalRank ( int processID ) ; int Barrier ( ) ; void PrintSubGroup ( ) const ; static int MakeSortedUnique ( int * list , int len , int * * newList ) ; int tag ; protected : vtkSubGroup ( ) ; ~ vtkSubGroup ( ) override ; private : int computeFanInTargets ( ) ; void restoreRoot ( int rootLoc ) ; void moveRoot ( int rootLoc ) ; void setUpRoot ( int root ) ; int nFrom ; int nTo ; int sendId ;  gather int sendOffset ; int sendLength ; int recvId [ 20 ] ; int recvOffset [ 20 ] ; int recvLength [ 20 ] ; int fanInFrom [ 20 ] ;  reduce, broadcast int fanInTo ; int nSend ; int nRecv ; int gatherRoot ; int gatherLength ; int * members ; int nmembers ; int myLocalRank ; vtkCommunicator * comm ; vtkSubGroup ( const vtkSubGroup & ) = delete ; void operator = ( const vtkSubGroup & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
