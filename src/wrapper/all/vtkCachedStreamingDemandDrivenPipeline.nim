## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCachedStreamingDemandDrivenPipeline.h
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
##  @class   vtkCachedStreamingDemandDrivenPipeline
##
##  vtkCachedStreamingDemandDrivenPipeline
##

## !!!Ignored construct:  # vtkCachedStreamingDemandDrivenPipeline_h [NewLine] # vtkCachedStreamingDemandDrivenPipeline_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkStreamingDemandDrivenPipeline.h [NewLine] class vtkInformationIntegerKey ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformationIntegerVectorKey"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkCachedStreamingDemandDrivenPipeline : public vtkStreamingDemandDrivenPipeline { public : static vtkCachedStreamingDemandDrivenPipeline * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStreamingDemandDrivenPipeline Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStreamingDemandDrivenPipeline :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCachedStreamingDemandDrivenPipeline :: IsTypeOf ( type ) ; } static vtkCachedStreamingDemandDrivenPipeline * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCachedStreamingDemandDrivenPipeline * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCachedStreamingDemandDrivenPipeline * NewInstance ( ) const { return vtkCachedStreamingDemandDrivenPipeline :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStreamingDemandDrivenPipeline :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCachedStreamingDemandDrivenPipeline :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCachedStreamingDemandDrivenPipeline :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  This is the maximum number of images that can be retained in memory.
##  it defaults to 10.
##  void SetCacheSize ( int size ) ; virtual int GetCacheSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheSize  of  << this -> CacheSize ) ; return this -> CacheSize ; } ; /@} protected : vtkCachedStreamingDemandDrivenPipeline ( ) ; ~ vtkCachedStreamingDemandDrivenPipeline ( ) override ; int NeedToExecuteData ( int outputPort , vtkInformationVector * * inInfoVec , vtkInformationVector * outInfoVec ) override ; int ExecuteData ( vtkInformation * request , vtkInformationVector * * inInfoVec , vtkInformationVector * outInfoVec ) override ; int CacheSize ; vtkDataObject * * Data ; vtkMTimeType * Times ; private : vtkCachedStreamingDemandDrivenPipeline ( const vtkCachedStreamingDemandDrivenPipeline & ) = delete ; void operator = ( const vtkCachedStreamingDemandDrivenPipeline & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
