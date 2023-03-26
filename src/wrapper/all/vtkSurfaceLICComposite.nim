## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSurfaceLICComposite.h
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
##  @class   vtkSurfaceLICComposite
##
##  This class decomposes the image space and shuffles image space
##  data onto the new decomposition with the necessary guard cells
##  to prevent artifacts at the decomposition boundaries. After the
##  image LIC is computed on the new decomposition this class will
##  un-shuffle the computed LIC back onto the original decomposition
##

import
  vtkObject, vtkPixelExtent, vtkRenderingLICOpenGL2Module

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkPainterCommunicator"
type
  vtkSurfaceLICComposite* {.importcpp: "vtkSurfaceLICComposite",
                           header: "vtkSurfaceLICComposite.h", bycopy.} = object of vtkObject
    vtkSurfaceLICComposite* {.importc: "vtkSurfaceLICComposite".}: VTK_NEWINSTANCE
    ##  id for mpi tagging
    ##  screen extent (screen size)
    ##  screen extent of the dataset
    ##  screen extents of blocks
    ##  screen extents after decomp
    ##  screen extents w/ guard cells
    ##  screen extents w/ guard cells
    ##  control for parallel composite
    ##  window coordinates step size
    ##  number of integration steps
    ##  does integrator normailze
    ##  1.5 if enhanced LIC 1 otherwise
    ##  1 if enhanced LIC 0 otherwise
    ##  n antialias passes


proc New*(): ptr vtkSurfaceLICComposite {.importcpp: "vtkSurfaceLICComposite::New(@)",
                                      header: "vtkSurfaceLICComposite.h".}
type
  vtkSurfaceLICCompositeSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSurfaceLICComposite::IsTypeOf(@)",
    header: "vtkSurfaceLICComposite.h".}
proc IsA*(this: var vtkSurfaceLICComposite; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSurfaceLICComposite.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSurfaceLICComposite {.
    importcpp: "vtkSurfaceLICComposite::SafeDownCast(@)",
    header: "vtkSurfaceLICComposite.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSurfaceLICComposite :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSurfaceLICComposite :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSurfaceLICComposite :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSurfaceLICComposite; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSurfaceLICComposite.h".}
proc Initialize*(this: var vtkSurfaceLICComposite; winExt: vtkPixelExtent;
                blockExts: deque[vtkPixelExtent]; strategy: cint; stepSize: cdouble;
                nSteps: cint; normalizeVectors: cint; enhancedLIC: cint;
                anitalias: cint) {.importcpp: "Initialize",
                                 header: "vtkSurfaceLICComposite.h".}
const
  vtkSurfaceLICCompositeCOMPOSITE_INPLACE* = 0
  vtkSurfaceLICCompositeCOMPOSITE_INPLACE_DISJOINT* = 1
  vtkSurfaceLICCompositeCOMPOSITE_BALANCED* = 2
  vtkSurfaceLICCompositeCOMPOSITE_AUTO* = 3

proc SetStrategy*(this: var vtkSurfaceLICComposite; val: cint) {.
    importcpp: "SetStrategy", header: "vtkSurfaceLICComposite.h".}
proc GetStrategy*(this: var vtkSurfaceLICComposite): cint {.importcpp: "GetStrategy",
    header: "vtkSurfaceLICComposite.h".}
proc GetNumberOfCompositeExtents*(this: vtkSurfaceLICComposite): cint {.
    noSideEffect, importcpp: "GetNumberOfCompositeExtents",
    header: "vtkSurfaceLICComposite.h".}
proc GetGuardExtent*(this: vtkSurfaceLICComposite; i: cint = 0): vtkPixelExtent {.
    noSideEffect, importcpp: "GetGuardExtent", header: "vtkSurfaceLICComposite.h".}
proc GetGuardExtents*(this: vtkSurfaceLICComposite): deque[vtkPixelExtent] {.
    noSideEffect, importcpp: "GetGuardExtents", header: "vtkSurfaceLICComposite.h".}
proc GetDisjointGuardExtent*(this: vtkSurfaceLICComposite; i: cint = 0): vtkPixelExtent {.
    noSideEffect, importcpp: "GetDisjointGuardExtent",
    header: "vtkSurfaceLICComposite.h".}
proc GetDisjointGuardExtents*(this: vtkSurfaceLICComposite): deque[vtkPixelExtent] {.
    noSideEffect, importcpp: "GetDisjointGuardExtents",
    header: "vtkSurfaceLICComposite.h".}
proc GetCompositeExtent*(this: vtkSurfaceLICComposite; i: cint = 0): vtkPixelExtent {.
    noSideEffect, importcpp: "GetCompositeExtent",
    header: "vtkSurfaceLICComposite.h".}
proc GetCompositeExtents*(this: vtkSurfaceLICComposite): deque[vtkPixelExtent] {.
    noSideEffect, importcpp: "GetCompositeExtents",
    header: "vtkSurfaceLICComposite.h".}
proc GetDataSetExtent*(this: vtkSurfaceLICComposite): vtkPixelExtent {.noSideEffect,
    importcpp: "GetDataSetExtent", header: "vtkSurfaceLICComposite.h".}
proc GetWindowExtent*(this: vtkSurfaceLICComposite): vtkPixelExtent {.noSideEffect,
    importcpp: "GetWindowExtent", header: "vtkSurfaceLICComposite.h".}
proc InitializeCompositeExtents*(this: var vtkSurfaceLICComposite;
                                vectors: ptr cfloat): cint {.
    importcpp: "InitializeCompositeExtents", header: "vtkSurfaceLICComposite.h".}
proc SetContext*(this: var vtkSurfaceLICComposite; a2: ptr vtkOpenGLRenderWindow) {.
    importcpp: "SetContext", header: "vtkSurfaceLICComposite.h".}
proc GetContext*(this: var vtkSurfaceLICComposite): ptr vtkOpenGLRenderWindow {.
    importcpp: "GetContext", header: "vtkSurfaceLICComposite.h".}
proc SetCommunicator*(this: var vtkSurfaceLICComposite;
                     a2: ptr vtkPainterCommunicator) {.
    importcpp: "SetCommunicator", header: "vtkSurfaceLICComposite.h".}
proc RestoreDefaultCommunicator*(this: var vtkSurfaceLICComposite) {.
    importcpp: "RestoreDefaultCommunicator", header: "vtkSurfaceLICComposite.h".}
proc BuildProgram*(this: var vtkSurfaceLICComposite; a2: ptr cfloat): cint {.
    importcpp: "BuildProgram", header: "vtkSurfaceLICComposite.h".}
proc Gather*(this: var vtkSurfaceLICComposite; a2: pointer; a3: cint; a4: cint;
            a5: ptr vtkTextureObject): cint {.importcpp: "Gather",
    header: "vtkSurfaceLICComposite.h".}
proc Scatter*(this: var vtkSurfaceLICComposite; a2: pointer; a3: cint; a4: cint;
             a5: ptr vtkTextureObject): cint {.importcpp: "Scatter",
    header: "vtkSurfaceLICComposite.h".}
proc MakeDecompDisjoint*(`in`: var deque[vtkPixelExtent];
                        `out`: var deque[vtkPixelExtent]): cint {.
    importcpp: "vtkSurfaceLICComposite::MakeDecompDisjoint(@)",
    header: "vtkSurfaceLICComposite.h".}
proc `<<`*(os: var ostream; ss: var vtkSurfaceLICComposite): var ostream {.
    importcpp: "(# << #)", header: "vtkSurfaceLICComposite.h".}