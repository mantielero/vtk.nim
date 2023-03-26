## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractPointCloudPiece.h
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
##  @class   vtkExtractPointCloudPiece
##  @brief   Return a piece of a point cloud
##
##  This filter takes the output of a vtkHierarchicalBinningFilter and allows
##  the pipeline to stream it. Pieces are determined from an offset integral
##  array associated with the field data of the input.
##

import
  vtkFiltersPointsModule, vtkPolyDataAlgorithm

discard "forward decl of vtkIdList"
discard "forward decl of vtkIntArray"
type
  vtkExtractPointCloudPiece* {.importcpp: "vtkExtractPointCloudPiece",
                              header: "vtkExtractPointCloudPiece.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                        ## *
                                                                                                        ##  Standard methods for instantiation, printing, and type information.
                                                                                                        ##
    vtkExtractPointCloudPiece* {.importc: "vtkExtractPointCloudPiece".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractPointCloudPiece {.
    importcpp: "vtkExtractPointCloudPiece::New(@)",
    header: "vtkExtractPointCloudPiece.h".}
type
  vtkExtractPointCloudPieceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractPointCloudPiece::IsTypeOf(@)",
    header: "vtkExtractPointCloudPiece.h".}
proc IsA*(this: var vtkExtractPointCloudPiece; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractPointCloudPiece.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractPointCloudPiece {.
    importcpp: "vtkExtractPointCloudPiece::SafeDownCast(@)",
    header: "vtkExtractPointCloudPiece.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractPointCloudPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractPointCloudPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractPointCloudPiece :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractPointCloudPiece; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractPointCloudPiece.h".}
proc SetModuloOrdering*(this: var vtkExtractPointCloudPiece; _arg: bool) {.
    importcpp: "SetModuloOrdering", header: "vtkExtractPointCloudPiece.h".}
## !!!Ignored construct:  virtual bool GetModuloOrdering ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ModuloOrdering  of  << this -> ModuloOrdering ) ; return this -> ModuloOrdering ; } ;
## Error: expected ';'!!!

proc ModuloOrderingOn*(this: var vtkExtractPointCloudPiece) {.
    importcpp: "ModuloOrderingOn", header: "vtkExtractPointCloudPiece.h".}
proc ModuloOrderingOff*(this: var vtkExtractPointCloudPiece) {.
    importcpp: "ModuloOrderingOff", header: "vtkExtractPointCloudPiece.h".}
  ## /@}