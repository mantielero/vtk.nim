## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkXMLHierarchicalDataReader.h
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
##  @class   vtkXMLHierarchicalDataReader
##  @brief   Reader for hierarchical datasets
##
##  vtkXMLHierarchicalDataReader reads the VTK XML hierarchical data file
##  format. XML hierarchical data files are meta-files that point to a list
##  of serial VTK XML files. When reading in parallel, it will distribute
##  sub-blocks among processor. If the number of sub-blocks is less than
##  the number of processors, some processors will not have any sub-blocks
##  for that level. If the number of sub-blocks is larger than the
##  number of processors, each processor will possibly have more than
##  1 sub-block.
##

## !!!Ignored construct:  # vtkXMLHierarchicalDataReader_h [NewLine] # vtkXMLHierarchicalDataReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLMultiGroupDataReader.h [NewLine] class vtkHierarchicalDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLHierarchicalDataReader : public vtkXMLMultiGroupDataReader { public : static vtkXMLHierarchicalDataReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLMultiGroupDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLMultiGroupDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLHierarchicalDataReader :: IsTypeOf ( type ) ; } static vtkXMLHierarchicalDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLHierarchicalDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLHierarchicalDataReader * NewInstance ( ) const { return vtkXMLHierarchicalDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLMultiGroupDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLHierarchicalDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLHierarchicalDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkXMLHierarchicalDataReader ( ) ; ~ vtkXMLHierarchicalDataReader ( ) override ;  Get the name of the data set being read. const char * GetDataSetName ( ) override { return vtkHierarchicalDataSet ; } private : vtkXMLHierarchicalDataReader ( const vtkXMLHierarchicalDataReader & ) = delete ; void operator = ( const vtkXMLHierarchicalDataReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
