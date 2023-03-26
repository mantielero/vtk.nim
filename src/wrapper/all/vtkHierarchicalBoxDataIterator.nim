## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkHierarchicalBoxDataIterator.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkHierarchicalBoxDataIterator
##  @brief   Empty class for backwards compatibility.
##
##  @deprecated vtkHierarchicalBoxDataIterator is deprecated in VTK 9.2 and will be removed.
##  Use `vtkUniformGridAMRDataIterator` instead of `vtkHierarchicalBoxDataIterator`.
##

## !!!Ignored construct:  # vtkHierarchicalBoxDataIterator_h [NewLine] # vtkHierarchicalBoxDataIterator_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkUniformGridAMRDataIterator.h [NewLine] class VTK_DEPRECATED_IN_9_2_0 ( Use vtkUniformGridAMRDataIterator instead of vtkHierarchicalBoxDataIterator ) vtkHierarchicalBoxDataIterator : public vtkUniformGridAMRDataIterator { public : static vtkHierarchicalBoxDataIterator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUniformGridAMRDataIterator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUniformGridAMRDataIterator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHierarchicalBoxDataIterator :: IsTypeOf ( type ) ; } static vtkHierarchicalBoxDataIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHierarchicalBoxDataIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHierarchicalBoxDataIterator * NewInstance ( ) const { return vtkHierarchicalBoxDataIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUniformGridAMRDataIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHierarchicalBoxDataIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHierarchicalBoxDataIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkHierarchicalBoxDataIterator ( ) ; ~ vtkHierarchicalBoxDataIterator ( ) override ; private : vtkHierarchicalBoxDataIterator ( const vtkHierarchicalBoxDataIterator & ) = delete ; void operator = ( const vtkHierarchicalBoxDataIterator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkHierarchicalBoxDataIterator.h
