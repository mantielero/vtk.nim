## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParseMain.h
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
##  vtkParseMain.h provides argument parsing for the wrapper executables.
##
##  Usage: vtkWrap [options] infile ...
##
##  -D <macro[=def]>  add a macro definition
##  -U <macro>        cancel a macro definition
##  -I <dir>          add an include directory
##  -o <file>         specify the output file
##  @<file>           read arguments from a file
##  --help            print a help message and exit
##  --version         print the VTK version number and exit
##  --hints <file>    hints file
##  --types <file>    type hierarchy file
##
##  Notes:
##
##  1) The "-o" option is needed when there are multiple input files.
##     Otherwise, the output file can be given after the input file.
##
##  2) The "@file" option allows arguments to be stored in a file,
##     instead of given on the command line.  The use of such a file
##     is sometimes necessary to avoid overflowing the 8191-character
##     command-line limit on Windows.  If the file is not found, then
##     "@file" will be passed as as a command-line parameter.
##

## !!!Ignored construct:  # vtkParseMain_h [NewLine] # vtkParseMain_h [NewLine] # vtkParseData.h [NewLine] # vtkWrappingToolsModule.h [NewLine] # < stdio . h > [NewLine] # _WIN32 [NewLine] # < stddef . h >  for wchar_t [NewLine] # [NewLine] *
##  Options for the wrappers
##  typedef struct OptionInfo_ { int NumberOfFiles ;  the total number of file arguments char * * Files ;  all of the file arguments char * InputFileName ;  the first file argument char * OutputFileName ;  the second file, or the "-o" file int NumberOfHintFileNames ;  the total number of hints arguments char * * HintFileNames ;  all of the hints arguments int NumberOfHierarchyFileNames ;  the total number of types argument char * * HierarchyFileNames ;  the file preceded by "--types" int DumpMacros ;  dump macros to output } OptionInfo ;
## Error: token expected: ; but got: *!!!

## *
##  Return the options provided on the command line
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT OptionInfo * vtkParse_GetCommandLineOptions ( void ) ;
## Error: token expected: ; but got: *!!!

## *
##  The main function, parses the file and returns the result.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT FileInfo * vtkParse_Main ( int argc , char * argv [ ] ) ;
## Error: token expected: ; but got: *!!!

## *
##  A main function that can take multiple input files.
##  It does not parse the files.  It will exit on error.
##

## !!!Ignored construct:  VTKWRAPPINGTOOLS_EXPORT StringCache * vtkParse_MainMulti ( int argc , char * argv [ ] ) ;
## Error: token expected: ; but got: *!!!

## !!!Ignored construct:  # _WIN32 [NewLine] *
##  Converts wmain args to utf8. This function can only be called once.
##  The caller is permitted to modify the returned argument array.
##  VTKWRAPPINGTOOLS_EXPORT char * * vtkParse_WideArgsToUTF8 ( int argc , wchar_t * wargv [ ] ) ;
## Error: token expected: ; but got: *!!!

## !!!Ignored construct:  # defined ( _WIN32 ) && ! defined ( __MINGW32__ ) [NewLine]  This macro will define wmain() on Win32 and will handle conversion to UTF8 # VTK_PARSE_MAIN ( a , b ) main_with_utf8_args ( a , b ) ;
## Error: expected ';'!!!

proc wmain*(argc: cint; wargv: ptr ptr wchar_t): cint =
  discard

## !!!Ignored construct:  int main_with_utf8_args ( a , b ) [NewLine] # [NewLine] # VTK_PARSE_MAIN ( a , b ) main ( a , b ) [NewLine] # [NewLine] # [NewLine]  VTK-HeaderTest-Exclude: vtkParseMain.h
## Error: expected ';'!!!
