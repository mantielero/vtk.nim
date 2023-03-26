## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkJSONImageWriter.h
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
##  @class   vtkJSONImageWriter
##  @brief   Writes vtkImageData to a JSON file.
##
##  vtkJSONImageWriter writes a JSON file which will describe the
##  data inside a vtkImageData.
##

## !!!Ignored construct:  # vtkJSONImageWriter_h [NewLine] # vtkJSONImageWriter_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageAlgorithm.h [NewLine] class VTKIOIMAGE_EXPORT vtkJSONImageWriter : public vtkImageAlgorithm { public : static vtkJSONImageWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkJSONImageWriter :: IsTypeOf ( type ) ; } static vtkJSONImageWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkJSONImageWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkJSONImageWriter * NewInstance ( ) const { return vtkJSONImageWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkJSONImageWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkJSONImageWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify file name for the image file.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} /@{ *
##  Specify ArrayName to export. By default nullptr which will dump ALL arrays.
##  virtual void SetArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> ArrayName && _arg && ( ! strcmp ( this -> ArrayName , _arg ) ) ) { return ; } delete [ ] this -> ArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayName  of  << ( this -> ArrayName ? this -> ArrayName : (null) ) ) ; return this -> ArrayName ; } ; /@} /@{ *
##  Specify Slice in Z to export. By default -1 which will dump the full 3D domain.
##  virtual void SetSlice ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Slice  to  << _arg ) ; if ( this -> Slice != _arg ) { this -> Slice = _arg ; this -> Modified ( ) ; } } ; virtual int GetSlice ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Slice  of  << this -> Slice ) ; return this -> Slice ; } ; /@} *
##  The main interface which triggers the writer to start.
##  virtual void Write ( ) ; protected : vtkJSONImageWriter ( ) ; ~ vtkJSONImageWriter ( ) override ; char * FileName ; char * ArrayName ; int Slice ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkJSONImageWriter ( const vtkJSONImageWriter & ) = delete ; void operator = ( const vtkJSONImageWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
