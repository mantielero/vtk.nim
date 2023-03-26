## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPResampleToImage.h
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
##  @class   vtkPResampleToImage
##  @brief   sample dataset on a uniform grid in parallel
##
##  vtkPResampleToImage is a parallel filter that resamples the input dataset on
##  a uniform grid. It internally uses vtkProbeFilter to do the probing.
##  @sa
##  vtkResampleToImage vtkProbeFilter
##

## !!!Ignored construct:  # vtkPResampleToImage_h [NewLine] # vtkPResampleToImage_h [NewLine] # vtkFiltersParallelDIY2Module.h  For export macro # vtkResampleToImage.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImageData"
discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSPARALLELDIY2_EXPORT vtkPResampleToImage : public vtkResampleToImage { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkResampleToImage Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkResampleToImage :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPResampleToImage :: IsTypeOf ( type ) ; } static vtkPResampleToImage * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPResampleToImage * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPResampleToImage * NewInstance ( ) const { return vtkPResampleToImage :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkResampleToImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPResampleToImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPResampleToImage :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPResampleToImage * New ( ) ; /@{ *
##  By default this filter uses the global controller,
##  but this method can be used to set another instead.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} protected : vtkPResampleToImage ( ) ; ~ vtkPResampleToImage ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkMultiProcessController * Controller ; private : vtkPResampleToImage ( const vtkPResampleToImage & ) = delete ; void operator = ( const vtkPResampleToImage & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
