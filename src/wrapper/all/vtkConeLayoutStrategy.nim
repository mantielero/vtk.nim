## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConeLayoutStrategy.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##  Copyright 2008 Sandia Corporation.
##  Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##  the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkConeLayoutStrategy
##  @brief   produce a cone-tree layout for a forest
##
##  vtkConeLayoutStrategy positions the nodes of a tree(forest) in 3D
##  space based on the cone-tree approach first described by
##  Robertson, Mackinlay and Card in Proc. CHI'91.  This
##  implementation incorporates refinements to the layout
##  developed by Carriere and Kazman, and by Auber.
##
##  The input graph must be a forest (i.e. a set of trees, or a
##  single tree); in the case of a forest, the input will be
##  converted to a single tree by introducing a new root node,
##  and connecting each root in the input forest to the meta-root.
##  The tree is then laid out, after which the meta-root is removed.
##
##  The cones are positioned so that children lie in planes parallel
##  to the X-Y plane, with the axis of cones parallel to Z, and
##  with Z coordinate increasing with distance of nodes from the root.
##
##  @par Thanks:
##  Thanks to David Duke from the University of Leeds for providing this
##  implementation.
##

import
  vtkGraphLayoutStrategy, vtkInfovisLayoutModule

discard "forward decl of vtkPoints"
type
  vtkConeLayoutStrategy* {.importcpp: "vtkConeLayoutStrategy",
                          header: "vtkConeLayoutStrategy.h", bycopy.} = object of vtkGraphLayoutStrategy
    vtkConeLayoutStrategy* {.importc: "vtkConeLayoutStrategy".}: VTK_NEWINSTANCE
    ##  factor used in mapping layer to Z
    ##  force a compact layout?
    ##  Scale vertical spacing of cones.
    ##  Values accumulated for possible statistical use


proc New*(): ptr vtkConeLayoutStrategy {.importcpp: "vtkConeLayoutStrategy::New(@)",
                                     header: "vtkConeLayoutStrategy.h".}
type
  vtkConeLayoutStrategySuperclass* = vtkGraphLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkConeLayoutStrategy::IsTypeOf(@)",
    header: "vtkConeLayoutStrategy.h".}
proc IsA*(this: var vtkConeLayoutStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkConeLayoutStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkConeLayoutStrategy {.
    importcpp: "vtkConeLayoutStrategy::SafeDownCast(@)",
    header: "vtkConeLayoutStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkConeLayoutStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConeLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConeLayoutStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkConeLayoutStrategy; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkConeLayoutStrategy.h".}
proc SetCompactness*(this: var vtkConeLayoutStrategy; _arg: cfloat) {.
    importcpp: "SetCompactness", header: "vtkConeLayoutStrategy.h".}
## !!!Ignored construct:  virtual float GetCompactness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Compactness  of  << this -> Compactness ) ; return this -> Compactness ; } ;
## Error: expected ';'!!!

proc SetCompactnessCompression*(this: var vtkConeLayoutStrategy; _arg: vtkTypeBool) {.
    importcpp: "SetCompactnessCompression", header: "vtkConeLayoutStrategy.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCompactnessCompression ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Compression  of  << this -> Compression ) ; return this -> Compression ; } ;
## Error: expected ';'!!!

proc CompressionOn*(this: var vtkConeLayoutStrategy) {.importcpp: "CompressionOn",
    header: "vtkConeLayoutStrategy.h".}
proc CompressionOff*(this: var vtkConeLayoutStrategy) {.importcpp: "CompressionOff",
    header: "vtkConeLayoutStrategy.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the spacing parameter that affects space between
  ##  layers of the tree.  If compression is on, Spacing is the
  ##  actual distance between layers.  If compression is off,
  ##  actual distance also includes a factor of the compactness
  ##  and maximum cone radius.
  ##
proc SetCompactnessCompressionSpacing*(this: var vtkConeLayoutStrategy; _arg: cfloat) {.
    importcpp: "SetCompactnessCompressionSpacing",
    header: "vtkConeLayoutStrategy.h".}
## !!!Ignored construct:  virtual float GetCompactnessCompressionSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Spacing  of  << this -> Spacing ) ; return this -> Spacing ; } ;
## Error: expected ';'!!!

proc Layout*(this: var vtkConeLayoutStrategy) {.importcpp: "Layout",
    header: "vtkConeLayoutStrategy.h".}