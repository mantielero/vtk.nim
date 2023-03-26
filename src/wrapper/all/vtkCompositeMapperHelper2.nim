## =========================================================================
##
##   Program:   Visualization Toolkit
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

import
  vtkOpenGLPolyDataMapper, vtkRenderingOpenGL2Module

discard "forward decl of vtkPolyData"
discard "forward decl of vtkCompositePolyDataMapper2"
type
  vtkCompositeMapperHelperData* {.importcpp: "vtkCompositeMapperHelperData",
                                 header: "vtkCompositeMapperHelper2.h", bycopy.} = object
    Data* {.importc: "Data".}: ptr vtkPolyData
    FlatIndex* {.importc: "FlatIndex".}: cuint
    Opacity* {.importc: "Opacity".}: cdouble
    IsOpaque* {.importc: "IsOpaque".}: bool
    Visibility* {.importc: "Visibility".}: bool
    Pickability* {.importc: "Pickability".}: bool
    OverridesColor* {.importc: "OverridesColor".}: bool
    AmbientColor* {.importc: "AmbientColor".}: vtkColor3d
    DiffuseColor* {.importc: "DiffuseColor".}: vtkColor3d
    SelectionColor* {.importc: "SelectionColor".}: vtkColor3d
    SelectionOpacity* {.importc: "SelectionOpacity".}: cdouble
    Marked* {.importc: "Marked".}: bool
    StartVertex* {.importc: "StartVertex".}: cuint
    NextVertex* {.importc: "NextVertex".}: cuint ##  point line poly strip edge stripedge
    StartIndex* {.importc: "StartIndex".}: array[PrimitiveEnd, cuint]
    NextIndex* {.importc: "NextIndex".}: array[PrimitiveEnd, cuint] ##  stores the mapping from vtk cells to gl_PrimitiveId
    CellCellMap* {.importc: "CellCellMap".}: vtkNew[vtkOpenGLCellToVTKCellMap]


## ===================================================================
## / Helper class for vtkCompositePolyDataMapper2 that is a subclass of vtkOpenGLPolyDataMapper

type
  vtkCompositeMapperHelper2* {.importcpp: "vtkCompositeMapperHelper2",
                              header: "vtkCompositeMapperHelper2.h", bycopy.} = object of vtkOpenGLPolyDataMapper
    vtkCompositeMapperHelper2* {.importc: "vtkCompositeMapperHelper2".}: VTK_NEWINSTANCE
    ## / handle updating shift scale based on pose changes
    ##  vert line poly strip edge stripedge
    ## / used by the hardware selector


proc New*(): ptr vtkCompositeMapperHelper2 {.
    importcpp: "vtkCompositeMapperHelper2::New(@)",
    header: "vtkCompositeMapperHelper2.h".}
type
  vtkCompositeMapperHelper2Superclass* = vtkOpenGLPolyDataMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeMapperHelper2::IsTypeOf(@)",
    header: "vtkCompositeMapperHelper2.h".}
proc IsA*(this: var vtkCompositeMapperHelper2; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeMapperHelper2.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeMapperHelper2 {.
    importcpp: "vtkCompositeMapperHelper2::SafeDownCast(@)",
    header: "vtkCompositeMapperHelper2.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeMapperHelper2 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLPolyDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeMapperHelper2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeMapperHelper2 :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeMapperHelper2; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCompositeMapperHelper2.h".}
proc SetParent*(this: var vtkCompositeMapperHelper2;
               p: ptr vtkCompositePolyDataMapper2) {.importcpp: "SetParent",
    header: "vtkCompositeMapperHelper2.h".}
proc AddData*(this: var vtkCompositeMapperHelper2; pd: ptr vtkPolyData;
             flatIndex: cuint): ptr vtkCompositeMapperHelperData {.
    importcpp: "AddData", header: "vtkCompositeMapperHelper2.h".}
proc RenderPiece*(this: var vtkCompositeMapperHelper2; ren: ptr vtkRenderer;
                 act: ptr vtkActor) {.importcpp: "RenderPiece",
                                   header: "vtkCompositeMapperHelper2.h".}
proc ClearMark*(this: var vtkCompositeMapperHelper2) {.importcpp: "ClearMark",
    header: "vtkCompositeMapperHelper2.h".}
proc RemoveUnused*(this: var vtkCompositeMapperHelper2) {.importcpp: "RemoveUnused",
    header: "vtkCompositeMapperHelper2.h".}
proc GetMarked*(this: var vtkCompositeMapperHelper2): bool {.importcpp: "GetMarked",
    header: "vtkCompositeMapperHelper2.h".}
proc SetMarked*(this: var vtkCompositeMapperHelper2; v: bool) {.
    importcpp: "SetMarked", header: "vtkCompositeMapperHelper2.h".}
proc GetRenderedList*(this: vtkCompositeMapperHelper2): vector[ptr vtkPolyData] {.
    noSideEffect, importcpp: "GetRenderedList",
    header: "vtkCompositeMapperHelper2.h".}
proc ProcessSelectorPixelBuffers*(this: var vtkCompositeMapperHelper2;
                                 sel: ptr vtkHardwareSelector;
                                 pixeloffsets: var vector[cuint]; prop: ptr vtkProp) {.
    importcpp: "ProcessSelectorPixelBuffers",
    header: "vtkCompositeMapperHelper2.h".}
proc ProcessCompositePixelBuffers*(this: var vtkCompositeMapperHelper2;
                                  sel: ptr vtkHardwareSelector; prop: ptr vtkProp;
                                  hdata: ptr vtkCompositeMapperHelperData;
                                  mypixels: var vector[cuint]) {.
    importcpp: "ProcessCompositePixelBuffers",
    header: "vtkCompositeMapperHelper2.h".}