## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMappedUnstructuredGridGenerator.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyrgight notice for more information.
##
## =========================================================================
## *
##  @class   vtkMappedUnstructuredGridGenerator
##  @brief   A generator for mapped unstructured grids for testing
##
##  Provides a static GenerateMappedUnstructuredGrid() method to
##  generate a mapped unstructured grid.
##

import
  vtkObject, vtkTestingDataModelModule

## !!!Ignored construct:  # vtkMappedUnstructuredGridGenerator_h [NewLine] # vtkMappedUnstructuredGridGenerator_h [NewLine] class vtkUnstructuredGridBase ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnstructuredGrid"
## !!!Ignored construct:  class VTKTESTINGDATAMODEL_EXPORT vtkMappedUnstructuredGridGenerator : public vtkObject { public : *
##  Standard object factory instantiation method.
##  static vtkMappedUnstructuredGridGenerator * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMappedUnstructuredGridGenerator :: IsTypeOf ( type ) ; } static vtkMappedUnstructuredGridGenerator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMappedUnstructuredGridGenerator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMappedUnstructuredGridGenerator * NewInstance ( ) const { return vtkMappedUnstructuredGridGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMappedUnstructuredGridGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMappedUnstructuredGridGenerator :: New ( ) ; } public : ; *
##  Generate a mapped unstructured grid. The user is responsible
##  for deleting the generated grid after use.
##  static void GenerateMappedUnstructuredGrid ( vtkUnstructuredGridBase * * grid ) ; *
##  Generate an unstructured grid. The user is responsible
##  for deleting the generated grid after use.
##  static void GenerateUnstructuredGrid ( vtkUnstructuredGrid * * grid ) ; protected : vtkMappedUnstructuredGridGenerator ( ) { } vtkMappedUnstructuredGridGenerator ( const vtkMappedUnstructuredGridGenerator & ) = delete ; void operator = ( const vtkMappedUnstructuredGridGenerator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
