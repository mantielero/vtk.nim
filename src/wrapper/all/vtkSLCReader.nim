## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSLCReader.h
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
##  @class   vtkSLCReader
##  @brief   read an SLC volume file.
##
##  vtkSLCReader reads an SLC file and creates a structured point dataset.
##  The size of the volume and the data spacing is set from the SLC file
##  header.
##

## !!!Ignored construct:  # vtkSLCReader_h [NewLine] # vtkSLCReader_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageReader2.h [NewLine] class VTKIOIMAGE_EXPORT vtkSLCReader : public vtkImageReader2 { public : static vtkSLCReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageReader2 Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageReader2 :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSLCReader :: IsTypeOf ( type ) ; } static vtkSLCReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSLCReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSLCReader * NewInstance ( ) const { return vtkSLCReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSLCReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSLCReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Was there an error on the last read performed?
##  virtual int GetError ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Error  of  << this -> Error ) ; return this -> Error ; } ; /@} *
##  Is the given file an SLC file?
##  int CanReadFile ( VTK_FILEPATH const char * fname ) override ; *
##  .slc
##  const char * GetFileExtensions ( ) override { return .slc ; } *
##  SLC
##  const char * GetDescriptiveName ( ) override { return SLC ; } protected : vtkSLCReader ( ) ; ~ vtkSLCReader ( ) override ;  Reads the file name and builds a vtkStructuredPoints dataset. void ExecuteDataWithInformation ( vtkDataObject * , vtkInformation * ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ;  Decodes an array of eight bit run-length encoded data. unsigned char * Decode8BitData ( unsigned char * in_ptr , int size ) ; int Error ; private : vtkSLCReader ( const vtkSLCReader & ) = delete ; void operator = ( const vtkSLCReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
