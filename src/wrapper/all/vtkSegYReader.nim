## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSegYReader.h
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

## !!!Ignored construct:  # vtkSegYReader_h [NewLine] # vtkSegYReader_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # < vtkIOSegYModule . h >  For export macro [NewLine]  Forward declarations class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkSegYReaderInternal"
## !!!Ignored construct:  class VTKIOSEGY_EXPORT vtkSegYReader : public vtkDataSetAlgorithm { public : static vtkSegYReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSegYReader :: IsTypeOf ( type ) ; } static vtkSegYReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSegYReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSegYReader * NewInstance ( ) const { return vtkSegYReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSegYReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSegYReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkSegYReader ( ) ; ~ vtkSegYReader ( ) override ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; enum VTKSegYCoordinateModes { VTK_SEGY_SOURCE = 0 ,  default VTK_SEGY_CDP = 1 , VTK_SEGY_CUSTOM = 2 } ; /@{ *
##  Specify whether to use source x/y coordinates or CDP coordinates or custom
##  byte positions for data position in the SEG-Y trace header. Defaults to
##  source x/y coordinates.
##
##  As per SEG-Y rev 2.0 specification,
##  Source XY coordinate bytes = (73, 77)
##  CDP XY coordinate bytes = (181, 185)
##  virtual void SetXYCoordMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << XYCoordMode  to  << _arg ) ; if ( this -> XYCoordMode != ( _arg < VTK_SEGY_SOURCE ? VTK_SEGY_SOURCE : ( _arg > VTK_SEGY_CUSTOM ? VTK_SEGY_CUSTOM : _arg ) ) ) { this -> XYCoordMode = ( _arg < VTK_SEGY_SOURCE ? VTK_SEGY_SOURCE : ( _arg > VTK_SEGY_CUSTOM ? VTK_SEGY_CUSTOM : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetXYCoordModeMinValue ( ) { return VTK_SEGY_SOURCE ; } virtual int GetXYCoordModeMaxValue ( ) { return VTK_SEGY_CUSTOM ; } ; virtual int GetXYCoordMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XYCoordMode  of  << this -> XYCoordMode ) ; return this -> XYCoordMode ; } ; void SetXYCoordModeToSource ( ) ; void SetXYCoordModeToCDP ( ) ; void SetXYCoordModeToCustom ( ) ; /@} /@{ *
##  Specify X and Y byte positions for custom XYCoordinateMode.
##  By default, XCoordByte = 73, YCoordByte = 77 i.e. source xy.
##
##  \sa SetXYCoordinatesModeToCustom()
##  virtual void SetXCoordByte ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  XCoordByte  to  << _arg ) ; if ( this -> XCoordByte != _arg ) { this -> XCoordByte = _arg ; this -> Modified ( ) ; } } ; virtual int GetXYCoordModeXCoordByte ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XCoordByte  of  << this -> XCoordByte ) ; return this -> XCoordByte ; } ; virtual void SetXCoordByteYCoordByte ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  YCoordByte  to  << _arg ) ; if ( this -> YCoordByte != _arg ) { this -> YCoordByte = _arg ; this -> Modified ( ) ; } } ; virtual int GetXYCoordModeXCoordByteYCoordByte ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YCoordByte  of  << this -> YCoordByte ) ; return this -> YCoordByte ; } ; /@} enum VTKSegYVerticalCRS { VTK_SEGY_VERTICAL_HEIGHTS = 0 ,  default VTK_SEGY_VERTICAL_DEPTHS } ; /@{ *
##  Specify whether the vertical coordinates in the SEG-Y file are heights
##  (positive up) or depths (positive down). By default, the vertical
##  coordinates are treated as heights (i.e. positive up). This means that the
##  Z-axis of the dataset goes from 0 (surface) to -ve depth (last sample).
##  \note As per the SEG-Y rev 2.0 specification, this information is defined
##  in the Location Data Stanza of the Extended Textual Header. However, as of
##  this revision, vtkSegY2DReader does not support reading the extended
##  textual header.
##  virtual void SetXCoordByteYCoordByteVerticalCRS ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VerticalCRS  to  << _arg ) ; if ( this -> VerticalCRS != _arg ) { this -> VerticalCRS = _arg ; this -> Modified ( ) ; } } ; virtual int GetXYCoordModeXCoordByteYCoordByteVerticalCRS ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VerticalCRS  of  << this -> VerticalCRS ) ; return this -> VerticalCRS ; } ; /@} /@{ *
##  Specify if we create a vtkStructuredGrid even when the data is
##  3D. Note this consumes more memory but it shows the precise
##  location for each point and the correct shape of the data. The
##  default value is true.  If we set this option to false we
##  create a vtkImageData for the SegY 3D dataset.
##  virtual void SetXCoordByteYCoordByteVerticalCRSStructuredGrid ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StructuredGrid  to  << _arg ) ; if ( this -> StructuredGrid != _arg ) { this -> StructuredGrid = _arg ; this -> Modified ( ) ; } } ; virtual int GetXYCoordModeXCoordByteYCoordByteVerticalCRSStructuredGrid ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StructuredGrid  of  << this -> StructuredGrid ) ; return this -> StructuredGrid ; } ; virtual void StructuredGridOn ( ) { this -> SetStructuredGrid ( static_cast < int > ( 1 ) ) ; } virtual void StructuredGridOff ( ) { this -> SetStructuredGrid ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  Should we force the data to be interpreted as a 2D dataset? It may be a
##  2D sheet through 3D space. When this is turned on we ignore the cross
##  line and line values and instead build a 2D data by processing and
##  connecting the traces in order from first to last. The output will be a
##  Structrured Grid.
##  virtual void SetXCoordByteYCoordByteVerticalCRSStructuredGridForce2D ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Force2D  to  << _arg ) ; if ( this -> Force2D != _arg ) { this -> Force2D = _arg ; this -> Modified ( ) ; } } ; virtual bool GetXYCoordModeXCoordByteYCoordByteVerticalCRSStructuredGridForce2D ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Force2D  of  << this -> Force2D ) ; return this -> Force2D ; } ; virtual void Force2DOn ( ) { this -> SetStructuredGridForce2D ( static_cast < bool > ( 1 ) ) ; } virtual void Force2DOff ( ) { this -> SetStructuredGridForce2D ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; protected : vtkSegYReaderInternal * Reader ; char * FileName ; bool Is3D ; double DataOrigin [ 3 ] ; double DataSpacing [ 3 ] [ 3 ] ; int DataSpacingSign [ 3 ] ; int DataExtent [ 6 ] ; int XYCoordMode ; int StructuredGrid ;  Custom XY coordinate byte positions int XCoordByte ; int YCoordByte ; int VerticalCRS ; bool Force2D ; private : vtkSegYReader ( const vtkSegYReader & ) = delete ; void operator = ( const vtkSegYReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
