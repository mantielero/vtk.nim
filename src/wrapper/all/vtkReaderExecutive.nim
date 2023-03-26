## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkReaderExecutive.h
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
##  @class   vtkReaderExecutive
##  @brief   Executive that works with vtkReaderAlgorithm and subclasses.
##
##  @deprecated VTK 9.1.0. This is no longer needed. vtkReaderAlgorithm can now
##  work with standard executive and hence this can be removed. Follows docs are
##  no longer relevant and left for historical reasons.
##
##  vtkReaderExecutive is an executive that supports simplified API readers
##  that are written by subclassing from the vtkReaderAlgorithm hierarchy.
##  Currently, its main functionality is to call the basic reader API instead
##  if the standard ProcessRequest() method that other algorithms use.
##  In time, this is likely to add functionality such as caching. See
##  vtkReaderAlgorithm for the API.
##
##  Note that this executive assumes that the reader has one output port.
##

## !!!Ignored construct:  # vtkReaderExecutive_h [NewLine] # vtkReaderExecutive_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkDeprecation.h  for deprecation macros # vtkStreamingDemandDrivenPipeline.h [NewLine] VTK_DEPRECATED_IN_9_1_0 ( no longer needed ) class VTKCOMMONEXECUTIONMODEL_EXPORT vtkReaderExecutive : public vtkStreamingDemandDrivenPipeline { public : static vtkReaderExecutive * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStreamingDemandDrivenPipeline Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStreamingDemandDrivenPipeline :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkReaderExecutive :: IsTypeOf ( type ) ; } static vtkReaderExecutive * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkReaderExecutive * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkReaderExecutive * NewInstance ( ) const { return vtkReaderExecutive :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStreamingDemandDrivenPipeline :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkReaderExecutive :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkReaderExecutive :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkReaderExecutive ( ) ; ~ vtkReaderExecutive ( ) override ; private : vtkReaderExecutive ( const vtkReaderExecutive & ) = delete ; void operator = ( const vtkReaderExecutive & ) = delete ; } ;
## Error: expected ';'!!!
