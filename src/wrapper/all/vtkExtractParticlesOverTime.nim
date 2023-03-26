## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractParticlesOverTime.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkExtractParticlesOverTime
##  @brief   Extract particles that goes through a given volumic data set.
##
##  vtkExtractParticlesOverTime extracts particles (points) from the first input that goes through
##  the volume of the second input by iterating over time. Both inputs should be vtkDataSet objects.
##  The first input should be temporal (i.e contains time steps), and the second one should be a
##  volumic dataset (i.e contains 3D cells).
##
##  The output is a vtkDataSet that contains points which are subsets of the first input. The points
##  move over time the same way the first input does.
##

import
  vtkDataSetAlgorithm, vtkFiltersExtractionModule

discard "forward decl of vtkExtractParticlesOverTimeInternals"
type
  vtkExtractParticlesOverTime* {.importcpp: "vtkExtractParticlesOverTime",
                                header: "vtkExtractParticlesOverTime.h", bycopy.} = object of vtkDataSetAlgorithm ## /@{
                                                                                                           ## *
                                                                                                           ##  Standard Type-Macro
                                                                                                           ##
    vtkExtractParticlesOverTime* {.importc: "vtkExtractParticlesOverTime".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractParticlesOverTime {.
    importcpp: "vtkExtractParticlesOverTime::New(@)",
    header: "vtkExtractParticlesOverTime.h".}
type
  vtkExtractParticlesOverTimeSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractParticlesOverTime::IsTypeOf(@)",
    header: "vtkExtractParticlesOverTime.h".}
proc IsA*(this: var vtkExtractParticlesOverTime; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractParticlesOverTime.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractParticlesOverTime {.
    importcpp: "vtkExtractParticlesOverTime::SafeDownCast(@)",
    header: "vtkExtractParticlesOverTime.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractParticlesOverTime :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractParticlesOverTime :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractParticlesOverTime :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractParticlesOverTime; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkExtractParticlesOverTime.h".}
proc SetIdChannelArray*(this: var vtkExtractParticlesOverTime; arg: cstring) {.
    importcpp: "SetIdChannelArray", header: "vtkExtractParticlesOverTime.h".}
proc GetIdChannelArray*(this: var vtkExtractParticlesOverTime): cstring {.
    importcpp: "GetIdChannelArray", header: "vtkExtractParticlesOverTime.h".}
  ## /@}