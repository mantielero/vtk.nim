## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCastToConcrete.h
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
##  @class   vtkCastToConcrete
##  @brief   works around type-checking limitations
##
##  vtkCastToConcrete is a filter that works around type-checking limitations
##  in the filter classes. Some filters generate abstract types on output,
##  and cannot be connected to the input of filters requiring a concrete
##  input type. For example, vtkElevationFilter generates vtkDataSet for output,
##  and cannot be connected to vtkDecimate, because vtkDecimate requires
##  vtkPolyData as input. This is true even though (in this example) the input
##  to vtkElevationFilter is of type vtkPolyData, and you know the output of
##  vtkElevationFilter is the same type as its input.
##
##  vtkCastToConcrete performs run-time checking to ensure that output type
##  is of the right type. An error message will result if you try to cast
##  an input type improperly. Otherwise, the filter performs the appropriate
##  cast and returns the data.
##
##  @warning
##  You must specify the input before you can get the output. Otherwise an
##  error results.
##
##  @sa
##  vtkDataSetAlgorithm vtkPointSetToPointSetFilter
##

import
  vtkCommonExecutionModelModule, vtkDataSetAlgorithm

type
  vtkCastToConcrete* {.importcpp: "vtkCastToConcrete",
                      header: "vtkCastToConcrete.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkCastToConcrete* {.importc: "vtkCastToConcrete".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCastToConcrete {.importcpp: "vtkCastToConcrete::New(@)",
                                 header: "vtkCastToConcrete.h".}
type
  vtkCastToConcreteSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCastToConcrete::IsTypeOf(@)", header: "vtkCastToConcrete.h".}
proc IsA*(this: var vtkCastToConcrete; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCastToConcrete.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCastToConcrete {.
    importcpp: "vtkCastToConcrete::SafeDownCast(@)", header: "vtkCastToConcrete.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCastToConcrete :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCastToConcrete :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCastToConcrete :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCastToConcrete; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCastToConcrete.h".}