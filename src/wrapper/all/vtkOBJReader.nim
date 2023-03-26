## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOBJReader.h
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
##  @class   vtkOBJReader
##  @brief   read Wavefront .obj files
##
##  vtkOBJReader is a source object that reads Wavefront .obj
##  files. The output of this source object is polygonal data.
##  @sa
##  vtkOBJImporter
##

## !!!Ignored construct:  # vtkOBJReader_h [NewLine] # vtkOBJReader_h [NewLine] # vtkAbstractPolyDataReader.h [NewLine] # vtkIOGeometryModule.h  For export macro [NewLine] class VTKIOGEOMETRY_EXPORT vtkOBJReader : public vtkAbstractPolyDataReader { public : static vtkOBJReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractPolyDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractPolyDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOBJReader :: IsTypeOf ( type ) ; } static vtkOBJReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOBJReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOBJReader * NewInstance ( ) const { return vtkOBJReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPolyDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOBJReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOBJReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get first comment in the file.
##  Comment may be multiple lines. # and leading spaces are removed.
##  virtual char * GetComment ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Comment  of  << ( this -> Comment ? this -> Comment : (null) ) ) ; return this -> Comment ; } ; /@} protected : vtkOBJReader ( ) ; ~ vtkOBJReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Set comment string. Internal use only.
##  virtual void SetComment ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Comment  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Comment == nullptr && _arg == nullptr ) { return ; } if ( this -> Comment && _arg && ( ! strcmp ( this -> Comment , _arg ) ) ) { return ; } delete [ ] this -> Comment ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Comment = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Comment = nullptr ; } this -> Modified ( ) ; } ; char * Comment ; private : vtkOBJReader ( const vtkOBJReader & ) = delete ; void operator = ( const vtkOBJReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
