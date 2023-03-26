## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMetaImageWriter.h
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
##  @class   vtkMetaImageWriter
##  @brief   write a binary UNC meta image data
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
##  @sa
##  vtkImageWriter vtkMetaImageReader
##

## !!!Ignored construct:  # vtkMetaImageWriter_h [NewLine] # vtkMetaImageWriter_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageWriter.h [NewLine] namespace vtkmetaio { class MetaImage ; }  forward declaration class VTKIOIMAGE_EXPORT vtkMetaImageWriter : public vtkImageWriter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMetaImageWriter :: IsTypeOf ( type ) ; } static vtkMetaImageWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMetaImageWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMetaImageWriter * NewInstance ( ) const { return vtkMetaImageWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMetaImageWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMetaImageWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with FlipNormals turned off and Normals set to true.
##  static vtkMetaImageWriter * New ( ) ; *
##  Specify file name of meta file
##  void SetFileName ( VTK_FILEPATH const char * fname ) override ; VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST override { return this -> MHDFileName ; } /@{ *
##  Specify the file name of the raw image data.
##  virtual void SetRAWFileName ( VTK_FILEPATH const char * fname ) ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetRAWFileName ( ) VTK_FUTURE_CONST ; /@} virtual void SetCompression ( bool compress ) { this -> Compress = compress ; } virtual bool GetCompression ( void ) { return this -> Compress ; }  This is called by the superclass.
##  This is the method you should override. void Write ( ) override ; protected : vtkMetaImageWriter ( ) ; ~ vtkMetaImageWriter ( ) override ; virtual void SetMHDFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MHDFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> MHDFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> MHDFileName && _arg && ( ! strcmp ( this -> MHDFileName , _arg ) ) ) { return ; } delete [ ] this -> MHDFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> MHDFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> MHDFileName = nullptr ; } this -> Modified ( ) ; } ; char * MHDFileName ; bool Compress ; private : vtkMetaImageWriter ( const vtkMetaImageWriter & ) = delete ; void operator = ( const vtkMetaImageWriter & ) = delete ; vtkmetaio :: MetaImage * MetaImagePtr ; } ;
## Error: token expected: ; but got: [identifier]!!!
