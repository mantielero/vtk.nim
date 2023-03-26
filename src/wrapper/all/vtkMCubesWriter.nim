## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMCubesWriter.h
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
##  @class   vtkMCubesWriter
##  @brief   write binary marching cubes file
##
##  vtkMCubesWriter is a polydata writer that writes binary marching cubes
##  files. (Marching cubes is an isosurfacing technique that generates many
##  triangles.) The binary format is supported by W. Lorensen's marching cubes
##  program (and the vtkSliceCubes object). Each triangle is represented by
##  three records, with each record consisting of six single precision
##  floating point numbers representing the a triangle vertex coordinate and
##  vertex normal.
##
##  @warning
##  Binary files are written in sun/hp/sgi (i.e., Big Endian) form.
##
##  @sa
##  vtkMarchingCubes vtkSliceCubes vtkMCubesReader
##

## !!!Ignored construct:  # vtkMCubesWriter_h [NewLine] # vtkMCubesWriter_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkWriter.h [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
## !!!Ignored construct:  class VTKIOGEOMETRY_EXPORT vtkMCubesWriter : public vtkWriter { public : static vtkMCubesWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMCubesWriter :: IsTypeOf ( type ) ; } static vtkMCubesWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMCubesWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMCubesWriter * NewInstance ( ) const { return vtkMCubesWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMCubesWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMCubesWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/get file name of marching cubes limits file.
##  virtual void SetLimitsFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LimitsFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LimitsFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> LimitsFileName && _arg && ( ! strcmp ( this -> LimitsFileName , _arg ) ) ) { return ; } delete [ ] this -> LimitsFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LimitsFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LimitsFileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetLimitsFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LimitsFileName  of  << ( this -> LimitsFileName ? this -> LimitsFileName : (null) ) ) ; return this -> LimitsFileName ; } ; /@} /@{ *
##  Get the input to this writer.
##  vtkPolyData * GetInput ( ) ; vtkPolyData * GetInput ( int port ) ; /@} /@{ *
##  Specify file name of vtk polygon data file to write.
##  virtual void SetLimitsFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetLimitsFileNameFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} protected : vtkMCubesWriter ( ) ; ~ vtkMCubesWriter ( ) override ; void WriteData ( ) override ; void WriteMCubes ( FILE * fp , vtkPoints * pts , vtkDataArray * normals , vtkCellArray * polys ) ; void WriteLimits ( FILE * fp , double * bounds ) ; char * LimitsFileName ; char * FileName ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkMCubesWriter ( const vtkMCubesWriter & ) = delete ; void operator = ( const vtkMCubesWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
