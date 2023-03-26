## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRFlashReader.h
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
##  @class   vtkAMREnzoReader
##  @brief   A concrete instance of vtkAMRBaseReader that implements functionality
##  for reading Flash AMR datasets.
##

## !!!Ignored construct:  # vtkAMRFlashReader_h [NewLine] # vtkAMRFlashReader_h [NewLine] # vtkAMRBaseReader.h [NewLine] # vtkIOAMRModule.h  For export macro [NewLine] class vtkOverlappingAMR ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFlashReaderInternal"
## !!!Ignored construct:  class VTKIOAMR_EXPORT vtkAMRFlashReader : public vtkAMRBaseReader { public : static vtkAMRFlashReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAMRBaseReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAMRBaseReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAMRFlashReader :: IsTypeOf ( type ) ; } static vtkAMRFlashReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAMRFlashReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAMRFlashReader * NewInstance ( ) const { return vtkAMRFlashReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAMRBaseReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRFlashReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRFlashReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  See vtkAMRBaseReader::GetNumberOfBlocks
##  int GetNumberOfBlocks ( ) override ; *
##  See vtkAMRBaseReader::GetNumberOfLevels
##  int GetNumberOfLevels ( ) override ; *
##  See vtkAMRBaseReader::SetFileName
##  void SetFileName ( VTK_FILEPATH const char * fileName ) override ; protected : vtkAMRFlashReader ( ) ; ~ vtkAMRFlashReader ( ) override ; *
##  See vtkAMRBaseReader::ReadMetaData
##  void ReadMetaData ( ) override ; *
##  See vtkAMRBaseReader::GetBlockLevel
##  int GetBlockLevel ( const int blockIdx ) override ; *
##  See vtkAMRBaseReader::FillMetaData
##  int FillMetaData ( ) override ; *
##  See vtkAMRBaseReader::GetAMRGrid
##  vtkUniformGrid * GetAMRGrid ( const int blockIdx ) override ; *
##  See vtkAMRBaseReader::GetAMRGridData
##  void GetAMRGridData ( const int blockIdx , vtkUniformGrid * block , const char * field ) override ; *
##  See vtkAMRBaseReader::GetAMRGridData
##  void GetAMRGridPointData ( const int vtkNotUsed ( blockIdx ) , vtkUniformGrid * vtkNotUsed ( block ) , const char * vtkNotUsed ( field ) ) override { ; } *
##  See vtkAMRBaseReader::SetUpDataArraySelections
##  void SetUpDataArraySelections ( ) override ; bool IsReady ; private : vtkAMRFlashReader ( const vtkAMRFlashReader & ) = delete ; void operator = ( const vtkAMRFlashReader & ) = delete ; void ComputeStats ( vtkFlashReaderInternal * internal , std :: vector < int > & numBlocks , double min [ 3 ] ) ; vtkFlashReaderInternal * Internal ; } ;
## Error: token expected: ; but got: [identifier]!!!
