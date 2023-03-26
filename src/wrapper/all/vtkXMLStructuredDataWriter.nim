## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLStructuredDataWriter.h
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
##  @class   vtkXMLStructuredDataWriter
##  @brief   Superclass for VTK XML structured data writers.
##
##  vtkXMLStructuredDataWriter provides VTK XML writing functionality that
##  is common among all the structured data formats.
##

import
  vtkIOXMLModule, vtkXMLWriter

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
type
  vtkXMLStructuredDataWriter* {.importcpp: "vtkXMLStructuredDataWriter",
                               header: "vtkXMLStructuredDataWriter.h", bycopy.} = object of vtkXMLWriter
    vtkXMLStructuredDataWriter* {.importc: "vtkXMLStructuredDataWriter".}: VTK_NEWINSTANCE
    ##  The actual extent of the input to write.
    ##  Number of pieces used for streaming.
    ##  Appended data offsets of point and cell data arrays.
    ##  Store offset position (add TimeStep support)

  vtkXMLStructuredDataWriterSuperclass* = vtkXMLWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLStructuredDataWriter::IsTypeOf(@)",
    header: "vtkXMLStructuredDataWriter.h".}
proc IsA*(this: var vtkXMLStructuredDataWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLStructuredDataWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLStructuredDataWriter {.
    importcpp: "vtkXMLStructuredDataWriter::SafeDownCast(@)",
    header: "vtkXMLStructuredDataWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLStructuredDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLStructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLStructuredDataWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLStructuredDataWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLStructuredDataWriter.h".}
proc SetNumberOfPieces*(this: var vtkXMLStructuredDataWriter; _arg: cint) {.
    importcpp: "SetNumberOfPieces", header: "vtkXMLStructuredDataWriter.h".}
## !!!Ignored construct:  virtual int GetNumberOfPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPieces  of  << this -> NumberOfPieces ) ; return this -> NumberOfPieces ; } ;
## Error: expected ';'!!!

proc SetNumberOfPiecesWritePiece*(this: var vtkXMLStructuredDataWriter; _arg: cint) {.
    importcpp: "SetNumberOfPiecesWritePiece",
    header: "vtkXMLStructuredDataWriter.h".}
## !!!Ignored construct:  virtual int GetNumberOfPiecesWritePiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WritePiece  of  << this -> WritePiece ) ; return this -> WritePiece ; } ;
## Error: expected ';'!!!

proc SetNumberOfPiecesWritePieceGhostLevel*(this: var vtkXMLStructuredDataWriter;
    _arg: cint) {.importcpp: "SetNumberOfPiecesWritePieceGhostLevel",
                header: "vtkXMLStructuredDataWriter.h".}
## !!!Ignored construct:  virtual int GetNumberOfPiecesWritePieceGhostLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostLevel  of  << this -> GhostLevel ) ; return this -> GhostLevel ; } ;
## Error: expected ';'!!!

proc SetWriteExtent*(this: var vtkXMLStructuredDataWriter; _arg1: cint; _arg2: cint;
                    _arg3: cint; _arg4: cint; _arg5: cint; _arg6: cint) {.
    importcpp: "SetWriteExtent", header: "vtkXMLStructuredDataWriter.h".}
proc SetWriteExtent*(this: var vtkXMLStructuredDataWriter; _arg: array[6, cint]) {.
    importcpp: "SetWriteExtent", header: "vtkXMLStructuredDataWriter.h".}
## !!!Ignored construct:  virtual int * GetWriteExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WriteExtent  pointer  << this -> WriteExtent ) ; return this -> WriteExtent ; } VTK_WRAPEXCLUDE virtual void GetWriteExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> WriteExtent [ 0 ] ; _arg2 = this -> WriteExtent [ 1 ] ; _arg3 = this -> WriteExtent [ 2 ] ; _arg4 = this -> WriteExtent [ 3 ] ; _arg5 = this -> WriteExtent [ 4 ] ; _arg6 = this -> WriteExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WriteExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWriteExtent ( int _arg [ 6 ] ) { this -> GetWriteExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!
