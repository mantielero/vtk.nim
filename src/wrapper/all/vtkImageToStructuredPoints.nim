## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageToStructuredPoints.h
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
##  @class   vtkImageToStructuredPoints
##  @brief   Attaches image pipeline to VTK.
##
##  vtkImageToStructuredPoints changes an image cache format to
##  a structured points dataset.  It takes an Input plus an optional
##  VectorInput. The VectorInput converts the RGB scalar components
##  of the VectorInput to vector pointdata attributes. This filter
##  will try to reference count the data but in some cases it must
##  make a copy.
##

## !!!Ignored construct:  # vtkImageToStructuredPoints_h [NewLine] # vtkImageToStructuredPoints_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkImageAlgorithm.h [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkStructuredPoints"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkImageToStructuredPoints : public vtkImageAlgorithm { public : static vtkImageToStructuredPoints * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageToStructuredPoints :: IsTypeOf ( type ) ; } static vtkImageToStructuredPoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageToStructuredPoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageToStructuredPoints * NewInstance ( ) const { return vtkImageToStructuredPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageToStructuredPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageToStructuredPoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the input object from the image pipeline.
##  void SetVectorInputData ( vtkImageData * input ) ; vtkImageData * GetVectorInput ( ) ; /@} *
##  Get the output of the filter.
##  vtkStructuredPoints * GetStructuredPointsOutput ( ) ; protected : vtkImageToStructuredPoints ( ) ; ~ vtkImageToStructuredPoints ( ) override ;  to translate the wholeExtent to have min 0 ( I do not like this hack). int Translate [ 3 ] ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkImageToStructuredPoints ( const vtkImageToStructuredPoints & ) = delete ; void operator = ( const vtkImageToStructuredPoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
