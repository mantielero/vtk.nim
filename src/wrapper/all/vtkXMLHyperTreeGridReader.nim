## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLHyperTreeGridReader.h
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
##  @class   vtkXMLHyperTreeGridReader
##  @brief   Read VTK XML HyperTreeGrid files.
##
##  vtkXMLHyperTreeGridReader reads the VTK XML HyperTreeGrid file
##  format. The standard extension for this reader's file format is "htg".
##
##  NOTE: HyperTree exists as separate units with all data within htg
##        But each htg file is considered one piece for the parallel reader
##        Later may want to treat individual HyperTrees as separate pieces.
##
##  For developpers:
##  To ensure the durability of this storage format over time, at least,
##  the drive must continue to support playback of previous format.
##
##  Understand:
##  - version 0.0 (P. Fasel and D. DeMarle Kitware US)
##  - version 1.0 (J-B Lekien CEA, DAM, DIF, F-91297 Arpajon, France)
##    This version of the format offers extensive loading options.
##    With these options, regardless of the size of the backed-up mesh,
##    it is possible to view a "reduced" version either by setting the
##    maximum level (by SetFixedLevel) or/and setting the HyperTrees
##    to load (by SetCoordinatesBoundingBox, SetIndicesBoundingBox,
##    ClearAndAddSelectedHT and AddSelectedHT.
##

import
  vtkIOXMLModule, vtkXMLReader

discard "forward decl of vtkBitArray"
discard "forward decl of vtkHyperTree"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
discard "forward decl of vtkIdTypeArray"
type
  vtkXMLHyperTreeGridReader* {.importcpp: "vtkXMLHyperTreeGridReader",
                              header: "vtkXMLHyperTreeGridReader.h", bycopy.} = object of vtkXMLReader
    vtkXMLHyperTreeGridReader* {.importc: "vtkXMLHyperTreeGridReader".}: VTK_NEWINSTANCE
    ##  Fixed the load maximum level
    ##  Selected HTs by coordinates of bounding box
    ##  Selected HTs by indice coordinate of bounding box
    ##  Selected HTs by indice of HTs in the map.
    ##  The value is the fixedLevel, but if this value is
    ##  UINT_MAX, this is FixedLevel that is used.

  vtkXMLHyperTreeGridReaderSuperclass* = vtkXMLReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLHyperTreeGridReader::IsTypeOf(@)",
    header: "vtkXMLHyperTreeGridReader.h".}
proc IsA*(this: var vtkXMLHyperTreeGridReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLHyperTreeGridReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLHyperTreeGridReader {.
    importcpp: "vtkXMLHyperTreeGridReader::SafeDownCast(@)",
    header: "vtkXMLHyperTreeGridReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLHyperTreeGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLHyperTreeGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLHyperTreeGridReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLHyperTreeGridReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLHyperTreeGridReader.h".}
proc New*(): ptr vtkXMLHyperTreeGridReader {.
    importcpp: "vtkXMLHyperTreeGridReader::New(@)",
    header: "vtkXMLHyperTreeGridReader.h".}
proc GetOutput*(this: var vtkXMLHyperTreeGridReader): ptr vtkHyperTreeGrid {.
    importcpp: "GetOutput", header: "vtkXMLHyperTreeGridReader.h".}
proc GetOutput*(this: var vtkXMLHyperTreeGridReader; idx: cint): ptr vtkHyperTreeGrid {.
    importcpp: "GetOutput", header: "vtkXMLHyperTreeGridReader.h".}
proc SetFixedLevel*(this: var vtkXMLHyperTreeGridReader; _arg: cuint) {.
    importcpp: "SetFixedLevel", header: "vtkXMLHyperTreeGridReader.h".}
## !!!Ignored construct:  virtual unsigned int GetFixedLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FixedLevel  of  << this -> FixedLevel ) ; return this -> FixedLevel ; } ;
## Error: expected ';'!!!

proc SetCoordinatesBoundingBox*(this: var vtkXMLHyperTreeGridReader; xmin: cdouble;
                               xmax: cdouble; ymin: cdouble; ymax: cdouble;
                               zmin: cdouble; zmax: cdouble) {.
    importcpp: "SetCoordinatesBoundingBox", header: "vtkXMLHyperTreeGridReader.h".}
proc SetIndicesBoundingBox*(this: var vtkXMLHyperTreeGridReader; imin: cuint;
                           imax: cuint; jmin: cuint; jmax: cuint; kmin: cuint;
                           kmax: cuint) {.importcpp: "SetIndicesBoundingBox",
                                        header: "vtkXMLHyperTreeGridReader.h".}
proc ClearAndAddSelectedHT*(this: var vtkXMLHyperTreeGridReader; idg: cuint;
                           fixedLevel: cuint = UINT_MAX) {.
    importcpp: "ClearAndAddSelectedHT", header: "vtkXMLHyperTreeGridReader.h".}
proc AddSelectedHT*(this: var vtkXMLHyperTreeGridReader; idg: cuint;
                   fixedLevel: cuint = UINT_MAX) {.importcpp: "AddSelectedHT",
    header: "vtkXMLHyperTreeGridReader.h".}
proc GetNumberOfPoints*(this: vtkXMLHyperTreeGridReader): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfPoints", header: "vtkXMLHyperTreeGridReader.h".}
proc GetNumberOfPieces*(this: vtkXMLHyperTreeGridReader): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfPieces", header: "vtkXMLHyperTreeGridReader.h".}
proc SetupUpdateExtent*(this: var vtkXMLHyperTreeGridReader; piece: cint;
                       numberOfPieces: cint) {.importcpp: "SetupUpdateExtent",
    header: "vtkXMLHyperTreeGridReader.h".}
proc CopyOutputInformation*(this: var vtkXMLHyperTreeGridReader;
                           outInfo: ptr vtkInformation; port: cint) {.
    importcpp: "CopyOutputInformation", header: "vtkXMLHyperTreeGridReader.h".}
proc ReadXMLData*(this: var vtkXMLHyperTreeGridReader) {.importcpp: "ReadXMLData",
    header: "vtkXMLHyperTreeGridReader.h".}