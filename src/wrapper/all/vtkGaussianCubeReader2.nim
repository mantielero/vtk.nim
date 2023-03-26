## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGaussianCubeReader2.h
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
##  @class   vtkGaussianCubeReader2
##  @brief   Read a Gaussian Cube file and output a
##  vtkMolecule object and a vtkImageData
##
##
##  @par Thanks:
##  Dr. Jean M. Favre who developed and contributed this class.
##

## !!!Ignored construct:  # vtkGaussianCubeReader2_h [NewLine] # vtkGaussianCubeReader2_h [NewLine] # vtkIOChemistryModule.h  For export macro # vtkMoleculeAlgorithm.h [NewLine] class vtkMolecule ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImageData"
## !!!Ignored construct:  class VTKIOCHEMISTRY_EXPORT vtkGaussianCubeReader2 : public vtkMoleculeAlgorithm { public : static vtkGaussianCubeReader2 * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMoleculeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMoleculeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGaussianCubeReader2 :: IsTypeOf ( type ) ; } static vtkGaussianCubeReader2 * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGaussianCubeReader2 * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGaussianCubeReader2 * NewInstance ( ) const { return vtkGaussianCubeReader2 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGaussianCubeReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGaussianCubeReader2 :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the output (vtkMolecule) that the reader will fill
##  vtkMolecule * GetOutput ( ) ; void SetOutput ( vtkMolecule * ) override ; /@} *
##  Get/Set the output (vtkImageData) that the reader will fill
##  vtkImageData * GetGridOutput ( ) ; /@{ *
##  Get/Set the name of the CML file
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} protected : vtkGaussianCubeReader2 ( ) ; ~ vtkGaussianCubeReader2 ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; char * FileName ; private : vtkGaussianCubeReader2 ( const vtkGaussianCubeReader2 & ) = delete ; void operator = ( const vtkGaussianCubeReader2 & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
