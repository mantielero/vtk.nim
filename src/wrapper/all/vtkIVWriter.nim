## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIVWriter.h
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
##  @class   vtkIVWriter
##  @brief   export polydata into OpenInventor 2.0 format.
##
##  vtkIVWriter is a concrete subclass of vtkWriter that writes OpenInventor 2.0
##  files.
##
##  @sa
##  vtkPolyDataWriter
##

## !!!Ignored construct:  # vtkIVWriter_h [NewLine] # vtkIVWriter_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkWriter.h [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOGEOMETRY_EXPORT vtkIVWriter : public vtkWriter { public : static vtkIVWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkIVWriter :: IsTypeOf ( type ) ; } static vtkIVWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkIVWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkIVWriter * NewInstance ( ) const { return vtkIVWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIVWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIVWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the input to this writer.
##  vtkPolyData * GetInput ( ) ; vtkPolyData * GetInput ( int port ) ; /@} /@{ *
##  Specify file name of vtk polygon data file to write.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} protected : vtkIVWriter ( ) { this -> FileName = nullptr ; } ~ vtkIVWriter ( ) override { delete [ ] this -> FileName ; } void WriteData ( ) override ; void WritePolyData ( vtkPolyData * polyData , FILE * fp ) ; char * FileName ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkIVWriter ( const vtkIVWriter & ) = delete ; void operator = ( const vtkIVWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
