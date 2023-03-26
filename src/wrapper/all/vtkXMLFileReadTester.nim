## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLFileReadTester.h
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
##  @class   vtkXMLFileReadTester
##  @brief   Utility class for vtkXMLReader and subclasses.
##
##  vtkXMLFileReadTester reads the smallest part of a file necessary to
##  determine whether it is a VTK XML file.  If so, it extracts the
##  file type and version number.
##

## !!!Ignored construct:  # vtkXMLFileReadTester_h [NewLine] # vtkXMLFileReadTester_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLParser.h [NewLine] class VTKIOXML_EXPORT vtkXMLFileReadTester : public vtkXMLParser { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLParser Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLParser :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLFileReadTester :: IsTypeOf ( type ) ; } static vtkXMLFileReadTester * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLFileReadTester * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLFileReadTester * NewInstance ( ) const { return vtkXMLFileReadTester :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLParser :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLFileReadTester :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLFileReadTester :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkXMLFileReadTester * New ( ) ; *
##  Try to read the file given by FileName.  Returns 1 if the file is
##  a VTK XML file, and 0 otherwise.
##  int TestReadFile ( ) ; /@{ *
##  Get the data type of the XML file tested.  If the file could not
##  be read, returns nullptr.
##  virtual char * GetFileDataType ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << FileDataType  of  << ( this -> FileDataType ? this -> FileDataType : (null) ) ) ; return this -> FileDataType ; } ; /@} /@{ *
##  Get the file version of the XML file tested.  If the file could not
##  be read, returns nullptr.
##  virtual char * GetFileDataTypeFileVersion ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << FileVersion  of  << ( this -> FileVersion ? this -> FileVersion : (null) ) ) ; return this -> FileVersion ; } ; /@} protected : vtkXMLFileReadTester ( ) ; ~ vtkXMLFileReadTester ( ) override ; void StartElement ( const char * name , const char * * atts ) override ; int ParsingComplete ( ) override ; void ReportStrayAttribute ( const char * , const char * , const char * ) override { } void ReportMissingAttribute ( const char * , const char * ) override { } void ReportBadAttribute ( const char * , const char * , const char * ) override { } void ReportUnknownElement ( const char * ) override { } void ReportXmlParseError ( ) override { } char * FileDataType ; char * FileVersion ; int Done ; virtual void SetFileDataType ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileDataType  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileDataType == nullptr && _arg == nullptr ) { return ; } if ( this -> FileDataType && _arg && ( ! strcmp ( this -> FileDataType , _arg ) ) ) { return ; } delete [ ] this -> FileDataType ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileDataType = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileDataType = nullptr ; } this -> Modified ( ) ; } ; virtual void SetFileDataTypeFileVersion ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileVersion  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileVersion == nullptr && _arg == nullptr ) { return ; } if ( this -> FileVersion && _arg && ( ! strcmp ( this -> FileVersion , _arg ) ) ) { return ; } delete [ ] this -> FileVersion ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileVersion = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileVersion = nullptr ; } this -> Modified ( ) ; } ; private : vtkXMLFileReadTester ( const vtkXMLFileReadTester & ) = delete ; void operator = ( const vtkXMLFileReadTester & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
