## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkXMLPartitionedDataSetReader.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkXMLPartitionedDataSetReader
##  @brief   Reader for partitioned datasets
##
##  vtkXMLPartitionedDataSetReader reads the VTK XML partitioned dataset file
##  format. XML partitioned dataset files are meta-files that point to a list
##  of serial VTK XML files. When reading in parallel, it will distribute
##  sub-blocks among processors. If the number of sub-blocks is less than
##  the number of processors, some processors will not have any sub-blocks
##  for that block. If the number of sub-blocks is larger than the
##  number of processors, each processor will possibly have more than
##  1 sub-block.
##

## !!!Ignored construct:  # vtkXMLPartitionedDataSetReader_h [NewLine] # vtkXMLPartitionedDataSetReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLCompositeDataReader.h [NewLine] class vtkMultiBlockDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLPartitionedDataSetReader : public vtkXMLCompositeDataReader { public : static vtkXMLPartitionedDataSetReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLCompositeDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLCompositeDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPartitionedDataSetReader :: IsTypeOf ( type ) ; } static vtkXMLPartitionedDataSetReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPartitionedDataSetReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPartitionedDataSetReader * NewInstance ( ) const { return vtkXMLPartitionedDataSetReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLCompositeDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPartitionedDataSetReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPartitionedDataSetReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkXMLPartitionedDataSetReader ( ) ; ~ vtkXMLPartitionedDataSetReader ( ) override ;  Read the XML element for the subtree of a the composite dataset.
##  dataSetIndex is used to rank the leaf nodes in an inorder traversal. void ReadComposite ( vtkXMLDataElement * element , vtkCompositeDataSet * composite , const char * filePath , unsigned int & dataSetIndex ) override ;  Get the name of the data set being read. const char * GetDataSetName ( ) override ; int FillOutputPortInformation ( int , vtkInformation * info ) override ; private : vtkXMLPartitionedDataSetReader ( const vtkXMLPartitionedDataSetReader & ) = delete ; void operator = ( const vtkXMLPartitionedDataSetReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
