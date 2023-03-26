## =============================================================================
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2012 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
## =============================================================================
## *
##  @class vtkmNDHistogram
##  @brief generate a n dimensional histogram field from input fields
##
##  vtkmNDhistogram is a filter that generate a n dimensional histogram field from
##  some input fields.
##  This filter takes a data set and with target fields and bins defined,
##  it would generate a N-Dims histogram from input fields. The input fields should
##  have the same number of values.
##  The result is stored in a field named as "Frequency". This field contains all
##  the frequencies of the N-Dims histogram in sparse representation.
##  That being said, the result field does not store 0 frequency bins. Meanwhile
##  all input fields now would have the same length and store bin ids instead.
##  E.g. (FieldA[i], FieldB[i], FieldC[i], Frequency[i]) is a bin in the histogram.
##  The first three numbers are binIDs for FieldA, FieldB and FieldC. Frequency[i] stores
##  the frequency for this bin (FieldA[i], FieldB[i], FieldC[i]).
##

import
  vtkAcceleratorsVTKmFiltersModule, vtkArrayDataAlgorithm

type
  vtkmNDHistogram* {.importcpp: "vtkmNDHistogram", header: "vtkmNDHistogram.h",
                    bycopy.} = object of vtkArrayDataAlgorithm
    vtkmNDHistogram* {.importc: "vtkmNDHistogram".}: VTK_NEWINSTANCE

  vtkmNDHistogramSuperclass* = vtkArrayDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkmNDHistogram::IsTypeOf(@)", header: "vtkmNDHistogram.h".}
proc IsA*(this: var vtkmNDHistogram; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkmNDHistogram.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkmNDHistogram {.
    importcpp: "vtkmNDHistogram::SafeDownCast(@)", header: "vtkmNDHistogram.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkmNDHistogram :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmNDHistogram :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmNDHistogram :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkmNDHistogram; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkmNDHistogram.h".}
proc AddFieldAndBin*(this: var vtkmNDHistogram; fieldName: string;
                    numberOfBins: vtkIdType) {.importcpp: "AddFieldAndBin",
    header: "vtkmNDHistogram.h".}
proc GetBinDelta*(this: var vtkmNDHistogram; fieldIndex: csize_t): cdouble {.
    importcpp: "GetBinDelta", header: "vtkmNDHistogram.h".}
proc GetDataRange*(this: var vtkmNDHistogram; fieldIndex: csize_t): pair[cdouble,
    cdouble] {.importcpp: "GetDataRange", header: "vtkmNDHistogram.h".}
proc GetFieldIndexFromFieldName*(this: var vtkmNDHistogram; fieldName: string): cint {.
    importcpp: "GetFieldIndexFromFieldName", header: "vtkmNDHistogram.h".}
proc New*(): ptr vtkmNDHistogram {.importcpp: "vtkmNDHistogram::New(@)",
                               header: "vtkmNDHistogram.h".}