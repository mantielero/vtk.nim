## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTestUtilities.h
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
##  @class   vtkTestUtilities
##  @brief   Utility functions used for regression testing.
##
##  vtkTestUtilities provides methods to perform common testing operations.
##  These include getting a command line argument or an environment variable,
##  or a default value. Particularly, there are specialized methods to get the
##  root directory for VTK Data, expanding a filename with this root directory.
##

import
  vtkSystemIncludes

when defined(_MSC_VER):        ##  Visual C++ (and Intel C++)
  discard
type
  vtkTestUtilities* {.importcpp: "vtkTestUtilities", header: "vtkTestUtilities.h",
                     bycopy.} = object ## *
                                    ##  Function necessary for accessing the root directory for VTK data. Try the
                                    ##  -D command line argument or VTK_DATA_ROOT or a default value. The returned
                                    ##  string has to be deleted (with delete[]) by the user.
                                    ##


proc GetDataRoot*(argc: cint; argv: ptr cstring): cstring {.
    importcpp: "vtkTestUtilities::GetDataRoot(@)", header: "vtkTestUtilities.h".}
## !!!Ignored construct:  * ExpandDataFileName ( int argc , char * argv [ ] , VTK_FILEPATH const char * fname , int slash = 0 ) ;
## Error: identifier expected, but got: *!!!

proc GetArgOrEnvOrDefault*(arg: cstring; argc: cint; argv: ptr cstring; env: cstring;
                          def: cstring): cstring {.
    importcpp: "vtkTestUtilities::GetArgOrEnvOrDefault(@)",
    header: "vtkTestUtilities.h".}
## !!!Ignored construct:  * ExpandFileNameWithArgOrEnvOrDefault ( const char * arg , int argc , char * argv [ ] , const char * env , const char * def , VTK_FILEPATH const char * fname , int slash = 0 ) ;
## Error: identifier expected, but got: *!!!

proc GetDataRoot*(this: var vtkTestUtilities; argc: cint; argv: ptr cstring): cstring {.
    importcpp: "GetDataRoot", header: "vtkTestUtilities.h".}
proc ExpandDataFileName*(this: var vtkTestUtilities; argc: cint; argv: ptr cstring;
                        fname: cstring; slash: cint): cstring {.
    importcpp: "ExpandDataFileName", header: "vtkTestUtilities.h".}
proc GetArgOrEnvOrDefault*(this: var vtkTestUtilities; arg: cstring; argc: cint;
                          argv: ptr cstring; env: cstring; def: cstring): cstring {.
    importcpp: "GetArgOrEnvOrDefault", header: "vtkTestUtilities.h".}
proc ExpandFileNameWithArgOrEnvOrDefault*(this: var vtkTestUtilities; arg: cstring;
    argc: cint; argv: ptr cstring; env: cstring; def: cstring; fname: cstring; slash: cint): cstring {.
    importcpp: "ExpandFileNameWithArgOrEnvOrDefault", header: "vtkTestUtilities.h".}