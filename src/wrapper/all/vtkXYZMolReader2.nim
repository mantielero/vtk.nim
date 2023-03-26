## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXYZMolReader2.h
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
##  @class   vtkXYZMolReader2
##  @brief   read Molecular Data files
##
##  vtkXYZMolReader2 is a source object that reads Molecule files
##  The reader will detect multiple timesteps in an XYZ molecule file.
##
##  @par Thanks:
##  Dr. Jean M. Favre who developed and contributed this class
##

import
  vtkIOChemistryModule, vtkMoleculeAlgorithm

discard "forward decl of vtkMolecule"
type
  vtkXYZMolReader2* {.importcpp: "vtkXYZMolReader2", header: "vtkXYZMolReader2.h",
                     bycopy.} = object of vtkMoleculeAlgorithm
    vtkXYZMolReader2* {.importc: "vtkXYZMolReader2".}: VTK_NEWINSTANCE
    ##  to store beginning of each step


proc New*(): ptr vtkXYZMolReader2 {.importcpp: "vtkXYZMolReader2::New(@)",
                                header: "vtkXYZMolReader2.h".}
type
  vtkXYZMolReader2Superclass* = vtkMoleculeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXYZMolReader2::IsTypeOf(@)", header: "vtkXYZMolReader2.h".}
proc IsA*(this: var vtkXYZMolReader2; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkXYZMolReader2.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXYZMolReader2 {.
    importcpp: "vtkXYZMolReader2::SafeDownCast(@)", header: "vtkXYZMolReader2.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXYZMolReader2 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXYZMolReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXYZMolReader2 :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXYZMolReader2; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXYZMolReader2.h".}
proc GetOutput*(this: var vtkXYZMolReader2): ptr vtkMolecule {.importcpp: "GetOutput",
    header: "vtkXYZMolReader2.h".}
proc SetOutput*(this: var vtkXYZMolReader2; a2: ptr vtkMolecule) {.
    importcpp: "SetOutput", header: "vtkXYZMolReader2.h".}
proc SetFileName*(this: var vtkXYZMolReader2; arg: cstring) {.
    importcpp: "SetFileName", header: "vtkXYZMolReader2.h".}
proc GetFileName*(this: var vtkXYZMolReader2): cstring {.importcpp: "GetFileName",
    header: "vtkXYZMolReader2.h".}
  ## /@}