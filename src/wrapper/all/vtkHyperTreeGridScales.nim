## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridScales.h
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
##  @class   vtkHyperTreeGridScales
##  @brief   A specifalized type of vtkHyperTreeGrid for the case
##  when root cells have uniform sizes in each direction *
##
##  @sa
##  vtkHyperTree vtkHyperTreeGrid vtkRectilinearGrid
##
##  @par Thanks:
##  This class was written by Jacques-Bernard Lekien (CEA)
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

type
  vtkHyperTreeGridScales* {.importcpp: "vtkHyperTreeGridScales",
                           header: "vtkHyperTreeGridScales.h", bycopy.} = object ## *
                                                                            ##  JB Construit cette classe a partir du scale de la maille
                                                                            ##  d'origine d'un HyperTree et du subdivision factor
                                                                            ##
    ## *
    ##  The cache cell scales table
    ##


proc constructvtkHyperTreeGridScales*(branchfactor: cdouble;
                                     scale: array[3, cdouble]): vtkHyperTreeGridScales {.
    constructor, importcpp: "vtkHyperTreeGridScales(@)",
    header: "vtkHyperTreeGridScales.h".}
proc destroyvtkHyperTreeGridScales*(this: var vtkHyperTreeGridScales) {.
    importcpp: "#.~vtkHyperTreeGridScales()", header: "vtkHyperTreeGridScales.h".}
proc GetBranchFactor*(this: vtkHyperTreeGridScales): cdouble {.noSideEffect,
    importcpp: "GetBranchFactor", header: "vtkHyperTreeGridScales.h".}
proc GetScale*(this: vtkHyperTreeGridScales; level: cuint): ptr cdouble {.noSideEffect,
    importcpp: "GetScale", header: "vtkHyperTreeGridScales.h".}
proc GetScaleX*(this: vtkHyperTreeGridScales; level: cuint): cdouble {.noSideEffect,
    importcpp: "GetScaleX", header: "vtkHyperTreeGridScales.h".}
proc GetScaleY*(this: vtkHyperTreeGridScales; level: cuint): cdouble {.noSideEffect,
    importcpp: "GetScaleY", header: "vtkHyperTreeGridScales.h".}
proc GetScaleZ*(this: vtkHyperTreeGridScales; level: cuint): cdouble {.noSideEffect,
    importcpp: "GetScaleZ", header: "vtkHyperTreeGridScales.h".}
proc GetScale*(this: vtkHyperTreeGridScales; level: cuint; scale: array[3, cdouble]) {.
    noSideEffect, importcpp: "GetScale", header: "vtkHyperTreeGridScales.h".}
proc GetCurrentFailLevel*(this: vtkHyperTreeGridScales): cuint {.noSideEffect,
    importcpp: "GetCurrentFailLevel", header: "vtkHyperTreeGridScales.h".}
##  VTK-HeaderTest-Exclude: vtkHyperTreeGridScales.h
