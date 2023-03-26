## =========================================================================
##
##   Program:   Visualization Toolkit
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
##  @class   vtkStateStorage
##  @brief   Class to make storing and comparing state quick and easy
##
##  vtkStateStorage is just a thin wrapper around std::vector<unsigned char>
##  It is best to use this class as an ivar so that allocs do not happen
##  too often.
##
##  Example usage:
##  @code
##
##  // compute the new state in a temp ivar
##  // note that clear does not free memory
##  this->TempState.Clear();
##  this->TempState.Append(act->GetProperty()->GetMTime(), "property mtime");
##  this->TempState.Append(
##    this->CurrentInput ? this->CurrentInput->GetMTime() : 0, "input mtime");
##  this->TempState.Append(
##    act->GetTexture() ? act->GetTexture()->GetMTime() : 0, "texture mtime");
##
##  // now compare against the last state value
##
##  if (this->VBOBuildState != this->TempState)
##  {
##    // set the ivar to the new state
##    this->VBOBuildState = this->TempState;
##    do something...
##  }
##
##  @endcode
##
##

##  uncomment the following line to add in state debugging information
## #define USE_STATE_DEBUGGING 1

when defined(USE_STATE_DEBUGGING):
  type
    vtkStateStorage* {.importcpp: "vtkStateStorage", header: "vtkStateStorage.h",
                      bycopy.} = object

  proc constructvtkStateStorage*(): vtkStateStorage {.constructor,
      importcpp: "vtkStateStorage(@)", header: "vtkStateStorage.h".}
  proc Clear*(this: var vtkStateStorage) {.importcpp: "Clear",
                                       header: "vtkStateStorage.h".}
  proc Append*[T](this: var vtkStateStorage; value: T; name: cstring) {.
      importcpp: "Append", header: "vtkStateStorage.h".}
  proc Append*(this: var vtkStateStorage; value: T; name: cstring) {.
      importcpp: "Append", header: "vtkStateStorage.h".}
else:
  type
    vtkStateStorage* {.importcpp: "vtkStateStorage", header: "vtkStateStorage.h",
                      bycopy.} = object

  proc constructvtkStateStorage*(): vtkStateStorage {.constructor,
      importcpp: "vtkStateStorage(@)", header: "vtkStateStorage.h".}
  proc Clear*(this: var vtkStateStorage) {.importcpp: "Clear",
                                       header: "vtkStateStorage.h".}
  proc Append*[T](this: var vtkStateStorage; value: T; name: cstring) {.
      importcpp: "Append", header: "vtkStateStorage.h".}
  ## !!!Ignored construct:  vtkStateStorage & operator = ( const vtkStateStorage & b ) = default ;
  ## Error: token expected: [integer literal] but got: [identifier]!!!
  proc Append*(this: var vtkStateStorage; value: T; a3: cstring) {.importcpp: "Append",
      header: "vtkStateStorage.h".}
##  VTK-HeaderTest-Exclude: vtkStateStorage.h
