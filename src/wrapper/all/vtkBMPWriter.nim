## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBMPWriter.h
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
##  @class   vtkBMPWriter
##  @brief   Writes Windows BMP files.
##
##  vtkBMPWriter writes BMP files. The data type
##  of the file is unsigned char regardless of the input type.
##
##  @sa
##  vtkBMPReader
##

## !!!Ignored construct:  # vtkBMPWriter_h [NewLine] # vtkBMPWriter_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageWriter.h [NewLine] class vtkUnsignedCharArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOIMAGE_EXPORT vtkBMPWriter : public vtkImageWriter { public : static vtkBMPWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBMPWriter :: IsTypeOf ( type ) ; } static vtkBMPWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBMPWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBMPWriter * NewInstance ( ) const { return vtkBMPWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBMPWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBMPWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Write the image to memory (a vtkUnsignedCharArray)
##  virtual void SetWriteToMemory ( vtkTypeUBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WriteToMemory  to  << _arg ) ; if ( this -> WriteToMemory != _arg ) { this -> WriteToMemory = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeUBool GetWriteToMemory ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteToMemory  of  << this -> WriteToMemory ) ; return this -> WriteToMemory ; } ; virtual void WriteToMemoryOn ( ) { this -> SetWriteToMemory ( static_cast < vtkTypeUBool > ( 1 ) ) ; } virtual void WriteToMemoryOff ( ) { this -> SetWriteToMemory ( static_cast < vtkTypeUBool > ( 0 ) ) ; } ; /@} /@{ *
##  When writing to memory this is the result, it will be NULL until the
##  data is written the first time
##  virtual void SetResult ( vtkUnsignedCharArray * ) ; virtual vtkUnsignedCharArray * GetnameResult ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Result  address  << static_cast < vtkUnsignedCharArray * > ( this -> Result ) ) ; return this -> Result ; } ; /@} protected : vtkBMPWriter ( ) ; ~ vtkBMPWriter ( ) override ; void WriteFile ( ostream * file , vtkImageData * data , int ext [ 6 ] , int wExt [ 6 ] ) override ; void WriteFileHeader ( ostream * , vtkImageData * , int wExt [ 6 ] ) override ; void MemoryWrite ( int , vtkImageData * , int wExt [ 6 ] , vtkInformation * inInfo ) override ; private : vtkBMPWriter ( const vtkBMPWriter & ) = delete ; void operator = ( const vtkBMPWriter & ) = delete ; vtkUnsignedCharArray * Result ; } ;
## Error: token expected: ; but got: [identifier]!!!
