## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOBJWriter.h
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
##  @class   vtkOBJWriter
##  @brief   write wavefront obj file
##
##  vtkOBJWriter writes wavefront obj (.obj) files in ASCII form.
##  OBJ files contain the geometry including lines, triangles and polygons.
##  Normals and texture coordinates on points are also written if they exist.
##  One can specify a texture passing a vtkImageData on port 1.
##  If a texture is set, additionals .mtl and .png files are generated. Those files have the same
##  name without obj extension.
##  Alternatively, one can specify a TextureFileName pointing to an existing texture.
##  In this case a .mtl file is generated pointing to the specified file.
##
##

## !!!Ignored construct:  # vtkOBJWriter_h [NewLine] # vtkOBJWriter_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkWriter.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImageData"
discard "forward decl of vtkPolyData"
## !!!Ignored construct:  class VTKIOGEOMETRY_EXPORT vtkOBJWriter : public vtkWriter { public : static vtkOBJWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOBJWriter :: IsTypeOf ( type ) ; } static vtkOBJWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOBJWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOBJWriter * NewInstance ( ) const { return vtkOBJWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOBJWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOBJWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the inputs to this writer.
##  vtkPolyData * GetInputGeometry ( ) ; vtkImageData * GetInputTexture ( ) ; vtkDataSet * GetInput ( int port ) ; /@} /@{ *
##  Get/Set the path to an existing texture file for the OBJ.
##  If this is set, the writer will generate mtllib, usemtl lines
##  and a .mtl file that points to the existing texture file.
##  virtual void SetTextureFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> TextureFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> TextureFileName && _arg && ( ! strcmp ( this -> TextureFileName , _arg ) ) ) { return ; } delete [ ] this -> TextureFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> TextureFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> TextureFileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetTextureFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureFileName  of  << ( this -> TextureFileName ? this -> TextureFileName : (null) ) ) ; return this -> TextureFileName ; } ; @} @{ *
##  Get/Set the file name of the OBJ file.
##  virtual void SetTextureFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetTextureFileNameFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} protected : vtkOBJWriter ( ) ; ~ vtkOBJWriter ( ) override ; void WriteData ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; char * FileName ; char * TextureFileName ; private : vtkOBJWriter ( const vtkOBJWriter & ) = delete ; void operator = ( const vtkOBJWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
