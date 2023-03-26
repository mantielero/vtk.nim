## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDIMACSGraphReader.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkDIMACSGraphReader
##  @brief   reads vtkGraph data from a DIMACS
##  formatted file
##
##
##  vtkDIMACSGraphReader is a source object that reads vtkGraph data files
##  from a DIMACS format.
##
##  The reader has special handlers for max-flow and graph coloring problems,
##  which are specified in the problem line as 'max' and 'edge' respectively.
##  Other graphs are treated as generic DIMACS files.
##
##  DIMACS formatted files consist of lines in which the first character in
##  in column 0 specifies the type of the line.
##
##  Generic DIMACS files have the following line types:
##  - problem statement line : p graph num_verts num_edges
##  - node line (optional)   : n node_id node_weight
##  - edge line              : a src_id trg_id edge_weight
##  - alternate edge format  : e src_id trg_id edge_weight
##  - comment lines          : c I am a comment line
##  ** note, there should be one and only one problem statement line per file.
##
##
##  DIMACS graphs are undirected and nodes are numbered 1..n
##
##  See webpage for additional formatting details.
##  -  http://dimacs.rutgers.edu/Challenges/
##  -  http://www.dis.uniroma1.it/~challenge9/format.shtml
##
##  @sa
##  vtkDIMACSGraphWriter
##
##

## !!!Ignored construct:  # vtkDIMACSGraphReader_h [NewLine] # vtkDIMACSGraphReader_h [NewLine] # vtkGraphAlgorithm.h [NewLine] # vtkIOInfovisModule.h  For export macro # vtkStdString.h  For string API [NewLine] class VTKIOINFOVIS_EXPORT vtkDIMACSGraphReader : public vtkGraphAlgorithm { public : static vtkDIMACSGraphReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGraphAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGraphAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDIMACSGraphReader :: IsTypeOf ( type ) ; } static vtkDIMACSGraphReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDIMACSGraphReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDIMACSGraphReader * NewInstance ( ) const { return vtkDIMACSGraphReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDIMACSGraphReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDIMACSGraphReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The DIMACS file name.
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Vertex attribute array name
##  virtual char * GetVertexAttributeArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << VertexAttributeArrayName  of  << ( this -> VertexAttributeArrayName ? this -> VertexAttributeArrayName : (null) ) ) ; return this -> VertexAttributeArrayName ; } ; virtual void SetVertexAttributeArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VertexAttributeArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> VertexAttributeArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> VertexAttributeArrayName && _arg && ( ! strcmp ( this -> VertexAttributeArrayName , _arg ) ) ) { return ; } delete [ ] this -> VertexAttributeArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> VertexAttributeArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> VertexAttributeArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Edge attribute array name
##  virtual char * GetVertexAttributeArrayNameEdgeAttributeArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeAttributeArrayName  of  << ( this -> EdgeAttributeArrayName ? this -> EdgeAttributeArrayName : (null) ) ) ; return this -> EdgeAttributeArrayName ; } ; virtual void SetVertexAttributeArrayNameEdgeAttributeArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << EdgeAttributeArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> EdgeAttributeArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> EdgeAttributeArrayName && _arg && ( ! strcmp ( this -> EdgeAttributeArrayName , _arg ) ) ) { return ; } delete [ ] this -> EdgeAttributeArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> EdgeAttributeArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> EdgeAttributeArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} protected : vtkDIMACSGraphReader ( ) ; ~ vtkDIMACSGraphReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int buildGenericGraph ( vtkGraph * output , vtkStdString & defaultVertexAttrArrayName , vtkStdString & defaultEdgeAttrArrayName ) ; int buildColoringGraph ( vtkGraph * output ) ; int buildMaxflowGraph ( vtkGraph * output ) ; *
##  Creates directed or undirected output based on Directed flag.
##  int RequestDataObject ( vtkInformation * , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int ReadGraphMetaData ( ) ; private : bool fileOk ; bool Directed ; char * FileName ; char * VertexAttributeArrayName ; char * EdgeAttributeArrayName ; int numVerts ; int numEdges ; vtkStdString dimacsProblemStr ; vtkDIMACSGraphReader ( const vtkDIMACSGraphReader & ) = delete ; void operator = ( const vtkDIMACSGraphReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
