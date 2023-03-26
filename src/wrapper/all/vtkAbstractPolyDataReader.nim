## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractPolyDataReader.h
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
##  @class   vtkAbstractPolyDataReader
##  @brief   Superclass for algorithms that read
##  models from a file.
##
##  This class allows to use a single base class to manage AbstractPolyData
##  reader classes in a uniform manner without needing to know the actual
##  type of the reader.
##  i.e. makes it possible to create maps to associate filename extension
##  and vtkAbstractPolyDataReader object.
##
##  @sa
##  vtkOBJReader vtkPLYReader vtkSTLReader
##

## !!!Ignored construct:  # vtkAbstractPolyDataReader_h [NewLine] # vtkAbstractPolyDataReader_h [NewLine] # vtkIOCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKIOCORE_EXPORT vtkAbstractPolyDataReader : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAbstractPolyDataReader :: IsTypeOf ( type ) ; } static vtkAbstractPolyDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAbstractPolyDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAbstractPolyDataReader * NewInstance ( ) const { return vtkAbstractPolyDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractPolyDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractPolyDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify file name of AbstractPolyData file (obj / ply / stl).
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} protected : vtkAbstractPolyDataReader ( ) ; ~ vtkAbstractPolyDataReader ( ) override ; char * FileName ; private : vtkAbstractPolyDataReader ( const vtkAbstractPolyDataReader & ) = delete ; void operator = ( const vtkAbstractPolyDataReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
