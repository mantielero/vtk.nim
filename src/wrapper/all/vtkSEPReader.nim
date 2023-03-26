## =========================================================================
##   Copyright (c) GeometryFactory
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class vtkSEPReader
##  @brief Stanford Exploration Project files reader.
##
##  This reader takes a .H file that points to a .H@ file and contains
##  all the information to interpret the raw data in the  .H@ file.
##

## !!!Ignored construct:  # vtkSEPReader_h [NewLine] # vtkSEPReader_h [NewLine] # vtkIOImageModule.h  For export macro [NewLine] # vtkExtentTranslator.h  for vtkExtentTranslator # vtkImageAlgorithm.h [NewLine] # vtkNew.h  for ivars [NewLine] # < array >  for std::array # < string >  for std::string [NewLine] namespace details { enum class EndiannessType : std :: uint8_t { SEP_LITTLE_ENDIAN = 0 , SEP_BIG_ENDIAN = 1 } ; static constexpr int SEP_READER_MAX_DIMENSION = 32u ; } class vtkStringArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOIMAGE_EXPORT vtkSEPReader : public vtkImageAlgorithm { public : static vtkSEPReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSEPReader :: IsTypeOf ( type ) ; } static vtkSEPReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSEPReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSEPReader * NewInstance ( ) const { return vtkSEPReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSEPReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSEPReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  @brief Specify file name for the SEP Header file.
##  virtual void SetFileName ( const char * arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( arg ? arg : (null) ) ) ; if ( arg ) { this -> FileName = arg ; } else { this -> FileName . clear ( ) ; } this -> Modified ( ) ; } ; virtual const char * GetFileName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << this -> FileName ) ; return this -> FileName . c_str ( ) ; } ; *
##  @brief When 2D mode is true, the third dimension is
##  ignored and the output is in 2D.
##  virtual int GetOutputGridDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputGridDimension  of  << this -> OutputGridDimension ) ; return this -> OutputGridDimension ; } ; virtual void SetOutputGridDimension ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputGridDimension  to  << _arg ) ; if ( this -> OutputGridDimension != _arg ) { this -> OutputGridDimension = _arg ; this -> Modified ( ) ; } } ; *
##  @brief Specify extent translator split mode.
##  Default: vtkExtentTranslator::BLOCK_MODE
##  virtual void SetOutputGridDimensionExtentSplitMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtentSplitMode  to  << _arg ) ; if ( this -> ExtentSplitMode != _arg ) { this -> ExtentSplitMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetOutputGridDimensionExtentSplitMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtentSplitMode  of  << this -> ExtentSplitMode ) ; return this -> ExtentSplitMode ; } ; virtual VTK_FUTURE_CONST double * GetOutputGridDimensionExtentSplitModeDataOrigin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  of  << this -> DataOrigin ) ; return this -> DataOrigin ; } ; virtual VTK_FUTURE_CONST double * GetOutputGridDimensionExtentSplitModeDataOriginDataSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  of  << this -> DataSpacing ) ; return this -> DataSpacing ; } ; *
##  Array containing the name of all dimensions.
##  Contains ESize elements.
##  virtual vtkStringArray * GetnameAllDimensions ( ) { vtkDebugWithObjectMacro ( this , <<  returning  AllDimensions  address  << static_cast < vtkStringArray * > ( this -> AllDimensions ) ) ; return this -> AllDimensions ; } ; *
##  Array containing the name and the size of all dimensions.
##  The two first entries are the header. Contains 2*ESize elements.
##  virtual vtkStringArray * GetnameAllDimensionsAllRanges ( ) { vtkDebugWithObjectMacro ( this , <<  returning  AllRanges  address  << static_cast < vtkStringArray * > ( this -> AllRanges ) ) ; return this -> AllRanges ; } ; *
##  Specify the name for each spatial / fixed dimension.
##  ZDimension is only used for 3D output.
##  FixedDimension2 is only used for 2D output.
##  virtual void SetFileNameXDimension ( const char * arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << XDimension  to  << ( arg ? arg : (null) ) ) ; if ( arg ) { this -> XDimension = arg ; } else { this -> XDimension . clear ( ) ; } this -> Modified ( ) ; } ; virtual void SetFileNameXDimensionYDimension ( const char * arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << YDimension  to  << ( arg ? arg : (null) ) ) ; if ( arg ) { this -> YDimension = arg ; } else { this -> YDimension . clear ( ) ; } this -> Modified ( ) ; } ; virtual void SetFileNameXDimensionYDimensionZDimension ( const char * arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ZDimension  to  << ( arg ? arg : (null) ) ) ; if ( arg ) { this -> ZDimension = arg ; } else { this -> ZDimension . clear ( ) ; } this -> Modified ( ) ; } ; virtual void SetFileNameXDimensionYDimensionZDimensionFixedDimension1 ( const char * arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FixedDimension1  to  << ( arg ? arg : (null) ) ) ; if ( arg ) { this -> FixedDimension1 = arg ; } else { this -> FixedDimension1 . clear ( ) ; } this -> Modified ( ) ; } ; virtual void SetFileNameXDimensionYDimensionZDimensionFixedDimension1FixedDimension2 ( const char * arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FixedDimension2  to  << ( arg ? arg : (null) ) ) ; if ( arg ) { this -> FixedDimension2 = arg ; } else { this -> FixedDimension2 . clear ( ) ; } this -> Modified ( ) ; } ; virtual void SetOutputGridDimensionExtentSplitModeFixedDimensionValue1 ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FixedDimensionValue1  to  << _arg ) ; if ( this -> FixedDimensionValue1 != _arg ) { this -> FixedDimensionValue1 = _arg ; this -> Modified ( ) ; } } ; virtual void SetOutputGridDimensionExtentSplitModeFixedDimensionValue1FixedDimensionValue2 ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FixedDimensionValue2  to  << _arg ) ; if ( this -> FixedDimensionValue2 != _arg ) { this -> FixedDimensionValue2 = _arg ; this -> Modified ( ) ; } } ; virtual int * GetFixedDimRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FixedDimRange  pointer  << this -> FixedDimRange ) ; return this -> FixedDimRange ; } VTK_WRAPEXCLUDE virtual void GetFixedDimRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> FixedDimRange [ 0 ] ; _arg2 = this -> FixedDimRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FixedDimRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFixedDimRange ( int _arg [ 2 ] ) { this -> GetFixedDimRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; bool CanReadFile ( VTK_FILEPATH const char * ) ; std :: array < std :: int32_t , 6 > ComputeExtent ( ) const ; protected : vtkSEPReader ( ) ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * , vtkInformationVector * ) override ; bool ReadHeader ( ) ; bool ReadData ( vtkImageData * , int * ) ; *
##  Exposed Properties
##  std :: string FileName =  ; int OutputGridDimension = 3 ; int ExtentSplitMode = vtkExtentTranslator :: BLOCK_MODE ; double DataOrigin [ details :: SEP_READER_MAX_DIMENSION ] ; double DataSpacing [ details :: SEP_READER_MAX_DIMENSION ] ; std :: string XDimension = CDP ; std :: string YDimension = LINE ; std :: string ZDimension = DEPTH ;  used only in 3D std :: string FixedDimension1 = OFFSET ; std :: string FixedDimension2 = DEPTH ;  used only in 2D int FixedDimensionValue1 = details :: SEP_READER_MAX_DIMENSION ; int FixedDimensionValue2 = details :: SEP_READER_MAX_DIMENSION ; int FixedDimRange [ 2 ] = { 0 , 0 } ; vtkNew < vtkStringArray > AllDimensions ; vtkNew < vtkStringArray > AllRanges ; private : enum class DataFormatType : std :: uint8_t { XDR_FLOAT = 0 , XDR_INT = 1 , XDR_DOUBLE = 2 } ; *
##  Internal Variables
##  DataFormatType DataFormat = DataFormatType :: XDR_FLOAT ; details :: EndiannessType Endianness ; int Dimensions [ details :: SEP_READER_MAX_DIMENSION ] ; double OutputSpacing [ 3 ] ; double OutputOrigin [ 3 ] ; std :: string Label [ details :: SEP_READER_MAX_DIMENSION ] ; std :: string DataFileType ; std :: string BinaryFilename ; int ESize = 4 ; int XArrayId = details :: SEP_READER_MAX_DIMENSION ; int YArrayId = details :: SEP_READER_MAX_DIMENSION ; int ZArrayId = details :: SEP_READER_MAX_DIMENSION ; int FixedDimension1ArrayId = details :: SEP_READER_MAX_DIMENSION ; int FixedDimension2ArrayId = details :: SEP_READER_MAX_DIMENSION ; void ReadDataPiece ( FILE * file , char * & dataOutput , vtkIdType offset , vtkIdType range ) ; vtkSEPReader ( const vtkSEPReader & ) = delete ; void operator = ( const vtkSEPReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!