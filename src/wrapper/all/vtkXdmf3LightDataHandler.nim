## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXdmf3LightDataHandler.h
##   Language:  C++
##
##   Copyright (c) 1993-2002 Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkXdmf3LightDataHandler
##  @brief   internal helper for vtkXdmf3Reader
##
##  vtkXdmf3Reader uses this class to inspect the light data in the XDMF
##  file(s) and determine meta-information about the vtkDataObjects it
##  needs to produce.
##
##  This file is a helper for the vtkXdmf3Reader and not intended to be
##  part of VTK public API
##

import
  vtkIOXdmf3Module, vtkType

##  clang-format off

import
  vtk_xdmf3

##  clang-format on

discard "forward decl of vtkXdmf3SILBuilder"
discard "forward decl of vtkXdmf3ArraySelection"
discard "forward decl of XdmfItem"
discard "forward decl of XdmfGraph"
discard "forward decl of XdmfGrid"
type
  vtkXdmf3LightDataHandler* {.importcpp: "vtkXdmf3LightDataHandler",
                             header: "vtkXdmf3LightDataHandler.h", bycopy.} = object ## *
                                                                                ##  factory constructor
                                                                                ##
                                                                                ## *
                                                                                ##  constructor
                                                                                ##
    ##  ie EdgeArrays for Graphs
    ##  ie NodeArrays for Graphs
    ##  relying on implicit sort from set<double>


proc New*(sb: ptr vtkXdmf3SILBuilder; f: ptr vtkXdmf3ArraySelection;
         ce: ptr vtkXdmf3ArraySelection; pn: ptr vtkXdmf3ArraySelection;
         gc: ptr vtkXdmf3ArraySelection; sc: ptr vtkXdmf3ArraySelection;
         processor: cuint; nprocessors: cuint): shared_ptr[vtkXdmf3LightDataHandler] {.
    importcpp: "vtkXdmf3LightDataHandler::New(@)",
    header: "vtkXdmf3LightDataHandler.h".}
proc InspectXDMF*(this: var vtkXdmf3LightDataHandler; item: shared_ptr[XdmfItem];
                 parentVertex: vtkIdType; depth: cuint = 0) {.
    importcpp: "InspectXDMF", header: "vtkXdmf3LightDataHandler.h".}
proc ClearGridsIfNeeded*(this: var vtkXdmf3LightDataHandler;
                        domain: shared_ptr[XdmfItem]) {.
    importcpp: "ClearGridsIfNeeded", header: "vtkXdmf3LightDataHandler.h".}
proc getTimes*(this: var vtkXdmf3LightDataHandler): set[cdouble] {.
    importcpp: "getTimes", header: "vtkXdmf3LightDataHandler.h".}