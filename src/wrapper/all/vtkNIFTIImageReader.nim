## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNIFTIImageReader.h
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
##  @class   vtkNIFTIImageReader
##  @brief   Read NIfTI-1 and NIfTI-2 medical image files
##
##  This class reads NIFTI files, either in .nii format or as separate
##  .img and .hdr files.  If two files are used, then they can be passed
##  by using SetFileNames() instead of SetFileName().  Files ending in .gz
##  are decompressed on-the-fly while they are being read.  Files with
##  complex numbers or vector dimensions will be read as multi-component
##  images.  If a NIFTI file has a time dimension, then by default only the
##  first image in the time series will be read, but the TimeAsVector
##  flag can be set to read the time steps as vector components.  Files in
##  Analyze 7.5 format are also supported by this reader.
##  @par Thanks:
##  This class was contributed to VTK by the Calgary Image Processing and
##  Analysis Centre (CIPAC).
##  @sa
##  vtkNIFTIImageWriter, vtkNIFTIImageHeader
##

import
  vtkIOImageModule, vtkImageReader2

discard "forward decl of vtkNIFTIImageHeader"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of nifti_1_header"
type
  vtkNIFTIImageReader* {.importcpp: "vtkNIFTIImageReader",
                        header: "vtkNIFTIImageReader.h", bycopy.} = object of vtkImageReader2 ## /@{
                                                                                       ## *
                                                                                       ##  Static method for construction.
                                                                                       ##
    vtkNIFTIImageReader* {.importc: "vtkNIFTIImageReader".}: VTK_NEWINSTANCE
    ## /@{
    ## *
    ##  Information for rescaling data to quantitative units.
    ##
    ## /@}
    ## *
    ##  Is -1 if VTK slice order is opposite to NIFTI slice order, +1 otherwise.
    ##
    ## /@{
    ## *
    ##  The orientation matrices for the NIFTI file.
    ##
    ## /@}
    ## *
    ##  The dimensions of the NIFTI file.
    ##
    ## *
    ##  The spacings in the NIFTI file.
    ##
    ## *
    ##  A copy of the header from the file that was most recently read.
    ##
    ## *
    ##  Use planar RGB instead of the default (packed).
    ##


proc New*(): ptr vtkNIFTIImageReader {.importcpp: "vtkNIFTIImageReader::New(@)",
                                   header: "vtkNIFTIImageReader.h".}
type
  vtkNIFTIImageReaderSuperclass* = vtkImageReader2

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkNIFTIImageReader::IsTypeOf(@)", header: "vtkNIFTIImageReader.h".}
proc IsA*(this: var vtkNIFTIImageReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkNIFTIImageReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkNIFTIImageReader {.
    importcpp: "vtkNIFTIImageReader::SafeDownCast(@)",
    header: "vtkNIFTIImageReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkNIFTIImageReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNIFTIImageReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNIFTIImageReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkNIFTIImageReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkNIFTIImageReader.h".}
proc GetFileExtensions*(this: var vtkNIFTIImageReader): cstring {.
    importcpp: "GetFileExtensions", header: "vtkNIFTIImageReader.h".}
proc GetDescriptiveName*(this: var vtkNIFTIImageReader): cstring {.
    importcpp: "GetDescriptiveName", header: "vtkNIFTIImageReader.h".}
## !!!Ignored construct:  *
##  Return true if this reader can read the given file.
##  int CanReadFile ( VTK_FILEPATH const char * filename ) override ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  /@{ *
##  Read the time dimension as scalar components (default: Off).
##  If this is on, then each time point will be stored as a component in
##  the image data.  If the file has both a time dimension and a vector
##  dimension, then the number of components will be the product of these
##  two dimensions, i.e. the components will store a sequence of vectors.
##  virtual bool GetTimeAsVectorTimeAsVector ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeAsVector  of  << this -> TimeAsVector ) ; return this -> TimeAsVector ; } ;
## Error: expected ';'!!!

proc SetTimeAsVector*(this: var vtkNIFTIImageReader; _arg: bool) {.
    importcpp: "SetTimeAsVector", header: "vtkNIFTIImageReader.h".}
proc TimeAsVectorOn*(this: var vtkNIFTIImageReader) {.importcpp: "TimeAsVectorOn",
    header: "vtkNIFTIImageReader.h".}
proc TimeAsVectorOff*(this: var vtkNIFTIImageReader) {.importcpp: "TimeAsVectorOff",
    header: "vtkNIFTIImageReader.h".}
  ## /@}
  ## *
  ##  Get the time dimension that was stored in the NIFTI header.
  ##
proc GetTimeDimension*(this: var vtkNIFTIImageReader): cint {.
    importcpp: "GetTimeDimension", header: "vtkNIFTIImageReader.h".}
proc GetTimeSpacing*(this: var vtkNIFTIImageReader): cdouble {.
    importcpp: "GetTimeSpacing", header: "vtkNIFTIImageReader.h".}
proc GetRescaleSlope*(this: var vtkNIFTIImageReader): cdouble {.
    importcpp: "GetRescaleSlope", header: "vtkNIFTIImageReader.h".}
proc GetRescaleIntercept*(this: var vtkNIFTIImageReader): cdouble {.
    importcpp: "GetRescaleIntercept", header: "vtkNIFTIImageReader.h".}
## !!!Ignored construct:  /@{ *
##  Read planar RGB (separate R, G, and B planes), rather than packed RGB.
##  The NIFTI format should always use packed RGB.  The Analyze format,
##  however, was used to store both planar RGB and packed RGB depending
##  on the software, without any indication in the header about which
##  convention was being used.  Use this if you have a planar RGB file.
##  virtual bool GetTimeAsVectorTimeAsVectorPlanarRGBPlanarRGB ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlanarRGB  of  << this -> PlanarRGB ) ; return this -> PlanarRGB ; } ;
## Error: expected ';'!!!

proc SetTimeAsVectorPlanarRGB*(this: var vtkNIFTIImageReader; _arg: bool) {.
    importcpp: "SetTimeAsVectorPlanarRGB", header: "vtkNIFTIImageReader.h".}
proc PlanarRGBOn*(this: var vtkNIFTIImageReader) {.importcpp: "PlanarRGBOn",
    header: "vtkNIFTIImageReader.h".}
proc PlanarRGBOff*(this: var vtkNIFTIImageReader) {.importcpp: "PlanarRGBOff",
    header: "vtkNIFTIImageReader.h".}
  ## /@}
  ## *
  ##  QFac gives the slice order in the NIFTI file versus the VTK image.
  ##  If QFac is -1, then the VTK slice index K is related to the NIFTI
  ##  slice index k by the equation K = (num_slices - k - 1).  VTK requires
  ##  the slices to be ordered so that the voxel indices (I,J,K) provide a
  ##  right-handed coordinate system, whereas NIFTI does not.  Instead,
  ##  NIFTI stores a factor called "qfac" in the header to signal when the
  ##  (i,j,k) indices form a left-handed coordinate system.  QFac will only
  ##  ever have values of +1 or -1.
  ##
proc GetQFac*(this: var vtkNIFTIImageReader): cdouble {.importcpp: "GetQFac",
    header: "vtkNIFTIImageReader.h".}
proc GetQFormMatrix*(this: var vtkNIFTIImageReader): ptr vtkMatrix4x4 {.
    importcpp: "GetQFormMatrix", header: "vtkNIFTIImageReader.h".}
proc GetSFormMatrix*(this: var vtkNIFTIImageReader): ptr vtkMatrix4x4 {.
    importcpp: "GetSFormMatrix", header: "vtkNIFTIImageReader.h".}
proc GetNIFTIHeader*(this: var vtkNIFTIImageReader): ptr vtkNIFTIImageHeader {.
    importcpp: "GetNIFTIHeader", header: "vtkNIFTIImageReader.h".}