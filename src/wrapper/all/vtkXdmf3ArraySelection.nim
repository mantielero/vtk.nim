## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXdmf3ArraySelection.h
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
##  @class   vtkXdmf3ArraySelection
##  @brief   helper to identify requested arrays with
##
##  Used by ParaView GUI to mark arrays, sets, and blocks that reader
##  can optionally read in. Note: we use it for more than just arrays but
##  Paraview code requires "Array" name in the API.
##
##  This file is a helper for the vtkXdmf3Reader and not intended to be
##  part of VTK public API
##

## !!!Ignored construct:  # vtkXdmf3ArraySelection_h [NewLine] # vtkXdmf3ArraySelection_h [NewLine] # vtkIOXdmf3Module.h  For export macro [NewLine] # < map > for superclass template # < string > for superclass's content type [NewLine] # _MSC_VER [NewLine] # warning ( push )  save # warning ( disable : 4251 )  needs to have dll-interface to be used by clients of class # [NewLine] class VTKIOXDMF3_EXPORT vtkXdmf3ArraySelection : public std :: map < std :: string , bool > { public : *
##  used in parallel to send of combine sets
##  void Merge ( const vtkXdmf3ArraySelection & other ) ; *
##  add a new array to the set, with a particular status
##  void AddArray ( const char * name , bool status = true ) ; *
##  test if a particular array is enablled or not
##  bool ArrayIsEnabled ( const char * name ) ; *
##  check if a particular array is in the set yet or not
##  bool HasArray ( const char * name ) ; /@{ *
##  get/set user choice of whether a particular array is to be loaded
##  void SetArrayStatus ( const char * name , bool status ) ; int GetArraySetting ( const char * name ) ; /@} *
##  get string name of a particular array
##  const char * GetArrayName ( int index ) ; *
##  get number of arrays in the set
##  int GetNumberOfArrays ( ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

when defined(_MSC_VER):
  discard