## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPTextureMapToSphere.h
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
##  @class   vtkPTextureMapToSphere
##  @brief   generate texture coordinates by mapping points to sphere
##
##  vtkPTextureMapToSphere inherits from vtkTextureMapToSphere to handle multi-processing
##  environment.
##
##  @sa
##  vtkTextureMapToPlane vtkTextureMapToCylinder
##  vtkTransformTexture vtkThresholdTextureCoords
##  vtkTextureMapToSphere
##

## !!!Ignored construct:  # vtkPTextureMapToSphere_h [NewLine] # vtkPTextureMapToSphere_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkTextureMapToSphere.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkPTextureMapToSphere : public vtkTextureMapToSphere { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTextureMapToSphere Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTextureMapToSphere :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPTextureMapToSphere :: IsTypeOf ( type ) ; } static vtkPTextureMapToSphere * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPTextureMapToSphere * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPTextureMapToSphere * NewInstance ( ) const { return vtkPTextureMapToSphere :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTextureMapToSphere :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPTextureMapToSphere :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPTextureMapToSphere :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPTextureMapToSphere * New ( ) ; protected : vtkPTextureMapToSphere ( ) ; ~ vtkPTextureMapToSphere ( ) override ; void ComputeCenter ( vtkDataSet * dataSet ) override ; void SetController ( vtkMultiProcessController * ) ; vtkMultiProcessController * Controller ; private : vtkPTextureMapToSphere ( const vtkPTextureMapToSphere & ) = delete ; void operator = ( const vtkPTextureMapToSphere & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
