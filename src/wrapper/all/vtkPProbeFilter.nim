## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPProbeFilter.h
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
##  @class   vtkPProbeFilter
##  @brief   probe dataset in parallel
##
##  This filter works correctly only if the whole geometry dataset
##  (that specify the point locations used to probe input) is available on all
##  nodes.
##

## !!!Ignored construct:  # vtkPProbeFilter_h [NewLine] # vtkPProbeFilter_h [NewLine] # vtkCompositeDataProbeFilter.h [NewLine] # vtkFiltersParallelModule.h  For export macro [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkPProbeFilter : public vtkCompositeDataProbeFilter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCompositeDataProbeFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCompositeDataProbeFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPProbeFilter :: IsTypeOf ( type ) ; } static vtkPProbeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPProbeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPProbeFilter * NewInstance ( ) const { return vtkPProbeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositeDataProbeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPProbeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPProbeFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPProbeFilter * New ( ) ; /@{ *
##  Set and get the controller.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} protected : vtkPProbeFilter ( ) ; ~ vtkPProbeFilter ( ) override ; enum { PROBE_COMMUNICATION_TAG = 1970 } ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkMultiProcessController * Controller ; private : vtkPProbeFilter ( const vtkPProbeFilter & ) = delete ; void operator = ( const vtkPProbeFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
