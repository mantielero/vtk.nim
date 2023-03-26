## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoostDividedEdgeBundling.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkBoostDividedEdgeBundling
##  @brief   layout graph edges in directed edge bundles
##
##
##  Uses the technique by Selassie, Heller, and Heer to route graph edges into directed
##  bundles, with "lanes" for bundled edges moving in each direction. This technique
##  works best for networks whose vertices have been positioned already (geospatial
##  graphs, for example). Note that this scales to a few thousand edges in a reasonable
##  period of time (~1 minute). The time complexity comes mainly from the doubling
##  of edge control points each cycle and the complex set of forces between many pairs of
##  edge points.
##
##  The algorithm depends on the Boost graph library for its implementation of all-pairs
##  shortest paths, needed here for determining connectivity compatibility.
##
##  @par Thanks:
##  This algorithm was developed in the paper:
##    David Selassie, Brandon Heller, Jeffrey Heer. Divided Edge Bundling for Directional
##    Network Data. Proceedings of IEEE InfoVis 2011.
##

import
  vtkDirectedGraphAlgorithm, vtkInfovisBoostGraphAlgorithmsModule

type
  vtkBoostDividedEdgeBundling* {.importcpp: "vtkBoostDividedEdgeBundling",
                                header: "vtkBoostDividedEdgeBundling.h", bycopy.} = object of vtkDirectedGraphAlgorithm
    vtkBoostDividedEdgeBundling* {.importc: "vtkBoostDividedEdgeBundling".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBoostDividedEdgeBundling {.
    importcpp: "vtkBoostDividedEdgeBundling::New(@)",
    header: "vtkBoostDividedEdgeBundling.h".}
type
  vtkBoostDividedEdgeBundlingSuperclass* = vtkDirectedGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBoostDividedEdgeBundling::IsTypeOf(@)",
    header: "vtkBoostDividedEdgeBundling.h".}
proc IsA*(this: var vtkBoostDividedEdgeBundling; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBoostDividedEdgeBundling.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBoostDividedEdgeBundling {.
    importcpp: "vtkBoostDividedEdgeBundling::SafeDownCast(@)",
    header: "vtkBoostDividedEdgeBundling.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBoostDividedEdgeBundling :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDirectedGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoostDividedEdgeBundling :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoostDividedEdgeBundling :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBoostDividedEdgeBundling; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBoostDividedEdgeBundling.h".}