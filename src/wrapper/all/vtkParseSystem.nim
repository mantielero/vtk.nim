## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParseSystem.h
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
##   This file contains routines for accessing the file system.
##

## !!!Ignored construct:  # vtkParseSystem_h [NewLine] # vtkParseSystem_h [NewLine] # vtkParseString.h [NewLine] # vtkWrappingToolsModule.h [NewLine] # < stdio . h >  for FILE* [NewLine] *
##  Contains the paths to all files that have been discoved on the file
##  system. This is used to accelerate searches for header files.
##  typedef struct SystemInfo_ { StringCache * Strings ;  to accelerate string allocation const char * * * FileHashTable ;  paths to all discovered files const char * * * DirHashTable ;  paths to all catalogued directories } SystemInfo ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  An enum to identify the types of discovered files
##

type
  system_filetype_t* {.size: sizeof(cint), importcpp: "system_filetype_t",
                      header: "vtkParseSystem.h".} = enum
    VTK_PARSE_NOFILE = 0, VTK_PARSE_ISFILE = 1, VTK_PARSE_ISDIR = 2


## *
##  Check if a file with the given name exists and return its type:
##  VTK_PARSE_ISDIR, VTK_PARSE_ISFILE, or VTK_PARSE_NOFILE if not found.
##  This will cache results for the entire parent directory in order
##  to accelerate future searches.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT system_filetype_t vtkParse_FileExists ( SystemInfo * info , const char * name ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Free the memory that the SystemInfo uses to cache the files.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParse_FreeFileCache ( SystemInfo * info ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  On Win32, this interpretes fname as UTF8 and then calls wfopen().
##  The returned handle must be freed with fclose().
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT FILE * vtkParse_FileOpen ( const char * fname , const char * mode ) ;
## Error: token expected: ; but got: *!!!

##  VTK-HeaderTest-Exclude: vtkParseSystem.h
