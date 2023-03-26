## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractArray.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkExtractArray
##  @brief   Given a vtkArrayData object containing one-or-more
##  vtkArray instances, produces a vtkArrayData containing just one vtkArray,
##  identified by index.
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkArrayDataAlgorithm, vtkFiltersGeneralModule

type
  vtkExtractArray* {.importcpp: "vtkExtractArray", header: "vtkExtractArray.h",
                    bycopy.} = object of vtkArrayDataAlgorithm
    vtkExtractArray* {.importc: "vtkExtractArray".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractArray {.importcpp: "vtkExtractArray::New(@)",
                               header: "vtkExtractArray.h".}
type
  vtkExtractArraySuperclass* = vtkArrayDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractArray::IsTypeOf(@)", header: "vtkExtractArray.h".}
proc IsA*(this: var vtkExtractArray; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkExtractArray.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractArray {.
    importcpp: "vtkExtractArray::SafeDownCast(@)", header: "vtkExtractArray.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractArray :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractArray; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractArray.h".}
## !!!Ignored construct:  /@{ *
##  Controls which array will be extracted.
##  virtual vtkIdType GetIndexIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Index  of  << this -> Index ) ; return this -> Index ; } ;
## Error: expected ';'!!!

proc SetIndex*(this: var vtkExtractArray; _arg: vtkIdType) {.importcpp: "SetIndex",
    header: "vtkExtractArray.h".}
  ## /@}