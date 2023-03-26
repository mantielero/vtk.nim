## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkX3DExporterFIWriter.h
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
##  @class   vtkX3DExporterFIWriter
##
##

## !!!Ignored construct:  # vtkX3DExporterFIWriter_h [NewLine] # vtkX3DExporterFIWriter_h [NewLine] # vtkIOExportModule.h  For export macro # vtkX3DExporterWriter.h [NewLine] class vtkX3DExporterFIByteWriter ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkX3DExporterFINodeInfoStack"
discard "forward decl of vtkZLibDataCompressor"
## !!!Ignored construct:  class VTKIOEXPORT_EXPORT vtkX3DExporterFIWriter : public vtkX3DExporterWriter { public : static vtkX3DExporterFIWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkX3DExporterWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkX3DExporterWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkX3DExporterFIWriter :: IsTypeOf ( type ) ; } static vtkX3DExporterFIWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkX3DExporterFIWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkX3DExporterFIWriter * NewInstance ( ) const { return vtkX3DExporterFIWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkX3DExporterWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkX3DExporterFIWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkX3DExporterFIWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void CloseFile ( ) override ; int OpenFile ( const char * file ) override ; int OpenStream ( ) override ;  void Write(const char* str); void Flush ( ) override ; void StartDocument ( ) override ; void EndDocument ( ) override ;  Elements void StartNode ( int elementID ) override ; void EndNode ( ) override ;  Attributes
##  SFString / MFString
##  void SetField(int attributeID, const std::string &value); void SetField ( int attributeID , const char * , bool mfstring = false ) override ;  SFInt32 void SetField ( int attributeID , int ) override ;  SFFloat void SetField ( int attributeID , float ) override ;  SFDouble void SetField ( int attributeID , double ) override ;  SFBool void SetField ( int attributeID , bool ) override ;  For MFxxx attributes void SetField ( int attributeID , int type , const double * a ) override ; void SetField ( int attributeID , int type , vtkDataArray * a ) override ; void SetField ( int attributeID , const double * values , size_t size ) override ;  MFInt32 void SetField ( int attributeID , int type , vtkCellArray * a ) ; void SetField ( int attributeID , const int * values , size_t size , bool image = false ) override ; /@{ *
##  Use fastest instead of best compression
##  virtual void SetFastest ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Fastest  to  << _arg ) ; if ( this -> Fastest != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> Fastest = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetFastestMinValue ( ) { return 0 ; } virtual vtkTypeBool GetFastestMaxValue ( ) { return 1 ; } ; virtual void FastestOn ( ) { this -> SetFastest ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FastestOff ( ) { this -> SetFastest ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetFastest ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Fastest  of  << this -> Fastest ) ; return this -> Fastest ; } ; /@} protected : vtkX3DExporterFIWriter ( ) ; ~ vtkX3DExporterFIWriter ( ) override ; private : void StartAttribute ( int attributeID , bool literal , bool addToTable = false ) ; void EndAttribute ( ) ; void CheckNode ( bool callerIsAttribute = true ) ; bool IsLineFeedEncodingOn ;  int Depth; vtkX3DExporterFIByteWriter * Writer ; vtkX3DExporterFINodeInfoStack * InfoStack ; vtkZLibDataCompressor * Compressor ; vtkTypeBool Fastest ; vtkX3DExporterFIWriter ( const vtkX3DExporterFIWriter & ) = delete ; void operator = ( const vtkX3DExporterFIWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
