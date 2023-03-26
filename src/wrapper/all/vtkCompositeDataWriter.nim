## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeDataWriter.h
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
##  @class   vtkCompositeDataWriter
##  @brief   legacy VTK file writer for vtkCompositeDataSet
##  subclasses.
##
##  vtkCompositeDataWriter is a writer for writing legacy VTK files for
##  vtkCompositeDataSet and subclasses.
##  @warning
##  This is an experimental format. Use XML-based formats for writing composite
##  datasets. Saving composite dataset in legacy VTK format is expected to change
##  in future including changes to the file layout.
##

## !!!Ignored construct:  # vtkCompositeDataWriter_h [NewLine] # vtkCompositeDataWriter_h [NewLine] # vtkDataWriter.h [NewLine] # vtkIOLegacyModule.h  For export macro [NewLine] class vtkCompositeDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkHierarchicalBoxDataSet"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkMultiPieceDataSet"
discard "forward decl of vtkNonOverlappingAMR"
discard "forward decl of vtkOverlappingAMR"
discard "forward decl of vtkPartitionedDataSet"
discard "forward decl of vtkPartitionedDataSetCollection"
## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkCompositeDataWriter : public vtkDataWriter { public : static vtkCompositeDataWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCompositeDataWriter :: IsTypeOf ( type ) ; } static vtkCompositeDataWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCompositeDataWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCompositeDataWriter * NewInstance ( ) const { return vtkCompositeDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeDataWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the input to this writer.
##  vtkCompositeDataSet * GetInput ( ) ; vtkCompositeDataSet * GetInput ( int port ) ; /@} protected : vtkCompositeDataWriter ( ) ; ~ vtkCompositeDataWriter ( ) override ; /@{ *
##  Performs the actual writing.
##  void WriteData ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; /@} bool WriteCompositeData ( ostream * , vtkMultiBlockDataSet * ) ; bool WriteCompositeData ( ostream * , vtkMultiPieceDataSet * ) ; bool WriteCompositeData ( ostream * , vtkHierarchicalBoxDataSet * ) ; bool WriteCompositeData ( ostream * , vtkOverlappingAMR * ) ; bool WriteCompositeData ( ostream * , vtkNonOverlappingAMR * ) ; bool WriteCompositeData ( ostream * , vtkPartitionedDataSet * ) ; bool WriteCompositeData ( ostream * , vtkPartitionedDataSetCollection * ) ; bool WriteBlock ( ostream * fp , vtkDataObject * block ) ; private : vtkCompositeDataWriter ( const vtkCompositeDataWriter & ) = delete ; void operator = ( const vtkCompositeDataWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
