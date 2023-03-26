## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageExtractComponents.h
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
##  @class   vtkImageExtractComponents
##  @brief   Outputs a single component
##
##  vtkImageExtractComponents takes an input with any number of components
##  and outputs some of them.  It does involve a copy of the data.
##
##  @sa
##  vtkImageAppendComponents
##

## !!!Ignored construct:  # vtkImageExtractComponents_h [NewLine] # vtkImageExtractComponents_h [NewLine] # vtkImagingCoreModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGCORE_EXPORT vtkImageExtractComponents : public vtkThreadedImageAlgorithm { public : static vtkImageExtractComponents * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageExtractComponents :: IsTypeOf ( type ) ; } static vtkImageExtractComponents * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageExtractComponents * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageExtractComponents * NewInstance ( ) const { return vtkImageExtractComponents :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageExtractComponents :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageExtractComponents :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the components to extract.
##  void SetComponents ( int c1 ) ; void SetComponents ( int c1 , int c2 ) ; void SetComponents ( int c1 , int c2 , int c3 ) ; virtual int * GetComponents ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Components  pointer  << this -> Components ) ; return this -> Components ; } VTK_WRAPEXCLUDE virtual void GetComponents ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> Components [ 0 ] ; _arg2 = this -> Components [ 1 ] ; _arg3 = this -> Components [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Components  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetComponents ( int _arg [ 3 ] ) { this -> GetComponents ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Get the number of components to extract. This is set implicitly by the
##  SetComponents() method.
##  virtual int GetNumberOfComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComponents  of  << this -> NumberOfComponents ) ; return this -> NumberOfComponents ; } ; /@} protected : vtkImageExtractComponents ( ) ; ~ vtkImageExtractComponents ( ) override = default ; int NumberOfComponents ; int Components [ 3 ] ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedExecute ( vtkImageData * inData , vtkImageData * outData , int ext [ 6 ] , int id ) override ; private : vtkImageExtractComponents ( const vtkImageExtractComponents & ) = delete ; void operator = ( const vtkImageExtractComponents & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
