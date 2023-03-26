## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNIFTIImageWriter.h
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
##  @class   vtkNIFTIImageWriter
##  @brief   Write NIfTI-1 and NIfTI-2 medical image files
##
##  This class writes NIFTI files, either in .nii format or as separate
##  .img and .hdr files.  If told to write a file that ends in ".gz",
##  then the writer will automatically compress the file with zlib.
##  Images of type unsigned char that have 3 or 4 scalar components
##  will automatically be written as RGB or RGBA respectively.  Images
##  of type float or double that have 2 components will automatically be
##  written as complex values.
##  @par Thanks:
##  This class was contributed to VTK by the Calgary Image Processing and
##  Analysis Centre (CIPAC).
##  @sa
##  vtkNIFTIImageReader
##

## !!!Ignored construct:  # vtkNIFTIImageWriter_h [NewLine] # vtkNIFTIImageWriter_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageWriter.h [NewLine] class vtkMatrix4x4 ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkNIFTIImageHeader"
## !!!Ignored construct:  class VTKIOIMAGE_EXPORT vtkNIFTIImageWriter : public vtkImageWriter { public : /@{ *
##  Static method for construction.
##  static vtkNIFTIImageWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkNIFTIImageWriter :: IsTypeOf ( type ) ; } static vtkNIFTIImageWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkNIFTIImageWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkNIFTIImageWriter * NewInstance ( ) const { return vtkNIFTIImageWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNIFTIImageWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNIFTIImageWriter :: New ( ) ; } public : ; /@} *
##  Print information about this object.
##  void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the version number for the NIfTI file format to use.
##  This can be 1, 2, or 0 (the default).  If set to zero, then it
##  will save as NIfTI version 1 unless SetNIFTIHeader() provided
##  header information from a NIfTI version 2 file.
##  virtual void SetNIFTIVersion ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NIFTIVersion  to  << _arg ) ; if ( this -> NIFTIVersion != _arg ) { this -> NIFTIVersion = _arg ; this -> Modified ( ) ; } } ; virtual int GetNIFTIVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NIFTIVersion  of  << this -> NIFTIVersion ) ; return this -> NIFTIVersion ; } ; /@} /@{ *
##  Set a short description (max 80 chars) of how the file was produced.
##  The default description is "VTKX.Y" where X.Y is the VTK version.
##  virtual void SetDescription ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Description  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Description == nullptr && _arg == nullptr ) { return ; } if ( this -> Description && _arg && ( ! strcmp ( this -> Description , _arg ) ) ) { return ; } delete [ ] this -> Description ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Description = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Description = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetDescription ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Description  of  << ( this -> Description ? this -> Description : (null) ) ) ; return this -> Description ; } ; /@} /@{ *
##  Set the time dimension to use in the NIFTI file (or zero if none).
##  The number of components of the input data must be divisible by the time
##  dimension if the time dimension is not set to zero.  The vector dimension
##  will be set to the number of components divided by the time dimension.
##  virtual int GetNIFTIVersionTimeDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeDimension  of  << this -> TimeDimension ) ; return this -> TimeDimension ; } ; virtual void SetNIFTIVersionTimeDimension ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TimeDimension  to  << _arg ) ; if ( this -> TimeDimension != _arg ) { this -> TimeDimension = _arg ; this -> Modified ( ) ; } } ; virtual double GetNIFTIVersionTimeDimensionTimeSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeSpacing  of  << this -> TimeSpacing ) ; return this -> TimeSpacing ; } ; virtual void SetNIFTIVersionTimeDimensionTimeSpacing ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TimeSpacing  to  << _arg ) ; if ( this -> TimeSpacing != _arg ) { this -> TimeSpacing = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Set the slope and intercept for calibrating the scalar values.
##  Other programs that read the NIFTI file can use the equation
##  v = u*RescaleSlope + RescaleIntercept to rescale the data to
##  real values.  If both the slope and the intercept are zero,
##  then the SclSlope and SclIntercept in the header info provided
##  via SetNIFTIHeader() are used instead.
##  virtual void SetNIFTIVersionTimeDimensionTimeSpacingRescaleSlope ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RescaleSlope  to  << _arg ) ; if ( this -> RescaleSlope != _arg ) { this -> RescaleSlope = _arg ; this -> Modified ( ) ; } } ; virtual double GetNIFTIVersionTimeDimensionTimeSpacingRescaleSlope ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RescaleSlope  of  << this -> RescaleSlope ) ; return this -> RescaleSlope ; } ; virtual void SetNIFTIVersionTimeDimensionTimeSpacingRescaleSlopeRescaleIntercept ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RescaleIntercept  to  << _arg ) ; if ( this -> RescaleIntercept != _arg ) { this -> RescaleIntercept = _arg ; this -> Modified ( ) ; } } ; virtual double GetNIFTIVersionTimeDimensionTimeSpacingRescaleSlopeRescaleIntercept ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RescaleIntercept  of  << this -> RescaleIntercept ) ; return this -> RescaleIntercept ; } ; /@} /@{ *
##  Write planar RGB (separate R, G, and B planes), rather than packed RGB.
##  Use this option with extreme caution: the NIFTI standard requires RGB
##  pixels to be packed.  The Analyze format, however, was used to store
##  both planar RGB and packed RGB depending on the software, without any
##  indication in the header about which convention was being used.
##  virtual bool GetNIFTIVersionTimeDimensionTimeSpacingRescaleSlopeRescaleInterceptPlanarRGB ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlanarRGB  of  << this -> PlanarRGB ) ; return this -> PlanarRGB ; } ; virtual void SetNIFTIVersionTimeDimensionTimeSpacingRescaleSlopeRescaleInterceptPlanarRGB ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PlanarRGB  to  << _arg ) ; if ( this -> PlanarRGB != _arg ) { this -> PlanarRGB = _arg ; this -> Modified ( ) ; } } ; virtual void PlanarRGBOn ( ) { this -> SetPlanarRGB ( static_cast < bool > ( 1 ) ) ; } virtual void PlanarRGBOff ( ) { this -> SetPlanarRGB ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  The QFac sets the ordering of the slices in the NIFTI file.
##  If QFac is -1, then the slice ordering in the file will be reversed
##  as compared to VTK. Use with caution.
##  virtual void SetNIFTIVersionTimeDimensionTimeSpacingRescaleSlopeRescaleInterceptPlanarRGBQFac ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  QFac  to  << _arg ) ; if ( this -> QFac != _arg ) { this -> QFac = _arg ; this -> Modified ( ) ; } } ; virtual double GetNIFTIVersionTimeDimensionTimeSpacingRescaleSlopeRescaleInterceptPlanarRGBQFac ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << QFac  of  << this -> QFac ) ; return this -> QFac ; } ; /@} *
##  Set the "qform" orientation and offset for the image data.
##  The 3x3 portion of the matrix must be orthonormal and have a
##  positive determinant, it will be used to compute the quaternion.
##  The last column of the matrix will be used for the offset.
##  In the NIFTI header, the qform_code will be set to 1.
##  void SetQFormMatrix ( vtkMatrix4x4 * ) ; vtkMatrix4x4 * GetQFormMatrix ( ) { return this -> QFormMatrix ; } *
##  Set a matrix for the "sform" transformation stored in the file.
##  Unlike the qform matrix, the sform matrix can contain scaling
##  information.  Before being stored in the NIFTI header, the
##  first three columns of the matrix will be multiplied by the voxel
##  spacing. In the NIFTI header, the sform_code will be set to 2.
##  void SetSFormMatrix ( vtkMatrix4x4 * ) ; vtkMatrix4x4 * GetSFormMatrix ( ) { return this -> SFormMatrix ; } /@{ *
##  Set the NIFTI header information to use when writing the file.
##  The data dimensions and pixdim from the supplied header will be
##  ignored.  Likewise, the QForm and SForm information in the supplied
##  header will be ignored if you have called SetQFormMatrix() or
##  SetSFormMatrix() to provide the orientation information for the file.
##  void SetNIFTIHeader ( vtkNIFTIImageHeader * hdr ) ; vtkNIFTIImageHeader * GetNIFTIHeader ( ) ; /@} protected : vtkNIFTIImageWriter ( ) ; ~ vtkNIFTIImageWriter ( ) override ; *
##  Generate the header information for the file.
##  int GenerateHeader ( vtkInformation * info , bool singleFile ) ; *
##  The main execution method, which writes the file.
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; *
##  Make a new filename by replacing extension "ext1" with "ext2".
##  The extensions must include a period, must be three characters
##  long, and must be lower case.  A new string is returned that must
##  be deleted by the caller.
##  static char * ReplaceExtension ( const char * filename , const char * ext1 , const char * ext2 ) ; /@{ *
##  The size and spacing of the Time dimension to use in the file.
##  int TimeDimension ; double TimeSpacing ; /@} /@{ *
##  Information for rescaling data to quantitative units.
##  double RescaleIntercept ; double RescaleSlope ; /@} *
##  Is -1 if VTK slice order is opposite to NIFTI slice order, +1 otherwise.
##  double QFac ; /@{ *
##  The orientation matrices for the NIFTI file.
##  vtkMatrix4x4 * QFormMatrix ; vtkMatrix4x4 * SFormMatrix ; /@} *
##  A description of how the file was produced.
##  char * Description ; /@{ *
##  The header information.
##  vtkNIFTIImageHeader * NIFTIHeader ; vtkNIFTIImageHeader * OwnHeader ; int NIFTIVersion ; /@} *
##  Use planar RGB instead of the default (packed).
##  bool PlanarRGB ; private : vtkNIFTIImageWriter ( const vtkNIFTIImageWriter & ) = delete ; void operator = ( const vtkNIFTIImageWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
