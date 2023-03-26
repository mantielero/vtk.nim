## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProgrammableElectronicData.h
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
##  @class   vtkProgrammableElectronicData
##  @brief   Provides access to and storage of
##  user-generated vtkImageData that describes electrons.
##

## !!!Ignored construct:  # vtkProgrammableElectronicData_h [NewLine] # vtkProgrammableElectronicData_h [NewLine] # vtkAbstractElectronicData.h [NewLine] # vtkDomainsChemistryModule.h  For export macro [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of StdVectorOfImageDataPointers"
## !!!Ignored construct:  class VTKDOMAINSCHEMISTRY_EXPORT vtkProgrammableElectronicData : public vtkAbstractElectronicData { public : static vtkProgrammableElectronicData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractElectronicData Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractElectronicData :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProgrammableElectronicData :: IsTypeOf ( type ) ; } static vtkProgrammableElectronicData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProgrammableElectronicData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProgrammableElectronicData * NewInstance ( ) const { return vtkProgrammableElectronicData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractElectronicData :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProgrammableElectronicData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProgrammableElectronicData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the number of molecular orbitals. Setting this will resize this
##  internal array of MOs.
##  vtkIdType GetNumberOfMOs ( ) override ; virtual void SetNumberOfMOs ( vtkIdType ) ; /@} /@{ *
##  Get/Set the number of electrons in the molecule. Needed for HOMO/LUMO
##  convenience functions
##  vtkIdType GetNumberOfElectrons ( ) override { return this -> NumberOfElectrons ; } virtual void SetNumberOfElectrons ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfElectrons  to  << _arg ) ; if ( this -> NumberOfElectrons != _arg ) { this -> NumberOfElectrons = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get/Set the vtkImageData for the requested molecular orbital.
##  vtkImageData * GetMO ( vtkIdType orbitalNumber ) override ; void SetMO ( vtkIdType orbitalNumber , vtkImageData * data ) ; /@} /@{ *
##  Get/Set the vtkImageData for the molecule's electron density.
##  vtkImageData * GetElectronDensity ( ) override { return this -> ElectronDensity ; } virtual void SetElectronDensity ( vtkImageData * ) ; /@} /@{ *
##  Set the padding around the molecule to which the cube extends. This
##  is used to determine the dataset bounds.
##  virtual void SetNumberOfElectronsPadding ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Padding  to  << _arg ) ; if ( this -> Padding != _arg ) { this -> Padding = _arg ; this -> Modified ( ) ; } } ; /@} *
##  Deep copies the data object into this.
##  void DeepCopy ( vtkDataObject * obj ) override ; protected : vtkProgrammableElectronicData ( ) ; ~ vtkProgrammableElectronicData ( ) override ; *
##  Electronic data set property
##  vtkIdType NumberOfElectrons ; /@{ *
##  Storage for the vtkImageData objects
##  StdVectorOfImageDataPointers * MOs ; vtkImageData * ElectronDensity ; /@} private : vtkProgrammableElectronicData ( const vtkProgrammableElectronicData & ) = delete ; void operator = ( const vtkProgrammableElectronicData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
