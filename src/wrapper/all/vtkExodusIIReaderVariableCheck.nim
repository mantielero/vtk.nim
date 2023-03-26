import
  vtkExodusIIReaderPrivate

## *\brief Abstract base class for glomming arrays of variable names.
##
##  Subclasses check whether variable names listed in an array of names
##  are related to each other (and should thus be glommed into a single
##  VTK array).
##

type
  vtkExodusIIReaderVariableCheck* {.importcpp: "vtkExodusIIReaderVariableCheck",
                                   header: "vtkExodusIIReaderVariableCheck.h",
                                   bycopy.} = object ## / Initialize a sequence of names. Returns true if any more names are acceptable.


proc Start*(this: var vtkExodusIIReaderVariableCheck; name: string; truth: ptr cint;
           numTruth: cint): bool {.importcpp: "Start",
                                header: "vtkExodusIIReaderVariableCheck.h".}
proc StartInternal*(this: var vtkExodusIIReaderVariableCheck; name: string;
                   truth: ptr cint; numTruth: cint): bool {.
    importcpp: "StartInternal", header: "vtkExodusIIReaderVariableCheck.h".}
proc Add*(this: var vtkExodusIIReaderVariableCheck; name: string; truth: ptr cint): bool {.
    importcpp: "Add", header: "vtkExodusIIReaderVariableCheck.h".}
proc Length*(this: var vtkExodusIIReaderVariableCheck): size_type[string] {.
    importcpp: "Length", header: "vtkExodusIIReaderVariableCheck.h".}
proc Accept*(this: var vtkExodusIIReaderVariableCheck;
            arr: var vector[ArrayInfoType]; startIndex: cint;
            priv: ptr vtkExodusIIReaderPrivate; objtyp: cint): cint {.
    importcpp: "Accept", header: "vtkExodusIIReaderVariableCheck.h".}
## / This always accepts a single array name as a scalar. It is the fallback for all other checkers.

type
  vtkExodusIIReaderScalarCheck* {.importcpp: "vtkExodusIIReaderScalarCheck",
                                 header: "vtkExodusIIReaderVariableCheck.h",
                                 bycopy.} = object of vtkExodusIIReaderVariableCheck


proc constructvtkExodusIIReaderScalarCheck*(): vtkExodusIIReaderScalarCheck {.
    constructor, importcpp: "vtkExodusIIReaderScalarCheck(@)",
    header: "vtkExodusIIReaderVariableCheck.h".}
proc StartInternal*(this: var vtkExodusIIReaderScalarCheck; name: string;
                   a3: ptr cint; a4: cint): bool {.importcpp: "StartInternal",
    header: "vtkExodusIIReaderVariableCheck.h".}
proc Add*(this: var vtkExodusIIReaderScalarCheck; a2: string; a3: ptr cint): bool {.
    importcpp: "Add", header: "vtkExodusIIReaderVariableCheck.h".}
## / This looks for n-D vectors whose names are identical except for a single final character.

type
  vtkExodusIIReaderVectorCheck* {.importcpp: "vtkExodusIIReaderVectorCheck",
                                 header: "vtkExodusIIReaderVariableCheck.h",
                                 bycopy.} = object of vtkExodusIIReaderVariableCheck


proc constructvtkExodusIIReaderVectorCheck*(seq: cstring; n: cint): vtkExodusIIReaderVectorCheck {.
    constructor, importcpp: "vtkExodusIIReaderVectorCheck(@)",
    header: "vtkExodusIIReaderVariableCheck.h".}
proc StartInternal*(this: var vtkExodusIIReaderVectorCheck; name: string;
                   a3: ptr cint; a4: cint): bool {.importcpp: "StartInternal",
    header: "vtkExodusIIReaderVariableCheck.h".}
proc Add*(this: var vtkExodusIIReaderVectorCheck; name: string; truth: ptr cint): bool {.
    importcpp: "Add", header: "vtkExodusIIReaderVariableCheck.h".}
proc Length*(this: var vtkExodusIIReaderVectorCheck): size_type[string] {.
    importcpp: "Length", header: "vtkExodusIIReaderVariableCheck.h".}
## *\brief This looks for symmetric tensors of a given rank and dimension.
##
##  All array names must be identical except for the last \a rank characters
##  which must be taken from the \a dim -length character array \a seq, specified
##  as dimension indicators.
##

type
  vtkExodusIIReaderTensorCheck* {.importcpp: "vtkExodusIIReaderTensorCheck",
                                 header: "vtkExodusIIReaderVariableCheck.h",
                                 bycopy.} = object of vtkExodusIIReaderVariableCheck


proc constructvtkExodusIIReaderTensorCheck*(seq: cstring; n: cint; rank: cint;
    dim: cint): vtkExodusIIReaderTensorCheck {.constructor,
    importcpp: "vtkExodusIIReaderTensorCheck(@)",
    header: "vtkExodusIIReaderVariableCheck.h".}
proc StartInternal*(this: var vtkExodusIIReaderTensorCheck; name: string;
                   a3: ptr cint; a4: cint): bool {.importcpp: "StartInternal",
    header: "vtkExodusIIReaderVariableCheck.h".}
proc Add*(this: var vtkExodusIIReaderTensorCheck; name: string; truth: ptr cint): bool {.
    importcpp: "Add", header: "vtkExodusIIReaderVariableCheck.h".}
proc Length*(this: var vtkExodusIIReaderTensorCheck): size_type[string] {.
    importcpp: "Length", header: "vtkExodusIIReaderVariableCheck.h".}
## / This looks for integration-point variables whose names contain an element shape and digits
## / specifying an integration point.

type
  vtkExodusIIReaderIntPointCheck* {.importcpp: "vtkExodusIIReaderIntPointCheck",
                                   header: "vtkExodusIIReaderVariableCheck.h",
                                   bycopy.} = object of vtkExodusIIReaderVariableCheck


proc constructvtkExodusIIReaderIntPointCheck*(): vtkExodusIIReaderIntPointCheck {.
    constructor, importcpp: "vtkExodusIIReaderIntPointCheck(@)",
    header: "vtkExodusIIReaderVariableCheck.h".}
proc StartInternal*(this: var vtkExodusIIReaderIntPointCheck; name: string;
                   a3: ptr cint; a4: cint): bool {.importcpp: "StartInternal",
    header: "vtkExodusIIReaderVariableCheck.h".}
proc Add*(this: var vtkExodusIIReaderIntPointCheck; name: string; a3: ptr cint): bool {.
    importcpp: "Add", header: "vtkExodusIIReaderVariableCheck.h".}
proc Length*(this: var vtkExodusIIReaderIntPointCheck): size_type[string] {.
    importcpp: "Length", header: "vtkExodusIIReaderVariableCheck.h".}