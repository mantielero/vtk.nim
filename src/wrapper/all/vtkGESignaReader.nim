## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGESignaReader.h
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
##  @class   vtkGESignaReader
##  @brief   read GE Signa ximg files
##
##  vtkGESignaReader is a source object that reads some GE Signa ximg files It
##  does support reading in pixel spacing, slice spacing and it computes an
##  origin for the image in millimeters. It always produces greyscale unsigned
##  short data and it supports reading in rectangular, packed, compressed, and
##  packed&compressed. It does not read in slice orientation, or position
##  right now. To use it you just need to specify a filename or a file prefix
##  and pattern.
##
##
##  @sa
##  vtkImageReader2
##

## !!!Ignored construct:  # vtkGESignaReader_h [NewLine] # vtkGESignaReader_h [NewLine] # vtkIOImageModule.h  For export macro # vtkMedicalImageReader2.h [NewLine] class VTKIOIMAGE_EXPORT vtkGESignaReader : public vtkMedicalImageReader2 { public : static vtkGESignaReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMedicalImageReader2 Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMedicalImageReader2 :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGESignaReader :: IsTypeOf ( type ) ; } static vtkGESignaReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGESignaReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGESignaReader * NewInstance ( ) const { return vtkGESignaReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMedicalImageReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGESignaReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGESignaReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Is the given file a GESigna file?
##  int CanReadFile ( VTK_FILEPATH const char * fname ) override ; *
##  Valid extentsions
##  const char * GetFileExtensions ( ) override { return .MR .CT ; } *
##  A descriptive name for this format
##  const char * GetDescriptiveName ( ) override { return GESigna ; } protected : vtkGESignaReader ( ) = default ; ~ vtkGESignaReader ( ) override = default ; void ExecuteInformation ( ) override ; void ExecuteDataWithInformation ( vtkDataObject * out , vtkInformation * outInfo ) override ; private : vtkGESignaReader ( const vtkGESignaReader & ) = delete ; void operator = ( const vtkGESignaReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
