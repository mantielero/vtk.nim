## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadraturePointInterpolator.h
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
##  @class   vtkQuadraturePointInterpolator
##
##
##  Interpolates each scalar/vector field in a vtkUnstrcturedGrid
##  on its input to a specific set of quadrature points. The
##  set of quadrature points is specified per array via a
##  dictionary (ie an instance of vtkInformationQuadratureSchemeDefinitionVectorKey).
##  contained in the array. The interpolated fields are placed
##  in FieldData along with a set of per cell indexes, that allow
##  random access to a given cells quadrature points.
##
##  @sa
##  vtkQuadratureSchemeDefinition, vtkQuadraturePointsGenerator,
##  vtkInformationQuadratureSchemeDefinitionVectorKey
##

import
  vtkDataSetAlgorithm, vtkFiltersGeneralModule

discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
type
  vtkQuadraturePointInterpolator* {.importcpp: "vtkQuadraturePointInterpolator",
                                   header: "vtkQuadraturePointInterpolator.h",
                                   bycopy.} = object of vtkDataSetAlgorithm
    vtkQuadraturePointInterpolator* {.importc: "vtkQuadraturePointInterpolator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkQuadraturePointInterpolator {.
    importcpp: "vtkQuadraturePointInterpolator::New(@)",
    header: "vtkQuadraturePointInterpolator.h".}
type
  vtkQuadraturePointInterpolatorSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQuadraturePointInterpolator::IsTypeOf(@)",
    header: "vtkQuadraturePointInterpolator.h".}
proc IsA*(this: var vtkQuadraturePointInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQuadraturePointInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQuadraturePointInterpolator {.
    importcpp: "vtkQuadraturePointInterpolator::SafeDownCast(@)",
    header: "vtkQuadraturePointInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQuadraturePointInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadraturePointInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadraturePointInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQuadraturePointInterpolator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkQuadraturePointInterpolator.h".}