## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransformFilter.h
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
##  @class vtkmPointTransform
##  @brief transform points via vtkm PointTransform filter
##
##  vtkmPointTransform is a filter to transform point coordinates. For now it
##  does not support transforming associated point normals and vectors, as well
##  as cell normals and vectors with the point coordinates.
##

## !!!Ignored construct:  # vtkmPointTransform_h [NewLine] # vtkmPointTransform_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class vtkHomogeneousTransform ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmPointTransform : public vtkPointSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmPointTransform :: IsTypeOf ( type ) ; } static vtkmPointTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmPointTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmPointTransform * NewInstance ( ) const { return vtkmPointTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmPointTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmPointTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmPointTransform * New ( ) ; /@{ *
##  Specify the transform object used to transform the points
##  void SetTransform ( vtkHomogeneousTransform * tf ) ; virtual vtkHomogeneousTransform * GetnameTransform ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Transform  address  << static_cast < vtkHomogeneousTransform * > ( this -> Transform ) ) ; return this -> Transform ; } ; /@} int FillInputPortInformation ( int port , vtkInformation * info ) override ; protected : vtkmPointTransform ( ) ; ~ vtkmPointTransform ( ) override ; int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkHomogeneousTransform * Transform ; private : vtkmPointTransform ( const vtkmPointTransform & ) = delete ; void operator = ( const vtkmPointTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
