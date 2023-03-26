## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkX3DExporterXMLWriter.h
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
##  @class   vtkX3DExporterXMLWriter
##  @brief   X3D Exporter XML Writer
##
##  vtkX3DExporterXMLWriter
##

## !!!Ignored construct:  # vtkX3DExporterXMLWriter_h [NewLine] # vtkX3DExporterXMLWriter_h [NewLine] # vtkIOExportModule.h  For export macro # vtkX3DExporterWriter.h [NewLine] # < string >  for std::string [NewLine] class vtkX3DExporterXMLNodeInfoStack ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOEXPORT_EXPORT vtkX3DExporterXMLWriter : public vtkX3DExporterWriter { public : static vtkX3DExporterXMLWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkX3DExporterWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkX3DExporterWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkX3DExporterXMLWriter :: IsTypeOf ( type ) ; } static vtkX3DExporterXMLWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkX3DExporterXMLWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkX3DExporterXMLWriter * NewInstance ( ) const { return vtkX3DExporterXMLWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkX3DExporterWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkX3DExporterXMLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkX3DExporterXMLWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void CloseFile ( ) override ; int OpenFile ( const char * file ) override ; void Flush ( ) override ; int OpenStream ( ) override ; void StartDocument ( ) override ; void EndDocument ( ) override ;  Elements void StartNode ( int elementID ) override ; void EndNode ( ) override ;  Attributes
##  SFString / MFString void SetField ( int attributeID , const char * , bool mfstring = true ) override ;  SFInt32 void SetField ( int attributeID , int ) override ;  SFFloat void SetField ( int attributeID , float ) override ;  SFDouble void SetField ( int attributeID , double ) override ;  SFBool void SetField ( int attributeID , bool ) override ;  For MFxxx attributes void SetField ( int attributeID , int type , const double * a ) override ; void SetField ( int attributeID , int type , vtkDataArray * a ) override ; void SetField ( int attributeID , const double * values , size_t size ) override ;  MFInt32, SFIMAGE void SetField ( int attributeID , const int * values , size_t size , bool image = false ) override ; protected : vtkX3DExporterXMLWriter ( ) ; ~ vtkX3DExporterXMLWriter ( ) override ; private : const char * GetNewline ( ) { return
##  ; } void AddDepth ( ) ; void SubDepth ( ) ; std :: string ActTab ; int Depth ; ostream * OutputStream ; vtkX3DExporterXMLNodeInfoStack * InfoStack ; vtkX3DExporterXMLWriter ( const vtkX3DExporterXMLWriter & ) = delete ; void operator = ( const vtkX3DExporterXMLWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
