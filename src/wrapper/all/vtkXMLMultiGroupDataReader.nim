## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkXMLMultiGroupDataReader.h
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
##  @class   vtkXMLMultiGroupDataReader
##  @brief   Reader for multi-block datasets
##
##  vtkXMLMultiGroupDataReader is a legacy reader that reads multi group files
##  into multiblock datasets.
##

## !!!Ignored construct:  # vtkXMLMultiGroupDataReader_h [NewLine] # vtkXMLMultiGroupDataReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLMultiBlockDataReader.h [NewLine] class VTKIOXML_EXPORT vtkXMLMultiGroupDataReader : public vtkXMLMultiBlockDataReader { public : static vtkXMLMultiGroupDataReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLMultiBlockDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLMultiBlockDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLMultiGroupDataReader :: IsTypeOf ( type ) ; } static vtkXMLMultiGroupDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLMultiGroupDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLMultiGroupDataReader * NewInstance ( ) const { return vtkXMLMultiGroupDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLMultiBlockDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLMultiGroupDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLMultiGroupDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkXMLMultiGroupDataReader ( ) ; ~ vtkXMLMultiGroupDataReader ( ) override ;  Get the name of the data set being read. const char * GetDataSetName ( ) override { return vtkMultiGroupDataSet ; } private : vtkXMLMultiGroupDataReader ( const vtkXMLMultiGroupDataReader & ) = delete ; void operator = ( const vtkXMLMultiGroupDataReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
