## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMetaImageReader.h
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
##  @class   vtkMetaImageReader
##  @brief   read binary UNC meta image data
##
##  One of the formats for which a reader is already available in the toolkit is
##  the MetaImage file format. This is a fairly simple yet powerful format
##  consisting of a text header and a binary data section. The following
##  instructions describe how you can write a MetaImage header for the data that
##  you download from the BrainWeb page.
##
##  The minimal structure of the MetaImage header is the following:
##
##     NDims = 3
##     DimSize = 181 217 181
##     ElementType = MET_UCHAR
##     ElementSpacing = 1.0 1.0 1.0
##     ElementByteOrderMSB = False
##     ElementDataFile = brainweb1.raw
##
##     * NDims indicate that this is a 3D image. ITK can handle images of
##       arbitrary dimension.
##     * DimSize indicates the size of the volume in pixels along each
##       direction.
##     * ElementType indicate the primitive type used for pixels. In this case
##       is "unsigned char", implying that the data is digitized in 8 bits /
##       pixel.
##     * ElementSpacing indicates the physical separation between the center of
##       one pixel and the center of the next pixel along each direction in space.
##       The units used are millimeters.
##     * ElementByteOrderMSB indicates is the data is encoded in little or big
##       endian order. You might want to play with this value when moving data
##       between different computer platforms.
##     * ElementDataFile is the name of the file containing the raw binary data
##       of the image. This file must be in the same directory as the header.
##
##  MetaImage headers are expected to have extension: ".mha" or ".mhd"
##
##  Once you write this header text file, it should be possible to read the
##  image into your ITK based application using the itk::FileIOToImageFilter
##  class.
##
##
##
##

## !!!Ignored construct:  # vtkMetaImageReader_h [NewLine] # vtkMetaImageReader_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageReader2.h [NewLine] namespace vtkmetaio { class MetaImage ; }  forward declaration class VTKIOIMAGE_EXPORT vtkMetaImageReader : public vtkImageReader2 { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageReader2 Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageReader2 :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMetaImageReader :: IsTypeOf ( type ) ; } static vtkMetaImageReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMetaImageReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMetaImageReader * NewInstance ( ) const { return vtkMetaImageReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMetaImageReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMetaImageReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with FlipNormals turned off and Normals set to true.
##  static vtkMetaImageReader * New ( ) ; const char * GetFileExtensions ( ) override { return .mhd .mha ; } const char * GetDescriptiveName ( ) override { return MetaIO Library: MetaImage ; }  These duplicate functions in vtkImageReader2, vtkMedicalImageReader. double * GetPixelSpacing ( ) { return this -> GetDataSpacing ( ) ; } int GetWidth ( ) { return ( this -> GetDataExtent ( ) [ 1 ] - this -> GetDataExtent ( ) [ 0 ] + 1 ) ; } int GetHeight ( ) { return ( this -> GetDataExtent ( ) [ 3 ] - this -> GetDataExtent ( ) [ 2 ] + 1 ) ; } double * GetImagePositionPatient ( ) { return this -> GetDataOrigin ( ) ; } int GetNumberOfComponents ( ) { return this -> GetNumberOfScalarComponents ( ) ; } int GetPixelRepresentation ( ) { return this -> GetDataScalarType ( ) ; } int GetDataByteOrder ( void ) override ; virtual double GetRescaleSlope ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RescaleSlope  of  << this -> RescaleSlope ) ; return this -> RescaleSlope ; } ; virtual double GetRescaleSlopeRescaleOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RescaleOffset  of  << this -> RescaleOffset ) ; return this -> RescaleOffset ; } ; virtual int GetRescaleSlopeRescaleOffsetBitsAllocated ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BitsAllocated  of  << this -> BitsAllocated ) ; return this -> BitsAllocated ; } ; virtual char * GetDistanceUnits ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << DistanceUnits  of  << ( this -> DistanceUnits ? this -> DistanceUnits : (null) ) ) ; return this -> DistanceUnits ; } ; virtual char * GetDistanceUnitsAnatomicalOrientation ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << AnatomicalOrientation  of  << ( this -> AnatomicalOrientation ? this -> AnatomicalOrientation : (null) ) ) ; return this -> AnatomicalOrientation ; } ; virtual double GetRescaleSlopeRescaleOffsetBitsAllocatedGantryAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GantryAngle  of  << this -> GantryAngle ) ; return this -> GantryAngle ; } ; virtual char * GetDistanceUnitsAnatomicalOrientationPatientName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << PatientName  of  << ( this -> PatientName ? this -> PatientName : (null) ) ) ; return this -> PatientName ; } ; virtual char * GetDistanceUnitsAnatomicalOrientationPatientNamePatientID ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << PatientID  of  << ( this -> PatientID ? this -> PatientID : (null) ) ) ; return this -> PatientID ; } ; virtual char * GetDistanceUnitsAnatomicalOrientationPatientNamePatientIDDate ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Date  of  << ( this -> Date ? this -> Date : (null) ) ) ; return this -> Date ; } ; virtual char * GetDistanceUnitsAnatomicalOrientationPatientNamePatientIDDateSeries ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Series  of  << ( this -> Series ? this -> Series : (null) ) ) ; return this -> Series ; } ; virtual char * GetDistanceUnitsAnatomicalOrientationPatientNamePatientIDDateSeriesImageNumber ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageNumber  of  << ( this -> ImageNumber ? this -> ImageNumber : (null) ) ) ; return this -> ImageNumber ; } ; virtual char * GetDistanceUnitsAnatomicalOrientationPatientNamePatientIDDateSeriesImageNumberModality ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Modality  of  << ( this -> Modality ? this -> Modality : (null) ) ) ; return this -> Modality ; } ; virtual char * GetDistanceUnitsAnatomicalOrientationPatientNamePatientIDDateSeriesImageNumberModalityStudyID ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << StudyID  of  << ( this -> StudyID ? this -> StudyID : (null) ) ) ; return this -> StudyID ; } ; virtual char * GetDistanceUnitsAnatomicalOrientationPatientNamePatientIDDateSeriesImageNumberModalityStudyIDStudyUID ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << StudyUID  of  << ( this -> StudyUID ? this -> StudyUID : (null) ) ) ; return this -> StudyUID ; } ; virtual char * GetDistanceUnitsAnatomicalOrientationPatientNamePatientIDDateSeriesImageNumberModalityStudyIDStudyUIDTransferSyntaxUID ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << TransferSyntaxUID  of  << ( this -> TransferSyntaxUID ? this -> TransferSyntaxUID : (null) ) ) ; return this -> TransferSyntaxUID ; } ; *
##  Test whether the file with the given name can be read by this
##  reader.
##  int CanReadFile ( VTK_FILEPATH const char * name ) override ; protected : vtkMetaImageReader ( ) ; ~ vtkMetaImageReader ( ) override ;  These functions make no sense for this (or most) file readers
##  and should be hidden from the user...but then the getsettest fails. virtual void SetFilePrefix(const char * arg)
##     { vtkImageReader2::SetFilePrefix(arg); }
##   virtual void SetFilePattern(VTK_FILEPATH const char * arg)
##     { vtkImageReader2::SetFilePattern(arg); }
##   virtual void SetDataScalarType(int type)
##     { vtkImageReader2::SetDataScalarType(type); }
##   virtual void SetDataScalarTypeToFloat()
##     { this->SetDataScalarType(VTK_FLOAT); }
##   virtual void SetDataScalarTypeToDouble()
##     { this->SetDataScalarType(VTK_DOUBLE); }
##   virtual void SetDataScalarTypeToInt()
##     { this->SetDataScalarType(VTK_INT); }
##   virtual void SetDataScalarTypeToShort()
##     { this->SetDataScalarType(VTK_SHORT); }
##   virtual void SetDataScalarTypeToUnsignedShort()
##     {this->SetDataScalarType(VTK_UNSIGNED_SHORT);}
##   virtual void SetDataScalarTypeToUnsignedChar()
##     {this->SetDataScalarType(VTK_UNSIGNED_CHAR);}
##   vtkSetMacro(NumberOfScalarComponents, int);
##   vtkSetVector6Macro(DataExtent, int);
##   vtkSetMacro(FileDimensionality, int);
##   vtkSetVector3Macro(DataSpacing, double);
##   vtkSetVector3Macro(DataOrigin, double);
##   vtkSetMacro(HeaderSize, unsigned long);
##   unsigned long GetHeaderSize(unsigned long)
##     { return 0; }
##   virtual void SetDataByteOrderToBigEndian()
##     { this->SetDataByteOrderToBigEndian(); }
##   virtual void SetDataByteOrderToLittleEndian()
##     { this->SetDataByteOrderToBigEndian(); }
##   virtual void SetDataByteOrder(int order)
##     { this->SetDataByteOrder(order); }
##   vtkSetMacro(FileNameSliceOffset,int);
##   vtkSetMacro(FileNameSliceSpacing,int);
##   vtkSetMacro(SwapBytes, int);
##   virtual int OpenFile()
##     { return vtkImageReader2::OpenFile(); }
##   virtual void SeekFile(int i, int j, int k)
##     { vtkImageReader2::SeekFile(i, j, k); }
##   vtkSetMacro(FileLowerLeft, int);
##   virtual void ComputeInternalFileName(int slice)
##     { vtkImageReader2::ComputeInternalFileName(slice); }
##   vtkGetFilePathMacro(InternalFileName);
##   const char * GetDataByteOrderAsString(void)
##     { return vtkImageReader2::GetDataByteOrderAsString(); }
##   unsigned long GetHeaderSize(void)
##     { return vtkImageReader2::GetHeaderSize(); } void ExecuteInformation ( ) override ; void ExecuteDataWithInformation ( vtkDataObject * out , vtkInformation * outInfo ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkMetaImageReader ( const vtkMetaImageReader & ) = delete ; void operator = ( const vtkMetaImageReader & ) = delete ; vtkmetaio :: MetaImage * MetaImagePtr ; double GantryAngle ; char PatientName [ 255 ] ; char PatientID [ 255 ] ; char Date [ 255 ] ; char Series [ 255 ] ; char Study [ 255 ] ; char ImageNumber [ 255 ] ; char Modality [ 255 ] ; char StudyID [ 255 ] ; char StudyUID [ 255 ] ; char TransferSyntaxUID [ 255 ] ; double RescaleSlope ; double RescaleOffset ; int BitsAllocated ; char DistanceUnits [ 255 ] ; char AnatomicalOrientation [ 255 ] ; } ;
## Error: token expected: ; but got: [identifier]!!!
