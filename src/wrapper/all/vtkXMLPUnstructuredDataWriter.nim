## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPUnstructuredDataWriter.h
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
##  @class   vtkXMLPUnstructuredDataWriter
##  @brief   Superclass for PVTK XML unstructured data writers.
##
##  vtkXMLPUnstructuredDataWriter provides PVTK XML writing
##  functionality that is common among all the parallel unstructured
##  data formats.
##

## !!!Ignored construct:  # vtkXMLPUnstructuredDataWriter_h [NewLine] # vtkXMLPUnstructuredDataWriter_h [NewLine] # vtkIOParallelXMLModule.h  For export macro # vtkXMLPDataWriter.h [NewLine] class vtkPointSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkXMLUnstructuredDataWriter"
## !!!Ignored construct:  class VTKIOPARALLELXML_EXPORT vtkXMLPUnstructuredDataWriter : public vtkXMLPDataWriter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLPDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLPDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPUnstructuredDataWriter :: IsTypeOf ( type ) ; } static vtkXMLPUnstructuredDataWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPUnstructuredDataWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPUnstructuredDataWriter * NewInstance ( ) const { return vtkXMLPUnstructuredDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPUnstructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPUnstructuredDataWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkXMLPUnstructuredDataWriter ( ) ; ~ vtkXMLPUnstructuredDataWriter ( ) override ; vtkPointSet * GetInputAsPointSet ( ) ; virtual vtkXMLUnstructuredDataWriter * CreateUnstructuredPieceWriter ( ) = 0 ; vtkXMLWriter * CreatePieceWriter ( int index ) override ; void WritePData ( vtkIndent indent ) override ; private : vtkXMLPUnstructuredDataWriter ( const vtkXMLPUnstructuredDataWriter & ) = delete ; void operator = ( const vtkXMLPUnstructuredDataWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
