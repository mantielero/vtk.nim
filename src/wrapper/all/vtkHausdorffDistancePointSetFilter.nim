## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHausdorffDistancePointSetFilter.h
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
##  Copyright (c) 2011 LTSI INSERM U642
##  All rights reserved.
##
##  Redistribution and use in source and binary forms, with or without modification,
##  are permitted provided that the following conditions are met:
##
##      * Redistributions of source code must retain the above copyright notice,
##  this list of conditions and the following disclaimer.
##      * Redistributions in binary form must reproduce the above copyright notice,
##  this list of conditions and the following disclaimer in the documentation and/or
##  other materials provided with the distribution.
##      * Neither name of LTSI, INSERM nor the names
##  of any contributors may be used to endorse or promote products derived from this
##  software without specific prior written permission.
##
##  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS''
##  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
##  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
##  DISCLAIMED. IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE FOR ANY
##  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
##  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
##  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
##  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
##  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
##  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
## * @class vtkHausdorffDistancePointSetFilter
##   @brief Compute Hausdorff distance between two point sets
##
##  This class computes the relative and hausdorff distances from two point
##  sets (input port 0 and input port 1). If no topology is specified (ie.
##  vtkPointSet or vtkPolyData without vtkPolys), the distances are
##  computed between point location. If polys exist (ie triangulation),
##  the TargetDistanceMethod allows for an interpolation of the cells to
##  ensure a better minimal distance exploration.
##
##  The outputs (port 0 and 1) have the same geometry and topology as its
##  respective input port. Two FieldData arrays are added : HausdorffDistance
##  and RelativeDistance. The former is equal on both outputs whereas the
##  latter may differ. A PointData containing the specific point minimal
##  distance is also added to both outputs.
##
##  @author Frederic Commandeur
##  @author Jerome Velut
##  @author LTSI
##
##  @see https://www.vtkjournal.org/browse/publication/839
##

import
  vtkFiltersModelingModule, vtkPointSetAlgorithm

type
  vtkHausdorffDistancePointSetFilter* {.importcpp: "vtkHausdorffDistancePointSetFilter", header: "vtkHausdorffDistancePointSetFilter.h",
                                       bycopy.} = object of vtkPointSetAlgorithm ## /@{
                                                                            ## *
                                                                            ##  Standard methods for construction, type and printing.
                                                                            ##
    vtkHausdorffDistancePointSetFilter* {.
        importc: "vtkHausdorffDistancePointSetFilter".}: VTK_NEWINSTANCE
    ## !< point-to-point if 0, point-to-cell if 1
    ## !< relative distance between inputs
    ## !< hausdorff distance (max(relative distance))


proc New*(): ptr vtkHausdorffDistancePointSetFilter {.
    importcpp: "vtkHausdorffDistancePointSetFilter::New(@)",
    header: "vtkHausdorffDistancePointSetFilter.h".}
type
  vtkHausdorffDistancePointSetFilterSuperclass* = vtkPointSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHausdorffDistancePointSetFilter::IsTypeOf(@)",
    header: "vtkHausdorffDistancePointSetFilter.h".}
proc IsA*(this: var vtkHausdorffDistancePointSetFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHausdorffDistancePointSetFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHausdorffDistancePointSetFilter {.
    importcpp: "vtkHausdorffDistancePointSetFilter::SafeDownCast(@)",
    header: "vtkHausdorffDistancePointSetFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHausdorffDistancePointSetFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHausdorffDistancePointSetFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHausdorffDistancePointSetFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHausdorffDistancePointSetFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkHausdorffDistancePointSetFilter.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the Relative Distance from A to B and B to A.
##  virtual double * GetRelativeDistanceRelativeDistance ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << RelativeDistance  pointer  << this -> RelativeDistance ) ; return this -> RelativeDistance ; } VTK_WRAPEXCLUDE virtual void GetRelativeDistanceRelativeDistance ( double & _arg1 , double & _arg2 ) { _arg1 = this -> RelativeDistance [ 0 ] ; _arg2 = this -> RelativeDistance [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << RelativeDistance  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetRelativeDistanceRelativeDistance ( double _arg [ 2 ] ) { this -> GetRelativeDistanceRelativeDistance ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the Hausdorff Distance.
##  virtual double GetHausdorffDistanceHausdorffDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HausdorffDistance  of  << this -> HausdorffDistance ) ; return this -> HausdorffDistance ; } ;
## Error: expected ';'!!!

type
  vtkHausdorffDistancePointSetFilterDistanceMethod* {.size: sizeof(cint),
      importcpp: "vtkHausdorffDistancePointSetFilter::DistanceMethod",
      header: "vtkHausdorffDistancePointSetFilter.h".} = enum
    POINT_TO_POINT, POINT_TO_CELL


proc SetTargetDistanceMethod*(this: var vtkHausdorffDistancePointSetFilter;
                             _arg: cint) {.importcpp: "SetTargetDistanceMethod",
    header: "vtkHausdorffDistancePointSetFilter.h".}
## !!!Ignored construct:  virtual int GetHausdorffDistanceHausdorffDistanceTargetDistanceMethod ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TargetDistanceMethod  of  << this -> TargetDistanceMethod ) ; return this -> TargetDistanceMethod ; } ;
## Error: expected ';'!!!

proc SetTargetDistanceMethodToPointToPoint*(
    this: var vtkHausdorffDistancePointSetFilter) {.
    importcpp: "SetTargetDistanceMethodToPointToPoint",
    header: "vtkHausdorffDistancePointSetFilter.h".}
proc SetTargetDistanceMethodToPointToCell*(
    this: var vtkHausdorffDistancePointSetFilter) {.
    importcpp: "SetTargetDistanceMethodToPointToCell",
    header: "vtkHausdorffDistancePointSetFilter.h".}
proc GetTargetDistanceMethodAsString*(this: var vtkHausdorffDistancePointSetFilter): cstring {.
    importcpp: "GetTargetDistanceMethodAsString",
    header: "vtkHausdorffDistancePointSetFilter.h".}
proc GetTargetDistanceMethodAsString*(this: var vtkHausdorffDistancePointSetFilter): cstring {.
    importcpp: "GetTargetDistanceMethodAsString",
    header: "vtkHausdorffDistancePointSetFilter.h".}