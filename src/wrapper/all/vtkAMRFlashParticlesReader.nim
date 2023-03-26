## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRFlashParticlesReader.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkAMRFlashParticlesReader
##  @brief   A concrete instance of vtkAMRBaseParticlesReader that implements
##   functionality for reading flash particle datasets.
##

## !!!Ignored construct:  # vtkAMRFlashParticlesReader_h [NewLine] # vtkAMRFlashParticlesReader_h [NewLine] # vtkAMRBaseParticlesReader.h [NewLine] # vtkIOAMRModule.h  For export macro [NewLine] class vtkIndent ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
discard "forward decl of vtkPointData"
discard "forward decl of vtkIdList"
discard "forward decl of vtkFlashReaderInternal"
## !!!Ignored construct:  class VTKIOAMR_EXPORT vtkAMRFlashParticlesReader : public vtkAMRBaseParticlesReader { public : static vtkAMRFlashParticlesReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAMRBaseParticlesReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAMRBaseParticlesReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAMRFlashParticlesReader :: IsTypeOf ( type ) ; } static vtkAMRFlashParticlesReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAMRFlashParticlesReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAMRFlashParticlesReader * NewInstance ( ) const { return vtkAMRFlashParticlesReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAMRBaseParticlesReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRFlashParticlesReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRFlashParticlesReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  See vtkAMRBaseParticlesReader::GetTotalNumberOfParticles.
##  int GetTotalNumberOfParticles ( ) override ; protected : vtkAMRFlashParticlesReader ( ) ; ~ vtkAMRFlashParticlesReader ( ) override ; *
##  See vtkAMRBaseParticlesReader::ReadMetaData
##  void ReadMetaData ( ) override ; *
##  See vtkAMRBaseParticlesReader::SetupParticlesDataSelections
##  void SetupParticleDataSelections ( ) override ; *
##  See vtkAMRBaseParticlesReader::ReadParticles
##  vtkPolyData * ReadParticles ( const int blkidx ) override ; *
##  Reads the particlles of the given block from the given file.
##  vtkPolyData * GetParticles ( const char * file , const int blkidx ) ; vtkFlashReaderInternal * Internal ; private : vtkAMRFlashParticlesReader ( const vtkAMRFlashParticlesReader & ) = delete ; void operator = ( const vtkAMRFlashParticlesReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
