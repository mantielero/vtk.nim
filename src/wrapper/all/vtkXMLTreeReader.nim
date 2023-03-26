## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLTreeReader.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkXMLTreeReader
##  @brief   reads an XML file into a vtkTree
##
##
##  vtkXMLTreeReader parses an XML file and uses the nesting structure of the
##  XML tags to generate a tree.  Node attributes are assigned to node arrays,
##  and the special arrays .tagname and .chardata contain the tag type and the
##  text internal to the tag, respectively.  The arrays are of type
##  vtkStringArray.  There is an array for each attribute type in the XML file,
##  even if it appears in only one tag.  If an attribute is missing from a tag,
##  its value is the empty string.
##
##  If MaskArrays is on (the default is off), the filter will additionally make bit
##  arrays whose names are prepended with ".valid." which are 1 if the element
##  contains that attribute, and 0 otherwise.
##
##  For example, the XML file containing the text:
##  <pre>
##  &lt;node name="jeff" age="26"&gt;
##    this is text in jeff's node
##    &lt;node name="joe"&gt;
##      &lt;node name="al" initials="amb" other="something"/&gt;
##      &lt;node name="dave" age="30"/&gt;
##    &lt;/node&gt;
##    &lt;node name="lisa"&gt;this is text in lisa's node&lt;/node&gt;
##    &lt;node name="darlene" age="29"/&gt;
##  &lt;/node&gt;
##  </pre>
##
##  would be parsed into a tree with the following node IDs and structure:
##
##  <pre>
##  0 (jeff) - children: 1 (joe), 4 (lisa), 5 (darlene)
##  1 (joe)  - children: 2 (al), 3 (dave)
##  2 (al)
##  3 (dave)
##  4 (lisa)
##  5 (darlene)
##  </pre>
##
##  and the node data arrays would be as follows:
##
##  <pre>
##  name      initials  other     age       .tagname  .chardata
##  ------------------------------------------------------------------------------------------------
##  jeff      (empty)   (empty)   26         node     "  this is text in jeff's node\n  \n  \n  \n"
##  joe       (empty)   (empty)   (empty)    node     "\n    \n    \n  "
##  al        amb       something (empty)    node     (empty)
##  dave      (empty)   (empty)   30         node     (empty)
##  lisa      (empty)   (empty)   (empty)    node     "this is text in lisa's node"
##  darlene   (empty)   (empty)   29         node     (empty)
##  </pre>
##
##  There would also be the following bit arrays if MaskArrays is on:
##
##  <pre>
##  .valid.name   .valid.initials   .valid.other   .valid.age
##  ---------------------------------------------------------
##  1             0                 0              1
##  1             0                 0              0
##  1             1                 1              0
##  1             0                 0              1
##  1             0                 0              0
##  1             0                 0              1
##  </pre>
##

## !!!Ignored construct:  # vtkXMLTreeReader_h [NewLine] # vtkXMLTreeReader_h [NewLine] # vtkIOInfovisModule.h  For export macro # vtkTreeAlgorithm.h [NewLine] class VTKIOINFOVIS_EXPORT vtkXMLTreeReader : public vtkTreeAlgorithm { public : static vtkXMLTreeReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTreeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTreeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLTreeReader :: IsTypeOf ( type ) ; } static vtkXMLTreeReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLTreeReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLTreeReader * NewInstance ( ) const { return vtkXMLTreeReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTreeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLTreeReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLTreeReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  If set, reads in the XML file specified.
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  If set, and FileName is not set, reads in the XML string.
##  virtual char * GetXMLString ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << XMLString  of  << ( this -> XMLString ? this -> XMLString : (null) ) ) ; return this -> XMLString ; } ; virtual void SetXMLString ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << XMLString  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> XMLString == nullptr && _arg == nullptr ) { return ; } if ( this -> XMLString && _arg && ( ! strcmp ( this -> XMLString , _arg ) ) ) { return ; } delete [ ] this -> XMLString ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> XMLString = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> XMLString = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  The name of the edge pedigree ids. Default is "edge id".
##  virtual char * GetXMLStringEdgePedigreeIdArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << EdgePedigreeIdArrayName  of  << ( this -> EdgePedigreeIdArrayName ? this -> EdgePedigreeIdArrayName : (null) ) ) ; return this -> EdgePedigreeIdArrayName ; } ; virtual void SetXMLStringEdgePedigreeIdArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << EdgePedigreeIdArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> EdgePedigreeIdArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> EdgePedigreeIdArrayName && _arg && ( ! strcmp ( this -> EdgePedigreeIdArrayName , _arg ) ) ) { return ; } delete [ ] this -> EdgePedigreeIdArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> EdgePedigreeIdArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> EdgePedigreeIdArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  The name of the vertex pedigree ids. Default is "vertex id".
##  virtual char * GetXMLStringEdgePedigreeIdArrayNameVertexPedigreeIdArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << VertexPedigreeIdArrayName  of  << ( this -> VertexPedigreeIdArrayName ? this -> VertexPedigreeIdArrayName : (null) ) ) ; return this -> VertexPedigreeIdArrayName ; } ; virtual void SetXMLStringEdgePedigreeIdArrayNameVertexPedigreeIdArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VertexPedigreeIdArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> VertexPedigreeIdArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> VertexPedigreeIdArrayName && _arg && ( ! strcmp ( this -> VertexPedigreeIdArrayName , _arg ) ) ) { return ; } delete [ ] this -> VertexPedigreeIdArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> VertexPedigreeIdArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> VertexPedigreeIdArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Set whether to use an property from the XML file as pedigree ids (off),
##  or generate a new array with integer values starting at zero (on).
##  Default is on.
##  virtual void SetGenerateEdgePedigreeIds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateEdgePedigreeIds  to  << _arg ) ; if ( this -> GenerateEdgePedigreeIds != _arg ) { this -> GenerateEdgePedigreeIds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetGenerateEdgePedigreeIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateEdgePedigreeIds  of  << this -> GenerateEdgePedigreeIds ) ; return this -> GenerateEdgePedigreeIds ; } ; virtual void GenerateEdgePedigreeIdsOn ( ) { this -> SetGenerateEdgePedigreeIds ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateEdgePedigreeIdsOff ( ) { this -> SetGenerateEdgePedigreeIds ( static_cast < bool > ( 0 ) ) ; } ; virtual void SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateVertexPedigreeIds  to  << _arg ) ; if ( this -> GenerateVertexPedigreeIds != _arg ) { this -> GenerateVertexPedigreeIds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetGenerateEdgePedigreeIdsGenerateVertexPedigreeIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateVertexPedigreeIds  of  << this -> GenerateVertexPedigreeIds ) ; return this -> GenerateVertexPedigreeIds ; } ; virtual void GenerateVertexPedigreeIdsOn ( ) { this -> SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIds ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateVertexPedigreeIdsOff ( ) { this -> SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, makes bit arrays for each attribute with name .valid.attribute_name
##  for each attribute.  Default is off.
##  virtual bool GetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaskArrays  of  << this -> MaskArrays ) ; return this -> MaskArrays ; } ; virtual void SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArrays ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaskArrays  to  << _arg ) ; if ( this -> MaskArrays != _arg ) { this -> MaskArrays = _arg ; this -> Modified ( ) ; } } ; virtual void MaskArraysOn ( ) { this -> SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArrays ( static_cast < bool > ( 1 ) ) ; } virtual void MaskArraysOff ( ) { this -> SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArrays ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, stores the XML character data (i.e. textual data between tags)
##  into an array named CharDataField, otherwise this field is skipped.
##  Default is off.
##  virtual bool GetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArraysReadCharData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadCharData  of  << this -> ReadCharData ) ; return this -> ReadCharData ; } ; virtual void SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArraysReadCharData ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReadCharData  to  << _arg ) ; if ( this -> ReadCharData != _arg ) { this -> ReadCharData = _arg ; this -> Modified ( ) ; } } ; virtual void ReadCharDataOn ( ) { this -> SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArraysReadCharData ( static_cast < bool > ( 1 ) ) ; } virtual void ReadCharDataOff ( ) { this -> SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArraysReadCharData ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, stores the XML tag name data in a field called .tagname
##  otherwise this field is skipped.
##  Default is on.
##  virtual bool GetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArraysReadCharDataReadTagName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadTagName  of  << this -> ReadTagName ) ; return this -> ReadTagName ; } ; virtual void SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArraysReadCharDataReadTagName ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReadTagName  to  << _arg ) ; if ( this -> ReadTagName != _arg ) { this -> ReadTagName = _arg ; this -> Modified ( ) ; } } ; virtual void ReadTagNameOn ( ) { this -> SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArraysReadCharDataReadTagName ( static_cast < bool > ( 1 ) ) ; } virtual void ReadTagNameOff ( ) { this -> SetGenerateEdgePedigreeIdsGenerateVertexPedigreeIdsMaskArraysReadCharDataReadTagName ( static_cast < bool > ( 0 ) ) ; } ; /@} static const char * TagNameField ; static const char * CharDataField ; protected : vtkXMLTreeReader ( ) ; ~ vtkXMLTreeReader ( ) override ; char * FileName ; char * XMLString ; bool ReadCharData ; bool ReadTagName ; bool MaskArrays ; char * EdgePedigreeIdArrayName ; char * VertexPedigreeIdArrayName ; bool GenerateEdgePedigreeIds ; bool GenerateVertexPedigreeIds ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkXMLTreeReader ( const vtkXMLTreeReader & ) = delete ; void operator = ( const vtkXMLTreeReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
