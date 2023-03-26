## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSubdivideTetra.h
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
##  @class   vtkSubdivideTetra
##  @brief   subdivide one tetrahedron into twelve for every tetra
##
##  This filter subdivides tetrahedra in an unstructured grid into twelve tetrahedra.
##

## !!!Ignored construct:  # vtkSubdivideTetra_h [NewLine] # vtkSubdivideTetra_h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class VTKFILTERSMODELING_EXPORT vtkSubdivideTetra : public vtkUnstructuredGridAlgorithm { public : static vtkSubdivideTetra * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSubdivideTetra :: IsTypeOf ( type ) ; } static vtkSubdivideTetra * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSubdivideTetra * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSubdivideTetra * NewInstance ( ) const { return vtkSubdivideTetra :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSubdivideTetra :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSubdivideTetra :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkSubdivideTetra ( ) ; ~ vtkSubdivideTetra ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkSubdivideTetra ( const vtkSubdivideTetra & ) = delete ; void operator = ( const vtkSubdivideTetra & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
