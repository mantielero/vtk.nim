## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParsePreprocess.h
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
##   Copyright (c) 2010 David Gobbi.
##
##   Contributed to the VisualizationToolkit by the author in June 2010
##   under the terms of the Visualization Toolkit 2008 copyright.
## -------------------------------------------------------------------------
## *
##   This file provides subroutines to assist in preprocessing
##   C/C++ header files.  It evaluates preprocessor directives
##   and stores a list of all preprocessor macros.
##
##   The preprocessing is done in-line while the file is being
##   parsed.  Macros that are defined in the file are stored but
##   are not automatically expanded.  The parser can query the
##   macro definitions, expand them into plain text, or ask the
##   preprocessor to evaluate them and return an integer result.
##
##   The typical usage of this preprocessor is that the main
##   parser will pass any lines that begin with '#' to the
##   vtkParsePreprocess_HandleDirective() function, which will
##   evaluate the line and provide a return code.  The return
##   code will tell the main parser if a syntax error or macro
##   lookup error occurred, and will also let the parser know
##   if an #if or #else directive requires that the next block
##   of code be skipped.
##

## !!!Ignored construct:  # vtkParsePreprocess_h [NewLine] # vtkParsePreprocess_h [NewLine] # vtkParseString.h [NewLine] # vtkParseSystem.h [NewLine] # vtkWrappingToolsModule.h [NewLine] *
##  The preprocessor int type.  Use the compiler's longest int type.
##  # defined ( _WIN32 ) && ! defined ( __MINGW32__ ) && ! defined ( __CYGWIN__ ) [NewLine] typedef __int64 preproc_int_t ;
## Error: identifier expected, but got: ;!!!

type
  preproc_uint_t* = cu__int64

## !!!Ignored construct:  typedef long long preproc_int_t ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef unsigned long long preproc_uint_t ;
## Error: identifier expected, but got: ;!!!

## *
##  Struct to describe a preprocessor symbol.
##

type
  MacroInfo* {.importcpp: "MacroInfo", header: "vtkParsePreprocess.h", bycopy.} = object
    Name* {.importc: "Name".}: cstring
    Definition* {.importc: "Definition".}: cstring
    Comment* {.importc: "Comment".}: cstring ##  unused
    Ordinal* {.importc: "Ordinal".}: cint ##  gives order of definition
    NumberOfParameters* {.importc: "NumberOfParameters".}: cint ##  only if IsFunction == 1
    Parameters* {.importc: "Parameters".}: cstringArray ##  symbols for parameters
    IsFunction* {.importc: "IsFunction".}: cint ##  this macro requires arguments
    IsVariadic* {.importc: "IsVariadic".}: cint ##  this macro can take unlimited arguments
    IsExternal* {.importc: "IsExternal".}: cint ##  this macro is from an included file
    IsExcluded* {.importc: "IsExcluded".}: cint ##  do not expand this macro


## *
##  Contains all symbols defined thus far (including those defined
##  in any included header files).
##

type
  PreprocessInfo* {.importcpp: "PreprocessInfo", header: "vtkParsePreprocess.h",
                   bycopy.} = object
    FileName* {.importc: "FileName".}: cstring ##  the file that is being parsed
    MacroHashTable* {.importc: "MacroHashTable".}: ptr ptr ptr MacroInfo ##  hash table for macro lookup
    NumberOfIncludeDirectories* {.importc: "NumberOfIncludeDirectories".}: cint
    IncludeDirectories* {.importc: "IncludeDirectories".}: cstringArray
    NumberOfIncludeFiles* {.importc: "NumberOfIncludeFiles".}: cint ##  all included files
    IncludeFiles* {.importc: "IncludeFiles".}: cstringArray
    Strings* {.importc: "Strings".}: ptr StringCache ##  to aid string allocation
    IsExternal* {.importc: "IsExternal".}: cint ##  label all macros as "external"
    ConditionalDepth* {.importc: "ConditionalDepth".}: cint ##  internal state variable
    ConditionalDone* {.importc: "ConditionalDone".}: cint ##  internal state variable
    MacroCounter* {.importc: "MacroCounter".}: cint ##  for ordering macro definitions
    NumberOfMissingFiles* {.importc: "NumberOfMissingFiles".}: cint ##  include files that cannot be found
    MissingFiles* {.importc: "MissingFiles".}: cstringArray
    System* {.importc: "System".}: ptr SystemInfo ##  for cacheing the file system directory


## *
##  Platforms.  Always choose native unless crosscompiling.
##

type
  preproc_platform_t* {.size: sizeof(cint), importcpp: "preproc_platform_t",
                       header: "vtkParsePreprocess.h".} = enum
    VTK_PARSE_NATIVE, VTK_PARSE_UNDEF


## *
##  Search methods for include files.
##

type
  preproc_search_t* {.size: sizeof(cint), importcpp: "preproc_search_t",
                     header: "vtkParsePreprocess.h".} = enum
    VTK_PARSE_CURDIR_INCLUDE, ##  look in current directory first
    VTK_PARSE_SOURCE_INCLUDE, ##  look in source directory first
    VTK_PARSE_SYSTEM_INCLUDE  ##  search system directories first


## *
##  Directive return values.
##

type
  preproc_return_t* {.size: sizeof(cint), importcpp: "preproc_return_t",
                     header: "vtkParsePreprocess.h".} = enum
    VTK_PARSE_OK = 0, VTK_PARSE_SKIP = 1, ##  skip next block
    VTK_PARSE_PREPROC_DOUBLE = 2, ##  encountered a double
    VTK_PARSE_PREPROC_FLOAT = 3, ##  encountered a float
    VTK_PARSE_PREPROC_STRING = 4, ##  encountered a string
    VTK_PARSE_MACRO_UNDEFINED = 5, ##  macro lookup failed
    VTK_PARSE_MACRO_REDEFINED = 6, ##  attempt to redefine a macro
    VTK_PARSE_FILE_NOT_FOUND = 7, ##  include file not found
    VTK_PARSE_FILE_OPEN_ERROR = 8, ##  include file not readable
    VTK_PARSE_FILE_READ_ERROR = 9, ##  error during read
    VTK_PARSE_MACRO_NUMARGS = 10, ##  wrong number of args to func macro
    VTK_PARSE_SYNTAX_ERROR = 11, ##  any and all syntax errors
    VTK_PARSE_OUT_OF_MEMORY = 12


## *
##  Bitfield for fatal errors.
##

const
  VTK_PARSE_FATAL_ERROR* = 0xF8

## *
##  Handle a preprocessor directive.  Return value VTK_PARSE_OK
##  means that no errors occurred, while VTK_PARSE_SKIP means that
##  a conditional directive was encountered and the next code
##  block should be skipped.  The preprocessor has an internal state
##  machine that keeps track of conditional if/else/endif directives.
##  All other return values indicate errors, and it is up to the
##  parser to decide which errors are fatal.  The preprocessor
##  only considers syntax errors and I/O errors to be fatal.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT int vtkParsePreprocess_HandleDirective ( PreprocessInfo * info , const char * directive ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Evaluate a preprocessor expression, providing an integer result
##  in "val", and whether it is unsigned in "is_unsigned".  A return
##  value of VTK_PARSE_OK means that no errors occurred, while
##  VTK_PREPROC_DOUBLE, VTK_PREPROC_FLOAT, and VTK_PREPROC_STRING
##  indicate that the preprocessor encountered a non-integer value.
##  Error return values are VTK_PARSE_MACRO_UNDEFINED and
##  VTK_PARSE_SYNTAX_ERRORS.  Undefined macros evaluate to zero.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT int vtkParsePreprocess_EvaluateExpression ( PreprocessInfo * info , const char * text , preproc_int_t * val , int * is_unsigned ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Add all standard preprocessor symbols. Use VTK_PARSE_NATIVE for
##  the platform to add the same macros as the native compiler.  For
##  cross-compiling, use VTK_PARSE_UNDEF and then define the macros
##  for the target platform.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParsePreprocess_AddStandardMacros ( PreprocessInfo * info , preproc_platform_t platform ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Add a preprocessor symbol, including a definition.  Return
##  values are VTK_PARSE_OK and VTK_PARSE_MACRO_REDEFINED.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT int vtkParsePreprocess_AddMacro ( PreprocessInfo * info , const char * name , const char * definition ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Remove a preprocessor symbol.  Return values are VTK_PARSE_OK
##  and VTK_PARSE_MACRO_UNDEFINED.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT int vtkParsePreprocess_RemoveMacro ( PreprocessInfo * info , const char * name ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Go through macros in order of definition.
##  Pass NULL to start.  Will return NULL when done.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT MacroInfo * vtkParsePreprocess_NextMacro ( PreprocessInfo * info , MacroInfo * macro ) ;
## Error: token expected: ; but got: *!!!

## *
##  Return a preprocessor symbol struct, or NULL if not found.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT MacroInfo * vtkParsePreprocess_GetMacro ( PreprocessInfo * info , const char * name ) ;
## Error: token expected: ; but got: *!!!

## *
##  Expand a macro.  A function macro must be given an argstring
##  with args in parentheses, otherwise the argstring can be NULL.
##  returns NULL if the wrong number of arguments were given.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT const char * vtkParsePreprocess_ExpandMacro ( PreprocessInfo * info , MacroInfo * macro , const char * argstring ) ;
## Error: token expected: ; but got: *!!!

## *
##  Free an expanded macro
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParsePreprocess_FreeMacroExpansion ( const PreprocessInfo * info , MacroInfo * macro , const char * text ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Fully process a string with the preprocessor, and
##  return a new string or NULL if a fatal error occurred.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT const char * vtkParsePreprocess_ProcessString ( PreprocessInfo * info , const char * text ) ;
## Error: token expected: ; but got: *!!!

## *
##  Free a processed string.  Only call this method if
##  the string returned by ProcessString is different from
##  the original string, because ProcessString will just
##  return the original string if no processing was needed.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParsePreprocess_FreeProcessedString ( const PreprocessInfo * info , const char * text ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Add an include directory.  The directories that were added
##  first will be searched first.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParsePreprocess_IncludeDirectory ( PreprocessInfo * info , const char * name ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Find an include file in the path.  If order is VTK_PARSE_SYSTEM_INCLUDE,
##  then the current directory is ignored unless it is explicitly in the
##  search path.  A null return value indicates that the file was not found.
##  If already_loaded is set, then the file was already loaded.  This
##  preprocessor never loads the same file twice.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT const char * vtkParsePreprocess_FindIncludeFile ( PreprocessInfo * info , const char * filename , preproc_search_t order , int * already_loaded ) ;
## Error: token expected: ; but got: *!!!

## *
##  Process a file as if included from a source file.  The return value
##  will be VTK_PARSE_OK if no errors occurred.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT int vtkParsePreprocess_IncludeFile ( PreprocessInfo * info , const char * filename , preproc_search_t order ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Initialize a preprocessor symbol struct.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParsePreprocess_InitMacro ( MacroInfo * symbol ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Free a preprocessor macro struct
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParsePreprocess_FreeMacro ( MacroInfo * macro ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Initialize a preprocessor struct.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParsePreprocess_Init ( PreprocessInfo * info , const char * filename ) ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Free a preprocessor struct and its contents;
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT void vtkParsePreprocess_Free ( PreprocessInfo * info ) ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkParsePreprocess.h
