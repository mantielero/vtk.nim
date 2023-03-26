## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractPropPicker.h
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
##  @class   vtkAbstractPropPicker
##  @brief   abstract API for pickers that can pick an instance of vtkProp
##
##  vtkAbstractPropPicker is an abstract superclass for pickers that can pick
##  an instance of vtkProp. Some pickers, like vtkWorldPointPicker (not a
##  subclass of this class), cannot identify the prop that is
##  picked. Subclasses of vtkAbstractPropPicker return a prop in the form of a
##  vtkAssemblyPath when a pick is invoked. Note that an vtkAssemblyPath
##  contain a list of vtkAssemblyNodes, each of which in turn contains a
##  reference to a vtkProp and a 4x4 transformation matrix. The path fully
##  describes the entire pick path, so you can pick assemblies or portions of
##  assemblies, or just grab the tail end of the vtkAssemblyPath (which is the
##  picked prop).
##
##  @warning
##  Because a vtkProp can be placed into different assemblies, or even in
##  different leaf positions of the same assembly, the vtkAssemblyPath is
##  used to fully qualify exactly which use of the vtkProp was picked,
##  including its position (since vtkAssemblyPath includes a transformation
##  matrix per node).
##
##  @warning
##  The class returns information about picked actors, props, etc. Note that
##  what is returned by these methods is the top level of the assembly
##  path. This can cause a lot of confusion! For example, if you pick a
##  vtkAssembly, and the returned vtkAssemblyPath has as a leaf a vtkActor,
##  then if you invoke GetActor(), you will get NULL, even though an actor was
##  indeed picked. (GetAssembly() will return something.) Note that the safest
##  thing to do is to do a GetViewProp(), which will always return something if
##  something was picked. A better way to manage picking is to work with
##  vtkAssemblyPath, since this completely defines the pick path from top to
##  bottom in a assembly hierarchy, and avoids confusion when the same prop is
##  used in different assemblies.
##
##  @warning
##  The returned assembly paths refer to assembly nodes that in turn refer
##  to vtkProp and vtkMatrix. This association to vtkProp is not a reference
##  counted association, meaning that dangling references are possible if
##  you do a pick, get an assembly path, and then delete a vtkProp. (Reason:
##  assembly paths create many self-referencing loops that destroy reference
##  counting.)
##
##  @sa
##  vtkPropPicker vtkPicker vtkWorldPointPicker vtkCellPicker vtkPointPicker
##  vtkAssemblyPath vtkAssemblyNode vtkAssemblyPaths vtkAbstractPicker
##  vtkRenderer
##

import
  vtkAbstractPicker, vtkRenderingCoreModule

discard "forward decl of vtkProp"
discard "forward decl of vtkPropAssembly"
discard "forward decl of vtkAssembly"
discard "forward decl of vtkActor"
discard "forward decl of vtkVolume"
discard "forward decl of vtkProp3D"
discard "forward decl of vtkAssemblyPath"
discard "forward decl of vtkActor2D"
type
  vtkAbstractPropPicker* {.importcpp: "vtkAbstractPropPicker",
                          header: "vtkAbstractPropPicker.h", bycopy.} = object of vtkAbstractPicker
    vtkAbstractPropPicker* {.importc: "vtkAbstractPropPicker".}: VTK_NEWINSTANCE
    ##  this is what is picked, and includes the prop

  vtkAbstractPropPickerSuperclass* = vtkAbstractPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractPropPicker::IsTypeOf(@)",
    header: "vtkAbstractPropPicker.h".}
proc IsA*(this: var vtkAbstractPropPicker; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractPropPicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractPropPicker {.
    importcpp: "vtkAbstractPropPicker::SafeDownCast(@)",
    header: "vtkAbstractPropPicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractPropPicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractPropPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractPropPicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractPropPicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractPropPicker.h".}
proc SetPath*(this: var vtkAbstractPropPicker; a2: ptr vtkAssemblyPath) {.
    importcpp: "SetPath", header: "vtkAbstractPropPicker.h".}
proc GetnamePath*(this: var vtkAbstractPropPicker): ptr vtkAssemblyPath {.
    importcpp: "GetnamePath", header: "vtkAbstractPropPicker.h".}
  ## /@}
  ##  The following are convenience methods to maintain API with older
  ##  versions of VTK, and to allow query for the return type of a pick. Note:
  ##  the functionality of these methods can also be obtained by using the
  ##  returned vtkAssemblyPath and using the IsA() to determine type.
  ## *
  ##  Return the vtkProp that has been picked. If NULL, nothing was picked.
  ##  If anything at all was picked, this method will return something.
  ##
proc GetViewProp*(this: var vtkAbstractPropPicker): ptr vtkProp {.
    importcpp: "GetViewProp", header: "vtkAbstractPropPicker.h".}
proc GetProp3D*(this: var vtkAbstractPropPicker): ptr vtkProp3D {.
    importcpp: "GetProp3D", header: "vtkAbstractPropPicker.h".}
proc GetActor*(this: var vtkAbstractPropPicker): ptr vtkActor {.importcpp: "GetActor",
    header: "vtkAbstractPropPicker.h".}
proc GetActor2D*(this: var vtkAbstractPropPicker): ptr vtkActor2D {.
    importcpp: "GetActor2D", header: "vtkAbstractPropPicker.h".}
proc GetVolume*(this: var vtkAbstractPropPicker): ptr vtkVolume {.
    importcpp: "GetVolume", header: "vtkAbstractPropPicker.h".}
proc GetAssembly*(this: var vtkAbstractPropPicker): ptr vtkAssembly {.
    importcpp: "GetAssembly", header: "vtkAbstractPropPicker.h".}
proc GetPropAssembly*(this: var vtkAbstractPropPicker): ptr vtkPropAssembly {.
    importcpp: "GetPropAssembly", header: "vtkAbstractPropPicker.h".}