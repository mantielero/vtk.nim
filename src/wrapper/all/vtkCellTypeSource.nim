## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellTypeSource.h
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
##  @class   vtkCellTypeSource
##  @brief   Create cells of a given type
##
##  vtkCellTypeSource is a source object that creates cells of the given
##  input type. BlocksDimensions specifies the number of cell "blocks" in each
##  direction. A cell block may be divided into multiple cells based on
##  the chosen cell type (e.g. 6 pyramid cells make up a single cell block).
##  If a 1D cell is selected then only the first dimension is
##  used to specify how many cells are generated. If a 2D cell is
##  selected then only the first and second dimensions are used to
##  determine how many cells are created. The source respects pieces.
##

import
  vtkFiltersSourcesModule, vtkUnstructuredGridAlgorithm

discard "forward decl of vtkMergePoints"
type
  vtkCellTypeSource* {.importcpp: "vtkCellTypeSource",
                      header: "vtkCellTypeSource.h", bycopy.} = object of vtkUnstructuredGridAlgorithm ## /@{
                                                                                                ## *
                                                                                                ##  Standard methods for instantiation, obtaining type and printing instance values.
                                                                                                ##
    vtkCellTypeSource* {.importc: "vtkCellTypeSource".}: VTK_NEWINSTANCE
    ##  Only valid during RequestData.


proc New*(): ptr vtkCellTypeSource {.importcpp: "vtkCellTypeSource::New(@)",
                                 header: "vtkCellTypeSource.h".}
type
  vtkCellTypeSourceSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellTypeSource::IsTypeOf(@)", header: "vtkCellTypeSource.h".}
proc IsA*(this: var vtkCellTypeSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCellTypeSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellTypeSource {.
    importcpp: "vtkCellTypeSource::SafeDownCast(@)", header: "vtkCellTypeSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellTypeSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellTypeSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellTypeSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCellTypeSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellTypeSource.h".}
proc SetCellType*(this: var vtkCellTypeSource; cellType: cint) {.
    importcpp: "SetCellType", header: "vtkCellTypeSource.h".}
## !!!Ignored construct:  virtual int GetCellType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellType  of  << this -> CellType ) ; return this -> CellType ; } ;
## Error: expected ';'!!!

proc SetCellOrder*(this: var vtkCellTypeSource; _arg: cint) {.
    importcpp: "SetCellOrder", header: "vtkCellTypeSource.h".}
## !!!Ignored construct:  virtual int GetCellTypeCellOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellOrder  of  << this -> CellOrder ) ; return this -> CellOrder ; } ;
## Error: expected ';'!!!

proc SetCellOrderCompleteQuadraticSimplicialElements*(
    this: var vtkCellTypeSource; _arg: bool) {.
    importcpp: "SetCellOrderCompleteQuadraticSimplicialElements",
    header: "vtkCellTypeSource.h".}
## !!!Ignored construct:  virtual bool GetCellTypeCellOrderCompleteQuadraticSimplicialElements ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CompleteQuadraticSimplicialElements  of  << this -> CompleteQuadraticSimplicialElements ) ; return this -> CompleteQuadraticSimplicialElements ; } ;
## Error: expected ';'!!!

proc CompleteQuadraticSimplicialElementsOn*(this: var vtkCellTypeSource) {.
    importcpp: "CompleteQuadraticSimplicialElementsOn",
    header: "vtkCellTypeSource.h".}
proc CompleteQuadraticSimplicialElementsOff*(this: var vtkCellTypeSource) {.
    importcpp: "CompleteQuadraticSimplicialElementsOff",
    header: "vtkCellTypeSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the polynomial order of the "Polynomial" point field.
  ##  The default is 1.
  ##
proc SetPolynomialFieldOrder*(this: var vtkCellTypeSource; _arg: cint) {.
    importcpp: "SetPolynomialFieldOrder", header: "vtkCellTypeSource.h".}
proc GetPolynomialFieldOrderMinValue*(this: var vtkCellTypeSource): cint {.
    importcpp: "GetPolynomialFieldOrderMinValue", header: "vtkCellTypeSource.h".}
proc GetPolynomialFieldOrderMaxValue*(this: var vtkCellTypeSource): cint {.
    importcpp: "GetPolynomialFieldOrderMaxValue", header: "vtkCellTypeSource.h".}
## !!!Ignored construct:  virtual int GetCellTypeCellOrderCompleteQuadraticSimplicialElementsPolynomialFieldOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolynomialFieldOrder  of  << this -> PolynomialFieldOrder ) ; return this -> PolynomialFieldOrder ; } ;
## Error: expected ';'!!!

proc GetCellDimension*(this: var vtkCellTypeSource): cint {.
    importcpp: "GetCellDimension", header: "vtkCellTypeSource.h".}
proc SetPolynomialFieldOrderOutputPrecision*(this: var vtkCellTypeSource; _arg: cint) {.
    importcpp: "SetPolynomialFieldOrderOutputPrecision",
    header: "vtkCellTypeSource.h".}
proc GetPolynomialFieldOrderMinValueOutputPrecisionMinValue*(
    this: var vtkCellTypeSource): cint {.importcpp: "GetPolynomialFieldOrderMinValueOutputPrecisionMinValue",
                                     header: "vtkCellTypeSource.h".}
proc GetPolynomialFieldOrderMaxValueOutputPrecisionMaxValue*(
    this: var vtkCellTypeSource): cint {.importcpp: "GetPolynomialFieldOrderMaxValueOutputPrecisionMaxValue",
                                     header: "vtkCellTypeSource.h".}
## !!!Ignored construct:  virtual int GetCellTypeCellOrderCompleteQuadraticSimplicialElementsPolynomialFieldOrderOutputPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPrecision  of  << this -> OutputPrecision ) ; return this -> OutputPrecision ; } ;
## Error: expected ';'!!!

proc SetBlocksDimensions*(this: var vtkCellTypeSource; a2: ptr cint) {.
    importcpp: "SetBlocksDimensions", header: "vtkCellTypeSource.h".}
proc SetBlocksDimensions*(this: var vtkCellTypeSource; a2: cint; a3: cint; a4: cint) {.
    importcpp: "SetBlocksDimensions", header: "vtkCellTypeSource.h".}
## !!!Ignored construct:  virtual int * GetBlocksDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BlocksDimensions  pointer  << this -> BlocksDimensions ) ; return this -> BlocksDimensions ; } VTK_WRAPEXCLUDE virtual void GetBlocksDimensions ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> BlocksDimensions [ 0 ] ; _arg2 = this -> BlocksDimensions [ 1 ] ; _arg3 = this -> BlocksDimensions [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BlocksDimensions  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBlocksDimensions ( int _arg [ 3 ] ) { this -> GetBlocksDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!
