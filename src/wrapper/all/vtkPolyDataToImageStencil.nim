## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataToImageStencil.h
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
## =========================================================================
##
## Copyright (c) 2008 Atamai, Inc.
##
## Use, modification and redistribution of the software, in source or
## binary forms, are permitted provided that the following terms and
## conditions are met:
##
## 1) Redistribution of the source code, in verbatim or modified
##    form, must retain the above copyright notice, this license,
##    the following disclaimer, and any notices that refer to this
##    license and/or the following disclaimer.
##
## 2) Redistribution in binary form must include the above copyright
##    notice, a copy of this license and the following disclaimer
##    in the documentation or with other materials provided with the
##    distribution.
##
## 3) Modified copies of the source code must be clearly marked as such,
##    and must not be misrepresented as verbatim copies of the source code.
##
## THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE SOFTWARE "AS IS"
## WITHOUT EXPRESSED OR IMPLIED WARRANTY INCLUDING, BUT NOT LIMITED TO,
## THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
## PURPOSE.  IN NO EVENT SHALL ANY COPYRIGHT HOLDER OR OTHER PARTY WHO MAY
## MODIFY AND/OR REDISTRIBUTE THE SOFTWARE UNDER THE TERMS OF THIS LICENSE
## BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES
## (INCLUDING, BUT NOT LIMITED TO, LOSS OF DATA OR DATA BECOMING INACCURATE
## OR LOSS OF PROFIT OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF
## THE USE OR INABILITY TO USE THE SOFTWARE, EVEN IF ADVISED OF THE
## POSSIBILITY OF SUCH DAMAGES.
##
## =========================================================================
## *
##  @class   vtkPolyDataToImageStencil
##  @brief   use polydata to mask an image
##
##  The vtkPolyDataToImageStencil class will convert polydata into
##  an image stencil.  The polydata can either be a closed surface
##  mesh or a series of polyline contours (one contour per slice).
##  @warning
##  If contours are provided, the contours must be aligned with the
##  Z planes.  Other contour orientations are not supported.
##  @sa
##  vtkImageStencil vtkImageAccumulate vtkImageBlend vtkImageReslice
##

import
  vtkImageStencilSource, vtkImagingStencilModule

discard "forward decl of vtkMergePoints"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkPolyData"
type
  vtkPolyDataToImageStencil* {.importcpp: "vtkPolyDataToImageStencil",
                              header: "vtkPolyDataToImageStencil.h", bycopy.} = object of vtkImageStencilSource
    vtkPolyDataToImageStencil* {.importc: "vtkPolyDataToImageStencil".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyDataToImageStencil {.
    importcpp: "vtkPolyDataToImageStencil::New(@)",
    header: "vtkPolyDataToImageStencil.h".}
type
  vtkPolyDataToImageStencilSuperclass* = vtkImageStencilSource

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataToImageStencil::IsTypeOf(@)",
    header: "vtkPolyDataToImageStencil.h".}
proc IsA*(this: var vtkPolyDataToImageStencil; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataToImageStencil.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataToImageStencil {.
    importcpp: "vtkPolyDataToImageStencil::SafeDownCast(@)",
    header: "vtkPolyDataToImageStencil.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataToImageStencil :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageStencilSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataToImageStencil :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataToImageStencil :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataToImageStencil; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyDataToImageStencil.h".}
proc SetInputData*(this: var vtkPolyDataToImageStencil; a2: ptr vtkPolyData) {.
    importcpp: "SetInputData", header: "vtkPolyDataToImageStencil.h".}
proc GetInput*(this: var vtkPolyDataToImageStencil): ptr vtkPolyData {.
    importcpp: "GetInput", header: "vtkPolyDataToImageStencil.h".}
proc SetTolerance*(this: var vtkPolyDataToImageStencil; _arg: cdouble) {.
    importcpp: "SetTolerance", header: "vtkPolyDataToImageStencil.h".}
proc GetToleranceMinValue*(this: var vtkPolyDataToImageStencil): cdouble {.
    importcpp: "GetToleranceMinValue", header: "vtkPolyDataToImageStencil.h".}
proc GetToleranceMaxValue*(this: var vtkPolyDataToImageStencil): cdouble {.
    importcpp: "GetToleranceMaxValue", header: "vtkPolyDataToImageStencil.h".}
## !!!Ignored construct:  virtual double GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!
