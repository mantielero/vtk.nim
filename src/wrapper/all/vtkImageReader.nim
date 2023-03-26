## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageReader.h
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
##  @class   vtkImageReader
##  @brief   Superclass of transformable binary file readers.
##
##  vtkImageReader provides methods needed to read a region from a file.
##  It supports both transforms and masks on the input data, but as a result
##  is more complicated and slower than its parent class vtkImageReader2.
##
##  @sa
##  vtkBMPReader vtkPNMReader vtkTIFFReader
##

## !!!Ignored construct:  # vtkImageReader_h [NewLine] # vtkImageReader_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageReader2.h [NewLine] class vtkTransform ;
## Error: token expected: ; but got: [identifier]!!!

const
  VTK_FILE_BYTE_ORDER_BIG_ENDIAN* = 0
  VTK_FILE_BYTE_ORDER_LITTLE_ENDIAN* = 1

## !!!Ignored construct:  class VTKIOIMAGE_EXPORT vtkImageReader : public vtkImageReader2 { public : static vtkImageReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageReader2 Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageReader2 :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageReader :: IsTypeOf ( type ) ; } static vtkImageReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageReader * NewInstance ( ) const { return vtkImageReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/get the data VOI. You can limit the reader to only
##  read a subset of the data.
##  virtual void SetDataVOI ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DataVOI  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> DataVOI [ 0 ] != _arg1 ) || ( this -> DataVOI [ 1 ] != _arg2 ) || ( this -> DataVOI [ 2 ] != _arg3 ) || ( this -> DataVOI [ 3 ] != _arg4 ) || ( this -> DataVOI [ 4 ] != _arg5 ) || ( this -> DataVOI [ 5 ] != _arg6 ) ) { this -> DataVOI [ 0 ] = _arg1 ; this -> DataVOI [ 1 ] = _arg2 ; this -> DataVOI [ 2 ] = _arg3 ; this -> DataVOI [ 3 ] = _arg4 ; this -> DataVOI [ 4 ] = _arg5 ; this -> DataVOI [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetDataVOI ( const int _arg [ 6 ] ) { this -> SetDataVOI ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetDataVOI ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataVOI  pointer  << this -> DataVOI ) ; return this -> DataVOI ; } VTK_WRAPEXCLUDE virtual void GetDataVOI ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> DataVOI [ 0 ] ; _arg2 = this -> DataVOI [ 1 ] ; _arg3 = this -> DataVOI [ 2 ] ; _arg4 = this -> DataVOI [ 3 ] ; _arg5 = this -> DataVOI [ 4 ] ; _arg6 = this -> DataVOI [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataVOI  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDataVOI ( int _arg [ 6 ] ) { this -> GetDataVOI ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Set/Get the Data mask.  The data mask is a simply integer whose bits are
##  treated as a mask to the bits read from disk.  That is, the data mask is
##  bitwise-and'ed to the numbers read from disk.  This ivar is stored as 64
##  bits, the largest mask you will need.  The mask will be truncated to the
##  data size required to be read (using the least significant bits).
##  virtual vtkTypeUInt64 GetDataMask ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataMask  of  << this -> DataMask ) ; return this -> DataMask ; } ; virtual void SetDataMask ( vtkTypeUInt64 _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DataMask  to  << _arg ) ; if ( this -> DataMask != _arg ) { this -> DataMask = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Set/Get transformation matrix to transform the data from slice space
##  into world space. This matrix must be a permutation matrix. To qualify,
##  the sums of the rows must be + or - 1.
##  virtual void SetTransform ( vtkTransform * ) ; virtual vtkTransform * GetnameTransform ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Transform  address  << static_cast < vtkTransform * > ( this -> Transform ) ) ; return this -> Transform ; } ; /@}  Warning !!!
##  following should only be used by methods or template helpers, not users void ComputeInverseTransformedExtent ( int inExtent [ 6 ] , int outExtent [ 6 ] ) ; void ComputeInverseTransformedIncrements ( vtkIdType inIncr [ 3 ] , vtkIdType outIncr [ 3 ] ) ; int OpenAndSeekFile ( int extent [ 6 ] , int slice ) ; /@{ *
##  Set/get the scalar array name for this data set.
##  virtual void SetScalarArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ScalarArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> ScalarArrayName && _arg && ( ! strcmp ( this -> ScalarArrayName , _arg ) ) ) { return ; } delete [ ] this -> ScalarArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ScalarArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ScalarArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetScalarArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarArrayName  of  << ( this -> ScalarArrayName ? this -> ScalarArrayName : (null) ) ) ; return this -> ScalarArrayName ; } ; /@} *
##  vtkImageReader itself can read raw binary files. That being the case,
##  we need to implement `CanReadFile` to return success for any file.
##  Subclasses that read specific file format should override and implement
##  appropriate checks for file format.
##  int CanReadFile ( VTK_FILEPATH const char * ) override { return 1 ;  I think I can read the file but I cannot prove it } protected : vtkImageReader ( ) ; ~ vtkImageReader ( ) override ; vtkTypeUInt64 DataMask ; vtkTransform * Transform ; void ComputeTransformedSpacing ( double Spacing [ 3 ] ) ; void ComputeTransformedOrigin ( double origin [ 3 ] ) ; void ComputeTransformedExtent ( int inExtent [ 6 ] , int outExtent [ 6 ] ) ; void ComputeTransformedIncrements ( vtkIdType inIncr [ 3 ] , vtkIdType outIncr [ 3 ] ) ; int DataVOI [ 6 ] ; char * ScalarArrayName ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; void ExecuteDataWithInformation ( vtkDataObject * data , vtkInformation * outInfo ) override ; private : vtkImageReader ( const vtkImageReader & ) = delete ; void operator = ( const vtkImageReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
