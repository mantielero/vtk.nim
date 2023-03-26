## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDicer.h
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
##  @class   vtkDicer
##  @brief   abstract superclass to divide dataset into pieces
##
##  Subclasses of vtkDicer divides the input dataset into separate
##  pieces.  These pieces can then be operated on by other filters
##  (e.g., vtkThreshold). One application is to break very large
##  polygonal models into pieces and performing viewing and occlusion
##  culling on the pieces. Multiple pieces can also be streamed through
##  the visualization pipeline.
##
##  To use this filter, you must specify the execution mode of the
##  filter; i.e., set the way that the piece size is controlled (do
##  this by setting the DiceMode ivar). The filter does not change the
##  geometry or topology of the input dataset, rather it generates
##  integer numbers that indicate which piece a particular point
##  belongs to (i.e., it modifies the point and cell attribute
##  data). The integer number can be placed into the output scalar
##  data, or the output field data.
##
##  @warning
##  The number of pieces generated may not equal the specified number
##  of pieces. Use the method GetNumberOfActualPieces() after filter
##  execution to get the actual number of pieces generated.
##
##  @sa
##  vtkOBBDicer vtkConnectedDicer vtkSpatialDicer
##

import
  vtkDataSetAlgorithm, vtkFiltersGeneralModule

const
  VTK_DICE_MODE_NUMBER_OF_POINTS* = 0
  VTK_DICE_MODE_SPECIFIED_NUMBER* = 1
  VTK_DICE_MODE_MEMORY_LIMIT* = 2

type
  vtkDicer* {.importcpp: "vtkDicer", header: "vtkDicer.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkDicer* {.importc: "vtkDicer".}: VTK_NEWINSTANCE

  vtkDicerSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkDicer::IsTypeOf(@)",
    header: "vtkDicer.h".}
proc IsA*(this: var vtkDicer; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDicer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDicer {.
    importcpp: "vtkDicer::SafeDownCast(@)", header: "vtkDicer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDicer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDicer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDicer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDicer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDicer.h".}
proc SetFieldData*(this: var vtkDicer; _arg: vtkTypeBool) {.importcpp: "SetFieldData",
    header: "vtkDicer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFieldData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldData  of  << this -> FieldData ) ; return this -> FieldData ; } ;
## Error: expected ';'!!!

proc FieldDataOn*(this: var vtkDicer) {.importcpp: "FieldDataOn", header: "vtkDicer.h".}
proc FieldDataOff*(this: var vtkDicer) {.importcpp: "FieldDataOff",
                                     header: "vtkDicer.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the method to determine how many pieces the data should be
  ##  broken into. By default, the number of points per piece is used.
  ##
proc SetDiceMode*(this: var vtkDicer; _arg: cint) {.importcpp: "SetDiceMode",
    header: "vtkDicer.h".}
proc GetDiceModeMinValue*(this: var vtkDicer): cint {.
    importcpp: "GetDiceModeMinValue", header: "vtkDicer.h".}
proc GetDiceModeMaxValue*(this: var vtkDicer): cint {.
    importcpp: "GetDiceModeMaxValue", header: "vtkDicer.h".}
## !!!Ignored construct:  virtual int GetFieldDataDiceMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DiceMode  of  << this -> DiceMode ) ; return this -> DiceMode ; } ;
## Error: expected ';'!!!

proc SetDiceModeToNumberOfPointsPerPiece*(this: var vtkDicer) {.
    importcpp: "SetDiceModeToNumberOfPointsPerPiece", header: "vtkDicer.h".}
proc SetDiceModeToSpecifiedNumberOfPieces*(this: var vtkDicer) {.
    importcpp: "SetDiceModeToSpecifiedNumberOfPieces", header: "vtkDicer.h".}
proc SetDiceModeToMemoryLimitPerPiece*(this: var vtkDicer) {.
    importcpp: "SetDiceModeToMemoryLimitPerPiece", header: "vtkDicer.h".}
## !!!Ignored construct:  /@} /@{ *
##  Use the following method after the filter has updated to
##  determine the actual number of pieces the data was separated
##  into.
##  virtual int GetFieldDataDiceModeNumberOfActualPiecesNumberOfActualPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfActualPieces  of  << this -> NumberOfActualPieces ) ; return this -> NumberOfActualPieces ; } ;
## Error: expected ';'!!!

proc SetDiceModeNumberOfPointsPerPiece*(this: var vtkDicer; _arg: cint) {.
    importcpp: "SetDiceModeNumberOfPointsPerPiece", header: "vtkDicer.h".}
proc GetDiceModeMinValueNumberOfPointsPerPieceMinValue*(this: var vtkDicer): cint {.
    importcpp: "GetDiceModeMinValueNumberOfPointsPerPieceMinValue",
    header: "vtkDicer.h".}
proc GetDiceModeMaxValueNumberOfPointsPerPieceMaxValue*(this: var vtkDicer): cint {.
    importcpp: "GetDiceModeMaxValueNumberOfPointsPerPieceMaxValue",
    header: "vtkDicer.h".}
## !!!Ignored construct:  virtual int GetFieldDataDiceModeNumberOfActualPiecesNumberOfActualPiecesNumberOfPointsPerPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPointsPerPiece  of  << this -> NumberOfPointsPerPiece ) ; return this -> NumberOfPointsPerPiece ; } ;
## Error: expected ';'!!!

proc SetDiceModeNumberOfPointsPerPieceNumberOfPieces*(this: var vtkDicer; _arg: cint) {.
    importcpp: "SetDiceModeNumberOfPointsPerPieceNumberOfPieces",
    header: "vtkDicer.h".}
proc GetDiceModeMinValueNumberOfPointsPerPieceMinValueNumberOfPiecesMinValue*(
    this: var vtkDicer): cint {.importcpp: "GetDiceModeMinValueNumberOfPointsPerPieceMinValueNumberOfPiecesMinValue",
                            header: "vtkDicer.h".}
proc GetDiceModeMaxValueNumberOfPointsPerPieceMaxValueNumberOfPiecesMaxValue*(
    this: var vtkDicer): cint {.importcpp: "GetDiceModeMaxValueNumberOfPointsPerPieceMaxValueNumberOfPiecesMaxValue",
                            header: "vtkDicer.h".}
## !!!Ignored construct:  virtual int GetFieldDataDiceModeNumberOfActualPiecesNumberOfActualPiecesNumberOfPointsPerPieceNumberOfPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPieces  of  << this -> NumberOfPieces ) ; return this -> NumberOfPieces ; } ;
## Error: expected ';'!!!

proc SetDiceModeNumberOfPointsPerPieceNumberOfPiecesMemoryLimit*(
    this: var vtkDicer; _arg: culong) {.importcpp: "SetDiceModeNumberOfPointsPerPieceNumberOfPiecesMemoryLimit",
                                   header: "vtkDicer.h".}
proc GetDiceModeMinValueNumberOfPointsPerPieceMinValueNumberOfPiecesMinValueMemoryLimitMinValue*(
    this: var vtkDicer): culong {.importcpp: "GetDiceModeMinValueNumberOfPointsPerPieceMinValueNumberOfPiecesMinValueMemoryLimitMinValue",
                              header: "vtkDicer.h".}
proc GetDiceModeMaxValueNumberOfPointsPerPieceMaxValueNumberOfPiecesMaxValueMemoryLimitMaxValue*(
    this: var vtkDicer): culong {.importcpp: "GetDiceModeMaxValueNumberOfPointsPerPieceMaxValueNumberOfPiecesMaxValueMemoryLimitMaxValue",
                              header: "vtkDicer.h".}
## !!!Ignored construct:  virtual unsigned long GetFieldDataDiceModeNumberOfActualPiecesNumberOfActualPiecesNumberOfPointsPerPieceNumberOfPiecesMemoryLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MemoryLimit  of  << this -> MemoryLimit ) ; return this -> MemoryLimit ; } ;
## Error: expected ';'!!!
