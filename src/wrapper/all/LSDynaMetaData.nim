## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    LSDynaMetaData.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
##  .NAME LSDynaMetaData - Read LS-Dyna databases (d3plot)
##  .SECTION Description
##     A class to hold metadata about a particular file (such as time steps,
##     the start of state information for each time step, the number of
##     adaptive remeshes, and the large collection of constants that determine
##     the available attributes). It contains an LSDynaFamily instance.

import
  LSDynaFamily

type
  LSDynaMetaData* {.importcpp: "LSDynaMetaData", header: "LSDynaMetaData.h", bycopy.} = object
    FileIsValid* {.importc: "FileIsValid".}: cint
    FileSizeFactor* {.importc: "FileSizeFactor".}: cint ##  scale factor used to compute MaxFileLength
    MaxFileLength* {.importc: "MaxFileLength".}: vtkIdType ##  Maximum size of any file (data too big is split into multiple files)
    Fam* {.importc: "Fam".}: LSDynaFamily ##  file family I/O aggregator
    Title* {.importc: "Title".}: array[41, char]
    ReleaseNumber* {.importc: "ReleaseNumber".}: array[16, char]
    CodeVersion* {.importc: "CodeVersion".}: cfloat
    Dimensionality* {.importc: "Dimensionality".}: cint
    CurrentState* {.importc: "CurrentState".}: vtkIdType ##  time step
    NumberOfNodes* {.importc: "NumberOfNodes".}: vtkIdType
    NumberOfCells* {.importc: "NumberOfCells".}: array[NUM_CELL_TYPES, vtkIdType]
    ReadRigidRoadMvmt* {.importc: "ReadRigidRoadMvmt".}: cint ##  Are some of the quads rigid? (eliminating a lot of state)
    ConnectivityUnpacked* {.importc: "ConnectivityUnpacked".}: cint ##  Is the connectivity packed, 3 to a word?
    Dict* {.importc: "Dict".}: map[string, vtkIdType] ## / List of material IDs that indicate the associated shell element is rigid (and has no state
                                                 ## / data)
    RigidMaterials* {.importc: "RigidMaterials".}: set[cint] ## / List of material IDs that indicate the associated solid element represents an Eulerian or ALE
                                                         ## / fluid.
    FluidMaterials* {.importc: "FluidMaterials".}: set[cint]
    PointArrayNames* {.importc: "PointArrayNames".}: vector[string]
    PointArrayComponents* {.importc: "PointArrayComponents".}: vector[cint]
    PointArrayStatus* {.importc: "PointArrayStatus".}: vector[cint]
    CellArrayNames* {.importc: "CellArrayNames".}: map[cint, vector[string]]
    CellArrayComponents* {.importc: "CellArrayComponents".}: map[cint, vector[cint]]
    CellArrayStatus* {.importc: "CellArrayStatus".}: map[cint, vector[cint]]
    PartNames* {.importc: "PartNames".}: vector[string]
    PartIds* {.importc: "PartIds".}: vector[cint]
    PartMaterials* {.importc: "PartMaterials".}: vector[cint]
    PartStatus* {.importc: "PartStatus".}: vector[cint]
    MaterialsOrdered* {.importc: "MaterialsOrdered".}: vector[cint]
    MaterialsUnordered* {.importc: "MaterialsUnordered".}: vector[cint]
    MaterialsLookup* {.importc: "MaterialsLookup".}: vector[cint]
    RigidSurfaceSegmentSizes* {.importc: "RigidSurfaceSegmentSizes".}: vector[
        vtkIdType]
    TimeValues* {.importc: "TimeValues".}: vector[cdouble] ##  For the current time value, what file contains this state (0=d3plot,1=d3plot01, ...)
    FileNumberThisState* {.importc: "FileNumberThisState".}: vtkIdType ##  For the current time value, what is the byte offset of the state in file FileNumberThisState?
    FileOffsetThisState* {.importc: "FileOffsetThisState".}: vtkIdType ##  Size of all data that appears before first state
    PreStateSize* {.importc: "PreStateSize".}: vtkIdType ##  Number of bytes required to store a single timestep
    StateSize* {.importc: "StateSize".}: vtkIdType ##  Number of words into the state that the element deletion starts at
    ElementDeletionOffset* {.importc: "ElementDeletionOffset".}: vtkIdType ##  Number of words into the state that the SPH state data starts at
    SPHStateOffset* {.importc: "SPHStateOffset".}: vtkIdType


proc constructLSDynaMetaData*(): LSDynaMetaData {.constructor,
    importcpp: "LSDynaMetaData(@)", header: "LSDynaMetaData.h".}
proc AddPointArray*(this: var LSDynaMetaData; name: string; numComponents: cint;
                   status: cint): bool {.importcpp: "AddPointArray",
                                      header: "LSDynaMetaData.h".}
proc AddCellArray*(this: var LSDynaMetaData; cellType: cint; name: string;
                  numComponents: cint; status: cint): bool {.
    importcpp: "AddCellArray", header: "LSDynaMetaData.h".}
proc GetTotalMaterialCount*(this: var LSDynaMetaData): vtkIdType {.
    importcpp: "GetTotalMaterialCount", header: "LSDynaMetaData.h".}
proc Reset*(this: var LSDynaMetaData) {.importcpp: "Reset", header: "LSDynaMetaData.h".}
type
  LSDynaMetaDataLSDYNA_TYPES* {.size: sizeof(cint),
                               importcpp: "LSDynaMetaData::LSDYNA_TYPES",
                               header: "LSDynaMetaData.h".} = enum
    PARTICLE = 0, BEAM = 1, SHELL = 2, THICK_SHELL = 3, SOLID = 4, RIGID_BODY = 5,
    ROAD_SURFACE = 6, NUM_CELL_TYPES

