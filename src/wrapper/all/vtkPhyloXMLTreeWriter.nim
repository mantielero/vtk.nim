## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPhyloXMLTreeWriter.h
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
##  @class   vtkPhyloXMLTreeWriter
##  @brief   write vtkTree data to PhyloXML format.
##
##  vtkPhyloXMLTreeWriter is writes a vtkTree to a PhyloXML formatted file
##  or string.
##

## !!!Ignored construct:  # vtkPhyloXMLTreeWriter_h [NewLine] # vtkPhyloXMLTreeWriter_h [NewLine] # vtkIOInfovisModule.h  For export macro # vtkSmartPointer.h  For SP ivars # vtkStdString.h  For get/set ivars # vtkXMLWriter.h [NewLine] class vtkStringArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkTree"
discard "forward decl of vtkXMLDataElement"
## !!!Ignored construct:  class VTKIOINFOVIS_EXPORT vtkPhyloXMLTreeWriter : public vtkXMLWriter { public : static vtkPhyloXMLTreeWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPhyloXMLTreeWriter :: IsTypeOf ( type ) ; } static vtkPhyloXMLTreeWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPhyloXMLTreeWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPhyloXMLTreeWriter * NewInstance ( ) const { return vtkPhyloXMLTreeWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPhyloXMLTreeWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPhyloXMLTreeWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the input to this writer.
##  vtkTree * GetInput ( ) ; vtkTree * GetInput ( int port ) ; /@} *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; /@{ *
##  Get/Set the name of the input's tree edge weight array.
##  This array must be part of the input tree's EdgeData.
##  The default name is "weight".  If this array cannot be
##  found, then no edge weights will be included in the
##  output of this writer.
##  virtual vtkStdString GetEdgeWeightArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeWeightArrayName  of  << this -> EdgeWeightArrayName ) ; return this -> EdgeWeightArrayName ; } ; virtual void SetEdgeWeightArrayName ( vtkStdString _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EdgeWeightArrayName  to  << _arg ) ; if ( this -> EdgeWeightArrayName != _arg ) { this -> EdgeWeightArrayName = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get/Set the name of the input's tree node name array.
##  This array must be part of the input tree's VertexData.
##  The default name is "node name".  If this array cannot
##  be found, then no node names will be included in the
##  output of this writer.
##  virtual vtkStdString GetEdgeWeightArrayNameNodeNameArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NodeNameArrayName  of  << this -> NodeNameArrayName ) ; return this -> NodeNameArrayName ; } ; virtual void SetEdgeWeightArrayNameNodeNameArrayName ( vtkStdString _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NodeNameArrayName  to  << _arg ) ; if ( this -> NodeNameArrayName != _arg ) { this -> NodeNameArrayName = _arg ; this -> Modified ( ) ; } } ; /@} *
##  Do not include name the VertexData array in the PhyloXML output
##  of this writer.  Call this function once for each array that
##  you wish to ignore.
##  void IgnoreArray ( const char * arrayName ) ; protected : vtkPhyloXMLTreeWriter ( ) ; ~ vtkPhyloXMLTreeWriter ( ) override = default ; int WriteData ( ) override ; const char * GetDataSetName ( ) override ; int StartFile ( ) override ; int EndFile ( ) override ; *
##  Check for an optional, tree-level element and write it out if it is
##  found.
##  void WriteTreeLevelElement ( vtkTree * input , vtkXMLDataElement * rootElement , const char * elementName , const char * attributeName ) ; *
##  Search for any tree-level properties and write them out if they are found.
##  void WriteTreeLevelProperties ( vtkTree * input , vtkXMLDataElement * rootElement ) ; *
##  Convert one vertex to PhyloXML.  This function calls itself recursively
##  for any children of the input vertex.
##  void WriteCladeElement ( vtkTree * const input , vtkIdType vertex , vtkXMLDataElement * parentElement ) ; *
##  Write the branch length attribute for the specified vertex.
##  void WriteBranchLengthAttribute ( vtkTree * const input , vtkIdType vertex , vtkXMLDataElement * element ) ; *
##  Write the name element for the specified vertex.
##  void WriteNameElement ( vtkIdType vertex , vtkXMLDataElement * element ) ; *
##  Write the confidence element for the specified vertex.
##  void WriteConfidenceElement ( vtkTree * const input , vtkIdType vertex , vtkXMLDataElement * element ) ; *
##  Write the color element and its subelements (red, green, blue)
##  for the specified vertex.
##  void WriteColorElement ( vtkTree * const input , vtkIdType vertex , vtkXMLDataElement * element ) ; *
##  Write a property element as a child of the specified vtkXMLDataElement.
##  void WritePropertyElement ( vtkAbstractArray * array , vtkIdType vertex , vtkXMLDataElement * element ) ; *
##  Get the value of the requested attribute from the specified array's
##  vtkInformation.
##  const char * GetArrayAttribute ( vtkAbstractArray * array , const char * attributeName ) ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkInformation * InputInformation ; vtkStdString EdgeWeightArrayName ; vtkStdString NodeNameArrayName ; vtkAbstractArray * EdgeWeightArray ; vtkAbstractArray * NodeNameArray ; vtkSmartPointer < vtkStringArray > Blacklist ; private : vtkPhyloXMLTreeWriter ( const vtkPhyloXMLTreeWriter & ) = delete ; void operator = ( const vtkPhyloXMLTreeWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
