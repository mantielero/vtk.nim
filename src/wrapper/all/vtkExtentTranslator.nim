## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtentTranslator.h
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
##  @class   vtkExtentTranslator
##  @brief   Generates a structured extent from unstructured.
##
##
##  vtkExtentTranslator generates a structured extent from an unstructured
##  extent.  It uses a recursive scheme that splits the largest axis.  A hard
##  coded extent can be used for a starting point.
##

import
  vtkCommonExecutionModelModule, vtkObject

discard "forward decl of vtkInformationIntegerRequestKey"
discard "forward decl of vtkInformationIntegerKey"
type
  vtkExtentTranslator* {.importcpp: "vtkExtentTranslator",
                        header: "vtkExtentTranslator.h", bycopy.} = object of vtkObject
    vtkExtentTranslator* {.importc: "vtkExtentTranslator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtentTranslator {.importcpp: "vtkExtentTranslator::New(@)",
                                   header: "vtkExtentTranslator.h".}
type
  vtkExtentTranslatorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtentTranslator::IsTypeOf(@)", header: "vtkExtentTranslator.h".}
proc IsA*(this: var vtkExtentTranslator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtentTranslator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtentTranslator {.
    importcpp: "vtkExtentTranslator::SafeDownCast(@)",
    header: "vtkExtentTranslator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtentTranslator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtentTranslator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtentTranslator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtentTranslator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtentTranslator.h".}
proc SetWholeExtent*(this: var vtkExtentTranslator; _arg1: cint; _arg2: cint;
                    _arg3: cint; _arg4: cint; _arg5: cint; _arg6: cint) {.
    importcpp: "SetWholeExtent", header: "vtkExtentTranslator.h".}
proc SetWholeExtent*(this: var vtkExtentTranslator; _arg: array[6, cint]) {.
    importcpp: "SetWholeExtent", header: "vtkExtentTranslator.h".}
## !!!Ignored construct:  virtual int * GetWholeExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  pointer  << this -> WholeExtent ) ; return this -> WholeExtent ; } VTK_WRAPEXCLUDE virtual void GetWholeExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> WholeExtent [ 0 ] ; _arg2 = this -> WholeExtent [ 1 ] ; _arg3 = this -> WholeExtent [ 2 ] ; _arg4 = this -> WholeExtent [ 3 ] ; _arg5 = this -> WholeExtent [ 4 ] ; _arg6 = this -> WholeExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWholeExtent ( int _arg [ 6 ] ) { this -> GetWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetWholeExtentExtent*(this: var vtkExtentTranslator; _arg1: cint; _arg2: cint;
                          _arg3: cint; _arg4: cint; _arg5: cint; _arg6: cint) {.
    importcpp: "SetWholeExtentExtent", header: "vtkExtentTranslator.h".}
proc SetWholeExtentExtent*(this: var vtkExtentTranslator; _arg: array[6, cint]) {.
    importcpp: "SetWholeExtentExtent", header: "vtkExtentTranslator.h".}
## !!!Ignored construct:  virtual int * GetWholeExtentExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Extent  pointer  << this -> Extent ) ; return this -> Extent ; } VTK_WRAPEXCLUDE virtual void GetWholeExtentExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> Extent [ 0 ] ; _arg2 = this -> Extent [ 1 ] ; _arg3 = this -> Extent [ 2 ] ; _arg4 = this -> Extent [ 3 ] ; _arg5 = this -> Extent [ 4 ] ; _arg6 = this -> Extent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Extent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWholeExtentExtent ( int _arg [ 6 ] ) { this -> GetWholeExtentExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetPiece*(this: var vtkExtentTranslator; _arg: cint) {.importcpp: "SetPiece",
    header: "vtkExtentTranslator.h".}
## !!!Ignored construct:  virtual int GetPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Piece  of  << this -> Piece ) ; return this -> Piece ; } ;
## Error: expected ';'!!!

proc SetPieceNumberOfPieces*(this: var vtkExtentTranslator; _arg: cint) {.
    importcpp: "SetPieceNumberOfPieces", header: "vtkExtentTranslator.h".}
## !!!Ignored construct:  virtual int GetPieceNumberOfPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPieces  of  << this -> NumberOfPieces ) ; return this -> NumberOfPieces ; } ;
## Error: expected ';'!!!

proc SetPieceNumberOfPiecesGhostLevel*(this: var vtkExtentTranslator; _arg: cint) {.
    importcpp: "SetPieceNumberOfPiecesGhostLevel", header: "vtkExtentTranslator.h".}
## !!!Ignored construct:  virtual int GetPieceNumberOfPiecesGhostLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostLevel  of  << this -> GhostLevel ) ; return this -> GhostLevel ; } ;
## Error: expected ';'!!!

proc PieceToExtent*(this: var vtkExtentTranslator): cint {.
    importcpp: "PieceToExtent", header: "vtkExtentTranslator.h".}
proc PieceToExtentByPoints*(this: var vtkExtentTranslator): cint {.
    importcpp: "PieceToExtentByPoints", header: "vtkExtentTranslator.h".}
proc PieceToExtentThreadSafe*(this: var vtkExtentTranslator; piece: cint;
                             numPieces: cint; ghostLevel: cint;
                             wholeExtent: ptr cint; resultExtent: ptr cint;
                             splitMode: cint; byPoints: cint): cint {.
    importcpp: "PieceToExtentThreadSafe", header: "vtkExtentTranslator.h".}
proc SetSplitModeToBlock*(this: var vtkExtentTranslator) {.
    importcpp: "SetSplitModeToBlock", header: "vtkExtentTranslator.h".}
proc SetSplitModeToXSlab*(this: var vtkExtentTranslator) {.
    importcpp: "SetSplitModeToXSlab", header: "vtkExtentTranslator.h".}
proc SetSplitModeToYSlab*(this: var vtkExtentTranslator) {.
    importcpp: "SetSplitModeToYSlab", header: "vtkExtentTranslator.h".}
proc SetSplitModeToZSlab*(this: var vtkExtentTranslator) {.
    importcpp: "SetSplitModeToZSlab", header: "vtkExtentTranslator.h".}
## !!!Ignored construct:  virtual int GetPieceNumberOfPiecesGhostLevelSplitMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SplitMode  of  << this -> SplitMode ) ; return this -> SplitMode ; } ;
## Error: expected ';'!!!

proc SetSplitPath*(this: var vtkExtentTranslator; len: cint; splitpath: ptr cint) {.
    importcpp: "SetSplitPath", header: "vtkExtentTranslator.h".}
type
  vtkExtentTranslatorModes* {.size: sizeof(cint),
                             importcpp: "vtkExtentTranslator::Modes",
                             header: "vtkExtentTranslator.h".} = enum
    X_SLAB_MODE = 0, Y_SLAB_MODE = 1, Z_SLAB_MODE = 2, BLOCK_MODE = 3


proc UPDATE_SPLIT_MODE*(): ptr vtkInformationIntegerRequestKey {.
    importcpp: "vtkExtentTranslator::UPDATE_SPLIT_MODE(@)",
    header: "vtkExtentTranslator.h".}