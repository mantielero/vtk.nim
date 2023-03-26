## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPDBReader.h
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
##  @class   vtkPDBReader
##  @brief   read Molecular Data files
##
##  vtkPDBReader is a source object that reads Molecule files
##  The FileName must be specified
##
##  @par Thanks:
##  Dr. Jean M. Favre who developed and contributed this class
##

## !!!Ignored construct:  # vtkPDBReader_h [NewLine] # vtkPDBReader_h [NewLine] # vtkIOChemistryModule.h  For export macro # vtkMoleculeReaderBase.h [NewLine] class VTKIOCHEMISTRY_EXPORT vtkPDBReader : public vtkMoleculeReaderBase { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMoleculeReaderBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMoleculeReaderBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPDBReader :: IsTypeOf ( type ) ; } static vtkPDBReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPDBReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPDBReader * NewInstance ( ) const { return vtkPDBReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeReaderBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPDBReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPDBReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPDBReader * New ( ) ; protected : vtkPDBReader ( ) ; ~ vtkPDBReader ( ) override ; void ReadSpecificMolecule ( FILE * fp ) override ; private : vtkPDBReader ( const vtkPDBReader & ) = delete ; void operator = ( const vtkPDBReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
