## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkPBivariateLinearTableThreshold.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##   Copyright 2009 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkPBivariateLinearTableThreshold
##  @brief   performs line-based thresholding
##  for vtkTable data in parallel.
##
##
##  Perform the table filtering operations provided by
##  vtkBivariateLinearTableThreshold in parallel.
##

import
  vtkBivariateLinearTableThreshold, vtkFiltersParallelStatisticsModule

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkMultiProcessController"
type
  vtkPBivariateLinearTableThreshold* {.importcpp: "vtkPBivariateLinearTableThreshold", header: "vtkPBivariateLinearTableThreshold.h",
                                      bycopy.} = object of vtkBivariateLinearTableThreshold
    vtkPBivariateLinearTableThreshold* {.importc: "vtkPBivariateLinearTableThreshold".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPBivariateLinearTableThreshold {.
    importcpp: "vtkPBivariateLinearTableThreshold::New(@)",
    header: "vtkPBivariateLinearTableThreshold.h".}
type
  vtkPBivariateLinearTableThresholdSuperclass* = vtkBivariateLinearTableThreshold

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPBivariateLinearTableThreshold::IsTypeOf(@)",
    header: "vtkPBivariateLinearTableThreshold.h".}
proc IsA*(this: var vtkPBivariateLinearTableThreshold; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPBivariateLinearTableThreshold.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPBivariateLinearTableThreshold {.
    importcpp: "vtkPBivariateLinearTableThreshold::SafeDownCast(@)",
    header: "vtkPBivariateLinearTableThreshold.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPBivariateLinearTableThreshold :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBivariateLinearTableThreshold :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPBivariateLinearTableThreshold :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPBivariateLinearTableThreshold :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPBivariateLinearTableThreshold; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPBivariateLinearTableThreshold.h".}
proc SetController*(this: var vtkPBivariateLinearTableThreshold;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkPBivariateLinearTableThreshold.h".}
proc GetnameController*(this: var vtkPBivariateLinearTableThreshold): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPBivariateLinearTableThreshold.h".}
  ## /@}