## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHoudiniPolyDataWriter.h
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
##  @class   vtkHoudiniPolyDataWriter
##  @brief   write vtk polygonal data to Houdini file.
##
##
##  vtkHoudiniPolyDataWriter is a source object that writes VTK polygonal data
##  files in ASCII Houdini format (see
##  http://www.sidefx.com/docs/houdini15.0/io/formats/geo).
##

## !!!Ignored construct:  # vtkHoudiniPolyDataWriter_h [NewLine] # vtkHoudiniPolyDataWriter_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkWriter.h [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOGEOMETRY_EXPORT vtkHoudiniPolyDataWriter : public vtkWriter { public : static vtkHoudiniPolyDataWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHoudiniPolyDataWriter :: IsTypeOf ( type ) ; } static vtkHoudiniPolyDataWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHoudiniPolyDataWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHoudiniPolyDataWriter * NewInstance ( ) const { return vtkHoudiniPolyDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHoudiniPolyDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHoudiniPolyDataWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specifies the delimited text file to be loaded.
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; /@} protected : vtkHoudiniPolyDataWriter ( ) ; ~ vtkHoudiniPolyDataWriter ( ) override ; void WriteData ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; char * FileName ; private : vtkHoudiniPolyDataWriter ( const vtkHoudiniPolyDataWriter & ) = delete ; void operator = ( const vtkHoudiniPolyDataWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
