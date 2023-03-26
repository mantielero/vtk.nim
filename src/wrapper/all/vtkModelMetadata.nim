## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkModelMetadata.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkModelMetadata
##  @brief   This class encapsulates the metadata
##    that appear in mesh-based file formats but do not appear in
##    vtkUnstructuredGrid.
##
##
##    This class is inspired by the Exodus II file format, but
##    because this class does not depend on the Exodus library, it
##    should be possible to use it to represent metadata for other
##    dataset file formats.  Sandia Labs uses it in their Exodus II
##    reader, their Exodus II writer and their EnSight writer.
##    vtkDistributedDataFilter looks for metadata attached to
##    it's input and redistributes the metadata with the grid.
##
##    The fields in this class are those described in the document
##    "EXODUS II: A Finite Element Data Model", SAND92-2137, November 1995.
##
##    Element and node IDs stored in this object must be global IDs,
##    in the event that the original dataset was partitioned across
##    many files.
##
##    One way to initialize this object is by using vtkExodusModel
##    (a Sandia class used by the Sandia Exodus reader).
##    That class will take an open Exodus II file and a
##    vtkUnstructuredGrid drawn from it and will set the required fields.
##
##    Alternatively, you can use all the Set*
##    methods to set the individual fields. This class does not
##    copy the data, it simply uses your pointer. This
##    class will free the storage associated with your pointer
##    when the class is deleted.  Most fields have sensible defaults.
##    The only requirement is that if you are using this ModelMetadata
##    to write out an Exodus or EnSight file in parallel, you must
##    SetBlockIds and SetBlockIdArrayName.  Your vtkUnstructuredGrid must
##    have a cell array giving the block ID for each cell.
##
##  @warning
##    The Exodus II library supports an optimized element order map
##    (section 3.7 in the SAND document).  It contains all the element
##    IDs, listed in the order in which a solver should process them.
##    We don't include this, and won't unless there is a request.
##
##  @warning
##    There is an assumption in some classes that the name of the cell
##    array containing global element ids is "GlobalElementId" and the
##    name of the point array containing global node ids is "GlobalNodeId".
##    (element == cell) and (node == point).
##
##  @sa
##    vtkDistributedDataFilter vtkExtractCells
##

## !!!Ignored construct:  # vtkModelMetadata_h [NewLine] # vtkModelMetadata_h [NewLine] # vtkIOExodusModule.h  For export macro # vtkObject.h [NewLine] # vtkSmartPointer.h  for vtkSmartPointer # vtkStringArray.h  for vtkStringArray class vtkDataSet ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] class vtkCharArray ;
## Error: did not expect [NewLine]!!!

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkModelMetadataSTLCloak"
type
  vtkModelMetadata* {.importcpp: "vtkModelMetadata", header: "vtkModelMetadata.h",
                     bycopy.} = object of vtkObject
    vtkModelMetadata* {.importc: "vtkModelMetadata".}: VTK_NEWINSTANCE
    ##  (G)
    ##  (G)
    ##  (G)
    ##  (G)
    ##  (at most 3 of these) (G)
    ##  Time steps
    ##  starting at 0 (Exodus file starts at 1)
    ##  (G)
    ##  (G)
    ##  Block information - arrays that are input with Set*
    ##  (G)
    ##  NumberOfBlocks (G) (start at 1)
    ##  NumberOfBlocks (G)
    ##  NumberOfBlocks (L)
    ##  NumberOfBlocks (G)
    ##  NumberOfBlocks (G)
    ##  SumElementsPerBlock     (L)
    ##  SizeBlockAttributeArray (L)
    ##  Block information - values that we calculate
    ##  NumberOfBlocks
    ##  NumberOfBlocks
    ##  computed map
    ##  Node Sets - arrays that are input to the class with Set*
    ##  (G)
    ##  NumberOfNodeSets (G)
    ##  NumberOfNodeSets (L)
    ##  NNS (L) (NSNDF[i] is 0 or NSS[i])
    ##  SumNodesPerNodeSet (L)
    ##  SumDistFactPerNodeSet (L)
    ##  Node Sets - values or arrays that the class computes
    ##  NumberOfNodeSets
    ##  NumberOfNodeSets
    ##  Side Sets - input to class with Set*
    ##  (G)
    ##  NumberOfSideSets (G)
    ##  NumberOfSideSets (L)
    ##  NSS (L) (SSNDF[i] = 0 or NumNodesInSide)
    ##  SumSidesPerSideSet (L)
    ##  SumSidesPerSideSet (L)
    ##  SumSidesPerSideSet (L)
    ##  SumDistFactPerSideSet (L)
    ##  Side Sets - calculated by class
    ##  NumberOfSideSets
    ##  NumberOfSideSets
    ##  Other properties, provided as input with Set*
    ##  (G)
    ##  one per property (G)
    ##  NumBlocks * NumBlockProperties (G)
    ##  (G)
    ##  one per property (G)
    ##  NumNodeSets * NumNodeSetProperties (G)
    ##  (G)
    ##  one per property (G)
    ##  NumSideSets * NumSideSetProperties (G)
    ##  Global variables, 1 value per time step per variable.  We store
    ##  these as floats, even if they are doubles in the file.  The values
    ##  are global in the sense that they apply to the whole data set, but
    ##  the are local in the sense that they can change with each time step.
    ##  For the purpose of this object, which represents a particular
    ##  time step, they are therefore considered "local".  (Since they need
    ##  to be updated every time another read is done from the file.)
    ##  (G)
    ##  (G) NumberOfGlobalVariables
    ##  (G) NumberOfGlobalVariables
    ##  The element and node arrays in the file were all scalar arrays.
    ##  Those with similar names were combined into vectors in VTK.  Here
    ##  are all the original names from the Exodus file, the names given
    ##  the variables in the VTK ugrid, and a mapping from the VTK names
    ##  to the Exodus names.
    ##  (G)
    ##  (G) OriginalNumberOfElementVariables
    ##  (G)
    ##  (G)
    ##  (G) MaxNumberOfElementVariables
    ##  (G) MaxNumberOfElementVariables
    ##  (G) MaxNumberOfElementVariables
    ##  (G)
    ##  (G) OriginalNumberOfNodeVariables
    ##  (G)
    ##  (G)
    ##  (G) NumberOfNodeVariables
    ##  (G) NumberOfNodeVariables
    ##  (G) NumberOfNodeVariables
    ##  (G) NumBlocks*OrigNumberOfElementVariables

  vtkModelMetadataSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkModelMetadata::IsTypeOf(@)", header: "vtkModelMetadata.h".}
proc IsA*(this: var vtkModelMetadata; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkModelMetadata.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkModelMetadata {.
    importcpp: "vtkModelMetadata::SafeDownCast(@)", header: "vtkModelMetadata.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkModelMetadata :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkModelMetadata :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkModelMetadata :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkModelMetadata; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkModelMetadata.h".}
proc New*(): ptr vtkModelMetadata {.importcpp: "vtkModelMetadata::New(@)",
                                header: "vtkModelMetadata.h".}
proc PrintGlobalInformation*(this: var vtkModelMetadata) {.
    importcpp: "PrintGlobalInformation", header: "vtkModelMetadata.h".}
proc PrintLocalInformation*(this: var vtkModelMetadata) {.
    importcpp: "PrintLocalInformation", header: "vtkModelMetadata.h".}
proc SetTitle*(this: var vtkModelMetadata; _arg: cstring) {.importcpp: "SetTitle",
    header: "vtkModelMetadata.h".}
proc GetTitle*(this: vtkModelMetadata): cstring {.noSideEffect,
    importcpp: "GetTitle", header: "vtkModelMetadata.h".}
proc SetInformationLines*(this: var vtkModelMetadata; numLines: cint;
                         lines: cstringArray) {.importcpp: "SetInformationLines",
    header: "vtkModelMetadata.h".}
proc GetInformationLines*(this: vtkModelMetadata; lines: ptr cstringArray): cint {.
    noSideEffect, importcpp: "GetInformationLines", header: "vtkModelMetadata.h".}
proc GetNumberOfInformationLines*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfInformationLines", header: "vtkModelMetadata.h".}
proc SetTimeStepIndex*(this: var vtkModelMetadata; _arg: cint) {.
    importcpp: "SetTimeStepIndex", header: "vtkModelMetadata.h".}
proc GetTimeStepIndex*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetTimeStepIndex", header: "vtkModelMetadata.h".}
proc SetTimeSteps*(this: var vtkModelMetadata; numberOfTimeSteps: cint;
                  timeStepValues: ptr cfloat) {.importcpp: "SetTimeSteps",
    header: "vtkModelMetadata.h".}
proc GetNumberOfTimeSteps*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfTimeSteps", header: "vtkModelMetadata.h".}
proc GetTimeStepValues*(this: vtkModelMetadata): ptr cfloat {.noSideEffect,
    importcpp: "GetTimeStepValues", header: "vtkModelMetadata.h".}
proc SetCoordinateNames*(this: var vtkModelMetadata; dimension: cint; a3: cstringArray) {.
    importcpp: "SetCoordinateNames", header: "vtkModelMetadata.h".}
proc GetCoordinateNames*(this: vtkModelMetadata): cstringArray {.noSideEffect,
    importcpp: "GetCoordinateNames", header: "vtkModelMetadata.h".}
proc GetDimension*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetDimension", header: "vtkModelMetadata.h".}
proc SetTimeStepIndexNumberOfBlocks*(this: var vtkModelMetadata; _arg: cint) {.
    importcpp: "SetTimeStepIndexNumberOfBlocks", header: "vtkModelMetadata.h".}
proc GetNumberOfBlocks*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfBlocks", header: "vtkModelMetadata.h".}
proc SetBlockIds*(this: var vtkModelMetadata; a2: ptr cint) {.importcpp: "SetBlockIds",
    header: "vtkModelMetadata.h".}
proc GetBlockIds*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetBlockIds", header: "vtkModelMetadata.h".}
proc SetBlockElementType*(this: var vtkModelMetadata; a2: cstringArray) {.
    importcpp: "SetBlockElementType", header: "vtkModelMetadata.h".}
proc GetBlockElementType*(this: vtkModelMetadata): cstringArray {.noSideEffect,
    importcpp: "GetBlockElementType", header: "vtkModelMetadata.h".}
proc SetBlockNumberOfElements*(this: var vtkModelMetadata; nelts: ptr cint): cint {.
    importcpp: "SetBlockNumberOfElements", header: "vtkModelMetadata.h".}
proc GetBlockNumberOfElements*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetBlockNumberOfElements", header: "vtkModelMetadata.h".}
proc SetBlockNodesPerElement*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetBlockNodesPerElement", header: "vtkModelMetadata.h".}
proc GetBlockNodesPerElement*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetBlockNodesPerElement", header: "vtkModelMetadata.h".}
proc SetBlockElementIdList*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetBlockElementIdList", header: "vtkModelMetadata.h".}
proc GetBlockElementIdList*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetBlockElementIdList", header: "vtkModelMetadata.h".}
proc GetSumElementsPerBlock*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetSumElementsPerBlock", header: "vtkModelMetadata.h".}
proc GetBlockElementIdListIndex*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetBlockElementIdListIndex", header: "vtkModelMetadata.h".}
proc SetBlockNumberOfAttributesPerElement*(this: var vtkModelMetadata;
    natts: ptr cint): cint {.importcpp: "SetBlockNumberOfAttributesPerElement",
                         header: "vtkModelMetadata.h".}
proc GetBlockNumberOfAttributesPerElement*(this: vtkModelMetadata): ptr cint {.
    noSideEffect, importcpp: "GetBlockNumberOfAttributesPerElement",
    header: "vtkModelMetadata.h".}
proc SetBlockAttributes*(this: var vtkModelMetadata; a2: ptr cfloat) {.
    importcpp: "SetBlockAttributes", header: "vtkModelMetadata.h".}
proc GetBlockAttributes*(this: vtkModelMetadata): ptr cfloat {.noSideEffect,
    importcpp: "GetBlockAttributes", header: "vtkModelMetadata.h".}
proc GetSizeBlockAttributeArray*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetSizeBlockAttributeArray", header: "vtkModelMetadata.h".}
proc GetBlockAttributesIndex*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetBlockAttributesIndex", header: "vtkModelMetadata.h".}
proc SetTimeStepIndexNumberOfBlocksNumberOfNodeSets*(this: var vtkModelMetadata;
    _arg: cint) {.importcpp: "SetTimeStepIndexNumberOfBlocksNumberOfNodeSets",
                header: "vtkModelMetadata.h".}
proc GetNumberOfNodeSets*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfNodeSets", header: "vtkModelMetadata.h".}
proc SetNodeSetNames*(this: var vtkModelMetadata; names: ptr vtkStringArray) {.
    importcpp: "SetNodeSetNames", header: "vtkModelMetadata.h".}
proc GetNodeSetNames*(this: vtkModelMetadata): ptr vtkStringArray {.noSideEffect,
    importcpp: "GetNodeSetNames", header: "vtkModelMetadata.h".}
proc SetNodeSetIds*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetNodeSetIds", header: "vtkModelMetadata.h".}
proc GetNodeSetIds*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetNodeSetIds", header: "vtkModelMetadata.h".}
proc SetNodeSetSize*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetNodeSetSize", header: "vtkModelMetadata.h".}
proc GetNodeSetSize*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetNodeSetSize", header: "vtkModelMetadata.h".}
proc SetNodeSetNodeIdList*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetNodeSetNodeIdList", header: "vtkModelMetadata.h".}
proc GetNodeSetNodeIdList*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetNodeSetNodeIdList", header: "vtkModelMetadata.h".}
proc SetNodeSetNumberOfDistributionFactors*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetNodeSetNumberOfDistributionFactors",
    header: "vtkModelMetadata.h".}
proc GetNodeSetNumberOfDistributionFactors*(this: vtkModelMetadata): ptr cint {.
    noSideEffect, importcpp: "GetNodeSetNumberOfDistributionFactors",
    header: "vtkModelMetadata.h".}
proc SetNodeSetDistributionFactors*(this: var vtkModelMetadata; a2: ptr cfloat) {.
    importcpp: "SetNodeSetDistributionFactors", header: "vtkModelMetadata.h".}
proc GetNodeSetDistributionFactors*(this: vtkModelMetadata): ptr cfloat {.
    noSideEffect, importcpp: "GetNodeSetDistributionFactors",
    header: "vtkModelMetadata.h".}
proc SetTimeStepIndexNumberOfBlocksNumberOfNodeSetsSumNodesPerNodeSet*(
    this: var vtkModelMetadata; _arg: cint) {.importcpp: "SetTimeStepIndexNumberOfBlocksNumberOfNodeSetsSumNodesPerNodeSet",
    header: "vtkModelMetadata.h".}
proc GetSumNodesPerNodeSet*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetSumNodesPerNodeSet", header: "vtkModelMetadata.h".}
proc GetSumDistFactPerNodeSet*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetSumDistFactPerNodeSet", header: "vtkModelMetadata.h".}
proc GetNodeSetNodeIdListIndex*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetNodeSetNodeIdListIndex", header: "vtkModelMetadata.h".}
proc GetNodeSetDistributionFactorIndex*(this: vtkModelMetadata): ptr cint {.
    noSideEffect, importcpp: "GetNodeSetDistributionFactorIndex",
    header: "vtkModelMetadata.h".}
proc SetTimeStepIndexNumberOfBlocksNumberOfNodeSetsSumNodesPerNodeSetNumberOfSideSets*(
    this: var vtkModelMetadata; _arg: cint) {.importcpp: "SetTimeStepIndexNumberOfBlocksNumberOfNodeSetsSumNodesPerNodeSetNumberOfSideSets",
    header: "vtkModelMetadata.h".}
proc GetNumberOfSideSets*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfSideSets", header: "vtkModelMetadata.h".}
proc SetSideSetNames*(this: var vtkModelMetadata; names: ptr vtkStringArray) {.
    importcpp: "SetSideSetNames", header: "vtkModelMetadata.h".}
proc GetSideSetNames*(this: vtkModelMetadata): ptr vtkStringArray {.noSideEffect,
    importcpp: "GetSideSetNames", header: "vtkModelMetadata.h".}
proc SetSideSetIds*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetSideSetIds", header: "vtkModelMetadata.h".}
proc GetSideSetIds*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetSideSetIds", header: "vtkModelMetadata.h".}
proc SetSideSetSize*(this: var vtkModelMetadata; sizes: ptr cint): cint {.
    importcpp: "SetSideSetSize", header: "vtkModelMetadata.h".}
proc GetSideSetSize*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetSideSetSize", header: "vtkModelMetadata.h".}
proc SetSideSetNumberOfDistributionFactors*(this: var vtkModelMetadata; df: ptr cint): cint {.
    importcpp: "SetSideSetNumberOfDistributionFactors",
    header: "vtkModelMetadata.h".}
proc GetSideSetNumberOfDistributionFactors*(this: vtkModelMetadata): ptr cint {.
    noSideEffect, importcpp: "GetSideSetNumberOfDistributionFactors",
    header: "vtkModelMetadata.h".}
proc SetSideSetElementList*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetSideSetElementList", header: "vtkModelMetadata.h".}
proc GetSideSetElementList*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetSideSetElementList", header: "vtkModelMetadata.h".}
proc SetSideSetSideList*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetSideSetSideList", header: "vtkModelMetadata.h".}
proc GetSideSetSideList*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetSideSetSideList", header: "vtkModelMetadata.h".}
proc SetSideSetNumDFPerSide*(this: var vtkModelMetadata; numNodes: ptr cint) {.
    importcpp: "SetSideSetNumDFPerSide", header: "vtkModelMetadata.h".}
proc GetSideSetNumDFPerSide*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetSideSetNumDFPerSide", header: "vtkModelMetadata.h".}
proc SetSideSetDistributionFactors*(this: var vtkModelMetadata; a2: ptr cfloat) {.
    importcpp: "SetSideSetDistributionFactors", header: "vtkModelMetadata.h".}
proc GetSideSetDistributionFactors*(this: vtkModelMetadata): ptr cfloat {.
    noSideEffect, importcpp: "GetSideSetDistributionFactors",
    header: "vtkModelMetadata.h".}
proc SetTimeStepIndexNumberOfBlocksNumberOfNodeSetsSumNodesPerNodeSetNumberOfSideSetsSumSidesPerSideSet*(
    this: var vtkModelMetadata; _arg: cint) {.importcpp: "SetTimeStepIndexNumberOfBlocksNumberOfNodeSetsSumNodesPerNodeSetNumberOfSideSetsSumSidesPerSideSet",
    header: "vtkModelMetadata.h".}
proc GetSumSidesPerSideSet*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetSumSidesPerSideSet", header: "vtkModelMetadata.h".}
proc GetSumDistFactPerSideSet*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetSumDistFactPerSideSet", header: "vtkModelMetadata.h".}
proc GetSideSetListIndex*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetSideSetListIndex", header: "vtkModelMetadata.h".}
proc GetSideSetDistributionFactorIndex*(this: vtkModelMetadata): ptr cint {.
    noSideEffect, importcpp: "GetSideSetDistributionFactorIndex",
    header: "vtkModelMetadata.h".}
proc GetNumberOfBlockProperties*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfBlockProperties", header: "vtkModelMetadata.h".}
proc SetBlockPropertyNames*(this: var vtkModelMetadata; numProp: cint;
                           names: cstringArray) {.
    importcpp: "SetBlockPropertyNames", header: "vtkModelMetadata.h".}
proc GetBlockPropertyNames*(this: vtkModelMetadata): cstringArray {.noSideEffect,
    importcpp: "GetBlockPropertyNames", header: "vtkModelMetadata.h".}
proc SetBlockPropertyValue*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetBlockPropertyValue", header: "vtkModelMetadata.h".}
proc GetBlockPropertyValue*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetBlockPropertyValue", header: "vtkModelMetadata.h".}
proc GetNumberOfNodeSetProperties*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfNodeSetProperties", header: "vtkModelMetadata.h".}
proc SetNodeSetPropertyNames*(this: var vtkModelMetadata; numProp: cint;
                             names: cstringArray) {.
    importcpp: "SetNodeSetPropertyNames", header: "vtkModelMetadata.h".}
proc GetNodeSetPropertyNames*(this: vtkModelMetadata): cstringArray {.noSideEffect,
    importcpp: "GetNodeSetPropertyNames", header: "vtkModelMetadata.h".}
proc SetNodeSetPropertyValue*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetNodeSetPropertyValue", header: "vtkModelMetadata.h".}
proc GetNodeSetPropertyValue*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetNodeSetPropertyValue", header: "vtkModelMetadata.h".}
proc GetNumberOfSideSetProperties*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfSideSetProperties", header: "vtkModelMetadata.h".}
proc SetSideSetPropertyNames*(this: var vtkModelMetadata; numProp: cint;
                             names: cstringArray) {.
    importcpp: "SetSideSetPropertyNames", header: "vtkModelMetadata.h".}
proc GetSideSetPropertyNames*(this: vtkModelMetadata): cstringArray {.noSideEffect,
    importcpp: "GetSideSetPropertyNames", header: "vtkModelMetadata.h".}
proc SetSideSetPropertyValue*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetSideSetPropertyValue", header: "vtkModelMetadata.h".}
proc GetSideSetPropertyValue*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetSideSetPropertyValue", header: "vtkModelMetadata.h".}
proc GetNumberOfGlobalVariables*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfGlobalVariables", header: "vtkModelMetadata.h".}
proc SetGlobalVariableNames*(this: var vtkModelMetadata; numVarNames: cint;
                            n: cstringArray) {.
    importcpp: "SetGlobalVariableNames", header: "vtkModelMetadata.h".}
proc GetGlobalVariableNames*(this: vtkModelMetadata): cstringArray {.noSideEffect,
    importcpp: "GetGlobalVariableNames", header: "vtkModelMetadata.h".}
proc SetGlobalVariableValue*(this: var vtkModelMetadata; f: ptr cfloat) {.
    importcpp: "SetGlobalVariableValue", header: "vtkModelMetadata.h".}
proc GetGlobalVariableValue*(this: vtkModelMetadata): ptr cfloat {.noSideEffect,
    importcpp: "GetGlobalVariableValue", header: "vtkModelMetadata.h".}
proc SetElementVariableInfo*(this: var vtkModelMetadata; numOrigNames: cint;
                            origNames: cstringArray; numNames: cint;
                            names: cstringArray; numComp: ptr cint; map: ptr cint) {.
    importcpp: "SetElementVariableInfo", header: "vtkModelMetadata.h".}
proc SetNodeVariableInfo*(this: var vtkModelMetadata; numOrigNames: cint;
                         origNames: cstringArray; numNames: cint;
                         names: cstringArray; numComp: ptr cint; map: ptr cint) {.
    importcpp: "SetNodeVariableInfo", header: "vtkModelMetadata.h".}
proc SetElementVariableTruthTable*(this: var vtkModelMetadata; a2: ptr cint) {.
    importcpp: "SetElementVariableTruthTable", header: "vtkModelMetadata.h".}
proc GetElementVariableTruthTable*(this: vtkModelMetadata): ptr cint {.noSideEffect,
    importcpp: "GetElementVariableTruthTable", header: "vtkModelMetadata.h".}
proc SetTimeStepIndexNumberOfBlocksNumberOfNodeSetsSumNodesPerNodeSetNumberOfSideSetsSumSidesPerSideSetAllVariablesDefinedInAllBlocks*(
    this: var vtkModelMetadata; _arg: vtkTypeBool) {.importcpp: "SetTimeStepIndexNumberOfBlocksNumberOfNodeSetsSumNodesPerNodeSetNumberOfSideSetsSumSidesPerSideSetAllVariablesDefinedInAllBlocks",
    header: "vtkModelMetadata.h".}
proc AllVariablesDefinedInAllBlocksOn*(this: var vtkModelMetadata) {.
    importcpp: "AllVariablesDefinedInAllBlocksOn", header: "vtkModelMetadata.h".}
proc AllVariablesDefinedInAllBlocksOff*(this: var vtkModelMetadata) {.
    importcpp: "AllVariablesDefinedInAllBlocksOff", header: "vtkModelMetadata.h".}
proc GetAllVariablesDefinedInAllBlocks*(this: vtkModelMetadata): vtkTypeBool {.
    noSideEffect, importcpp: "GetAllVariablesDefinedInAllBlocks",
    header: "vtkModelMetadata.h".}
proc GetOriginalNumberOfElementVariables*(this: vtkModelMetadata): cint {.
    noSideEffect, importcpp: "GetOriginalNumberOfElementVariables",
    header: "vtkModelMetadata.h".}
proc GetOriginalElementVariableNames*(this: vtkModelMetadata): cstringArray {.
    noSideEffect, importcpp: "GetOriginalElementVariableNames",
    header: "vtkModelMetadata.h".}
proc GetNumberOfElementVariables*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfElementVariables", header: "vtkModelMetadata.h".}
proc GetElementVariableNames*(this: vtkModelMetadata): cstringArray {.noSideEffect,
    importcpp: "GetElementVariableNames", header: "vtkModelMetadata.h".}
proc GetElementVariableNumberOfComponents*(this: vtkModelMetadata): ptr cint {.
    noSideEffect, importcpp: "GetElementVariableNumberOfComponents",
    header: "vtkModelMetadata.h".}
proc GetMapToOriginalElementVariableNames*(this: vtkModelMetadata): ptr cint {.
    noSideEffect, importcpp: "GetMapToOriginalElementVariableNames",
    header: "vtkModelMetadata.h".}
proc GetOriginalNumberOfNodeVariables*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetOriginalNumberOfNodeVariables", header: "vtkModelMetadata.h".}
proc GetOriginalNodeVariableNames*(this: vtkModelMetadata): cstringArray {.
    noSideEffect, importcpp: "GetOriginalNodeVariableNames",
    header: "vtkModelMetadata.h".}
proc GetNumberOfNodeVariables*(this: vtkModelMetadata): cint {.noSideEffect,
    importcpp: "GetNumberOfNodeVariables", header: "vtkModelMetadata.h".}
proc GetNodeVariableNames*(this: vtkModelMetadata): cstringArray {.noSideEffect,
    importcpp: "GetNodeVariableNames", header: "vtkModelMetadata.h".}
proc GetNodeVariableNumberOfComponents*(this: vtkModelMetadata): ptr cint {.
    noSideEffect, importcpp: "GetNodeVariableNumberOfComponents",
    header: "vtkModelMetadata.h".}
proc GetMapToOriginalNodeVariableNames*(this: vtkModelMetadata): ptr cint {.
    noSideEffect, importcpp: "GetMapToOriginalNodeVariableNames",
    header: "vtkModelMetadata.h".}
proc FreeAllGlobalData*(this: var vtkModelMetadata) {.
    importcpp: "FreeAllGlobalData", header: "vtkModelMetadata.h".}
proc FreeAllLocalData*(this: var vtkModelMetadata) {.importcpp: "FreeAllLocalData",
    header: "vtkModelMetadata.h".}
proc FreeBlockDependentData*(this: var vtkModelMetadata) {.
    importcpp: "FreeBlockDependentData", header: "vtkModelMetadata.h".}
proc FreeOriginalElementVariableNames*(this: var vtkModelMetadata) {.
    importcpp: "FreeOriginalElementVariableNames", header: "vtkModelMetadata.h".}
proc FreeOriginalNodeVariableNames*(this: var vtkModelMetadata) {.
    importcpp: "FreeOriginalNodeVariableNames", header: "vtkModelMetadata.h".}
proc FreeUsedElementVariableNames*(this: var vtkModelMetadata) {.
    importcpp: "FreeUsedElementVariableNames", header: "vtkModelMetadata.h".}
proc FreeUsedNodeVariableNames*(this: var vtkModelMetadata) {.
    importcpp: "FreeUsedNodeVariableNames", header: "vtkModelMetadata.h".}
proc FreeUsedElementVariables*(this: var vtkModelMetadata) {.
    importcpp: "FreeUsedElementVariables", header: "vtkModelMetadata.h".}
proc FreeUsedNodeVariables*(this: var vtkModelMetadata) {.
    importcpp: "FreeUsedNodeVariables", header: "vtkModelMetadata.h".}
proc Reset*(this: var vtkModelMetadata) {.importcpp: "Reset",
                                      header: "vtkModelMetadata.h".}