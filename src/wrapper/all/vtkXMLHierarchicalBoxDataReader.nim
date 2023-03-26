## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkXMLHierarchicalBoxDataReader.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkXMLHierarchicalBoxDataReader
##  @brief   Reader for hierarchical datasets
##  (for backwards compatibility).
##
##
##  vtkXMLHierarchicalBoxDataReader is an empty subclass of
##  vtkXMLUniformGridAMRReader. This is only for backwards compatibility. Newer
##  code should simply use vtkXMLUniformGridAMRReader.
##
##  @warning
##  The reader supports reading v1.1 and above. For older versions, use
##  vtkXMLHierarchicalBoxDataFileConverter.
##

## !!!Ignored construct:  # vtkXMLHierarchicalBoxDataReader_h [NewLine] # vtkXMLHierarchicalBoxDataReader_h [NewLine] # vtkXMLUniformGridAMRReader.h [NewLine] class VTKIOXML_EXPORT vtkXMLHierarchicalBoxDataReader : public vtkXMLUniformGridAMRReader { public : static vtkXMLHierarchicalBoxDataReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLUniformGridAMRReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLUniformGridAMRReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLHierarchicalBoxDataReader :: IsTypeOf ( type ) ; } static vtkXMLHierarchicalBoxDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLHierarchicalBoxDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLHierarchicalBoxDataReader * NewInstance ( ) const { return vtkXMLHierarchicalBoxDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLUniformGridAMRReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLHierarchicalBoxDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLHierarchicalBoxDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkXMLHierarchicalBoxDataReader ( ) ; ~ vtkXMLHierarchicalBoxDataReader ( ) override ; private : vtkXMLHierarchicalBoxDataReader ( const vtkXMLHierarchicalBoxDataReader & ) = delete ; void operator = ( const vtkXMLHierarchicalBoxDataReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
