## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAMReXGridReader.h
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
##  @class vtkAMReXGridReader
##  @brief reader for AMReX plotfiles grid data.
##
##  vtkAMReXGridReader readers grid data from AMReX plotfiles.
##

## !!!Ignored construct:  # vtkAMReXGridReader_h [NewLine] # vtkAMReXGridReader_h [NewLine] # vtkAMRBaseReader.h [NewLine] # vtkIOAMRModule.h  For export macro # vtkNew.h  for vtkNew [NewLine] # < string >  for std::string. # < vector >  for std::vector. [NewLine] class vtkOverlappingAMR ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkAMReXGridReaderInternal"
## !!!Ignored construct:  class VTKIOAMR_EXPORT vtkAMReXGridReader : public vtkAMRBaseReader { public : static vtkAMReXGridReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAMRBaseReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAMRBaseReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAMReXGridReader :: IsTypeOf ( type ) ; } static vtkAMReXGridReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAMReXGridReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAMReXGridReader * NewInstance ( ) const { return vtkAMReXGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAMRBaseReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMReXGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMReXGridReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  See vtkAMRBaseReader::GetNumberOfBlocks
##  int GetNumberOfBlocks ( ) override ; *
##  See vtkAMRBaseReader::GetNumberOfLevels
##  int GetNumberOfLevels ( ) override ; *
##  See vtkAMRBaseReader::SetFileName
##  void SetFileName ( VTK_FILEPATH const char * fileName ) override ; protected : vtkAMReXGridReader ( ) ; ~ vtkAMReXGridReader ( ) override ; *
##  See vtkAMRBaseReader::ReadMetaData
##  void ReadMetaData ( ) override ; *
##  See vtkAMRBaseReader::GetBlockLevel
##  int GetBlockLevel ( const int blockIdx ) override ; *
##  GetLevelBlockID
##
##  @param blockIdx
##
##  @return int representing block in level blockIdx is contained in
##  int GetLevelBlockID ( const int blockIdx ) ; *
##  See vtkAMRBaseReader::FillMetaData
##  int FillMetaData ( ) override ; *
##  See vtkAMRBaseReader::GetAMRGrid
##  vtkUniformGrid * GetAMRGrid ( const int blockIdx ) override ; *
##  See vtkAMRBaseReader::GetAMRGridData
##  void GetAMRGridData ( const int blockIdx , vtkUniformGrid * block , const char * field ) override ; *
##  See vtkAMRBaseReader::GetAMRGridData
##  Note: currently, nodal data is only supported in extra multifabs
##  void GetAMRGridPointData ( const int blockIdx , vtkUniformGrid * block , const char * field ) override ; *
##  See vtkAMRBaseReader::SetUpDataArraySelections
##  void SetUpDataArraySelections ( ) override ; int GetDimension ( ) ; bool IsReady ; private : vtkAMReXGridReader ( const vtkAMReXGridReader & ) = delete ; void operator = ( const vtkAMReXGridReader & ) = delete ; void ComputeStats ( vtkAMReXGridReaderInternal * internal , std :: vector < int > & numBlocks , double min [ 3 ] ) ; vtkAMReXGridReaderInternal * Internal ; } ;
## Error: token expected: ; but got: [identifier]!!!
