## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMedicalImageReader2.h
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
##  @class   vtkMedicalImageReader2
##  @brief   vtkImageReader2 with medical meta data.
##
##  vtkMedicalImageReader2 is a parent class for medical image readers.
##  It provides a place to store patient information that may be stored
##  in the image header.
##  @sa
##  vtkImageReader2 vtkGESignaReader vtkMedicalImageProperties
##

## !!!Ignored construct:  # vtkMedicalImageReader2_h [NewLine] # vtkMedicalImageReader2_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageReader2.h [NewLine] class vtkMedicalImageProperties ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOIMAGE_EXPORT vtkMedicalImageReader2 : public vtkImageReader2 { public : static vtkMedicalImageReader2 * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageReader2 Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageReader2 :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMedicalImageReader2 :: IsTypeOf ( type ) ; } static vtkMedicalImageReader2 * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMedicalImageReader2 * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMedicalImageReader2 * NewInstance ( ) const { return vtkMedicalImageReader2 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMedicalImageReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMedicalImageReader2 :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the medical image properties object
##  virtual vtkMedicalImageProperties * GetnameMedicalImageProperties ( ) { vtkDebugWithObjectMacro ( this , <<  returning  MedicalImageProperties  address  << static_cast < vtkMedicalImageProperties * > ( this -> MedicalImageProperties ) ) ; return this -> MedicalImageProperties ; } ; /@} /@{ *
##  For backward compatibility, propagate calls to the MedicalImageProperties
##  object.
##  virtual void SetPatientName ( const char * ) ; virtual const char * GetPatientName ( ) ; virtual void SetPatientID ( const char * ) ; virtual const char * GetPatientID ( ) ; virtual void SetDate ( const char * ) ; virtual const char * GetDate ( ) ; virtual void SetSeries ( const char * ) ; virtual const char * GetSeries ( ) ; virtual void SetStudy ( const char * ) ; virtual const char * GetStudy ( ) ; virtual void SetImageNumber ( const char * ) ; virtual const char * GetImageNumber ( ) ; virtual void SetModality ( const char * ) ; virtual const char * GetModality ( ) ; /@} protected : vtkMedicalImageReader2 ( ) ; ~ vtkMedicalImageReader2 ( ) override ; *
##  Medical Image properties
##  vtkMedicalImageProperties * MedicalImageProperties ; private : vtkMedicalImageReader2 ( const vtkMedicalImageReader2 & ) = delete ; void operator = ( const vtkMedicalImageReader2 & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
