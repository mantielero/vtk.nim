## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompressCompositer.h
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
##  @class   vtkCompressCompositer
##  @brief   Implements compressed tree based compositing.
##
##
##  vtkCompressCompositer operates in multiple processes.  Each compositer has
##  a render window.  They use vtkMultiProcessController to communicate
##  the color and depth buffer to process 0's render window.
##  It will not handle transparency.  Compositing is run length encoding
##  of background pixels.
##
##  SECTION See Also
##  vtkCompositeManager.
##

import
  vtkCompositer, vtkRenderingParallelModule

discard "forward decl of vtkTimerLog"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkFloatArray"
type
  vtkCompressCompositer* {.importcpp: "vtkCompressCompositer",
                          header: "vtkCompressCompositer.h", bycopy.} = object of vtkCompositer
    vtkCompressCompositer* {.importc: "vtkCompressCompositer".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompressCompositer {.importcpp: "vtkCompressCompositer::New(@)",
                                     header: "vtkCompressCompositer.h".}
type
  vtkCompressCompositerSuperclass* = vtkCompositer

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompressCompositer::IsTypeOf(@)",
    header: "vtkCompressCompositer.h".}
proc IsA*(this: var vtkCompressCompositer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompressCompositer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompressCompositer {.
    importcpp: "vtkCompressCompositer::SafeDownCast(@)",
    header: "vtkCompressCompositer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompressCompositer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompressCompositer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompressCompositer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompressCompositer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCompressCompositer.h".}
proc CompositeBuffer*(this: var vtkCompressCompositer; pBuf: ptr vtkDataArray;
                     zBuf: ptr vtkFloatArray; pTmp: ptr vtkDataArray;
                     zTmp: ptr vtkFloatArray) {.importcpp: "CompositeBuffer",
    header: "vtkCompressCompositer.h".}
proc Compress*(zIn: ptr vtkFloatArray; pIn: ptr vtkDataArray; zOut: ptr vtkFloatArray;
              pOut: ptr vtkDataArray) {.importcpp: "vtkCompressCompositer::Compress(@)",
                                     header: "vtkCompressCompositer.h".}
proc Uncompress*(zIn: ptr vtkFloatArray; pIn: ptr vtkDataArray;
                zOut: ptr vtkFloatArray; pOut: ptr vtkDataArray; lengthOut: cint) {.
    importcpp: "vtkCompressCompositer::Uncompress(@)",
    header: "vtkCompressCompositer.h".}
proc CompositeImagePair*(localZ: ptr vtkFloatArray; localP: ptr vtkDataArray;
                        remoteZ: ptr vtkFloatArray; remoteP: ptr vtkDataArray;
                        outZ: ptr vtkFloatArray; outP: ptr vtkDataArray) {.
    importcpp: "vtkCompressCompositer::CompositeImagePair(@)",
    header: "vtkCompressCompositer.h".}