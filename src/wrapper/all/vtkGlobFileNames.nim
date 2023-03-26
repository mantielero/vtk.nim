## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGlobFileNames.h
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
##  @class   vtkGlobFileNames
##  @brief   find files that match a wildcard pattern
##
##  vtkGlobFileNames is a utility for finding files and directories
##  that match a given wildcard pattern.  Allowed wildcards are
##  *, ?, [...], [!...]. The "*" wildcard matches any substring,
##  the "?" matches any single character, the [...] matches any one of
##  the enclosed characters, e.g. [abc] will match one of a, b, or c,
##  while [0-9] will match any digit, and [!...] will match any single
##  character except for the ones within the brackets.  Special
##  treatment is given to "/" (or "\" on Windows) because these are
##  path separators.  These are never matched by a wildcard, they are
##  only matched with another file separator.
##  @warning
##  This function performs case-sensitive matches on UNIX and
##  case-insensitive matches on Windows.
##  @sa
##  vtkDirectory
##

## !!!Ignored construct:  # vtkGlobFileNames_h [NewLine] # vtkGlobFileNames_h [NewLine] # vtkIOCoreModule.h  For export macro # vtkObject.h [NewLine] class vtkStringArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOCORE_EXPORT vtkGlobFileNames : public vtkObject { public : /@{ *
##  Return the class name as a string.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGlobFileNames :: IsTypeOf ( type ) ; } static vtkGlobFileNames * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGlobFileNames * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGlobFileNames * NewInstance ( ) const { return vtkGlobFileNames :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGlobFileNames :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGlobFileNames :: New ( ) ; } public : ; /@} *
##  Create a new vtkGlobFileNames object.
##  static vtkGlobFileNames * New ( ) ; *
##  Print directory to stream.
##  void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Reset the glob by clearing the list of output filenames.
##  void Reset ( ) ; /@{ *
##  Set the directory in which to perform the glob.  If this is
##  not set, then the current directory will be used.  Also, if
##  you use a glob pattern that contains absolute path (one that
##  starts with "/" or a drive letter) then that absolute path
##  will be used and Directory will be ignored.
##  virtual void SetDirectory ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Directory  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Directory == nullptr && _arg == nullptr ) { return ; } if ( this -> Directory && _arg && ( ! strcmp ( this -> Directory , _arg ) ) ) { return ; } delete [ ] this -> Directory ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Directory = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Directory = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetDirectory ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Directory  of  << ( this -> Directory ? this -> Directory : (null) ) ) ; return this -> Directory ; } ; /@} *
##  Search for all files that match the given expression,
##  sort them, and add them to the output.  This method can
##  be called repeatedly to add files matching additional patterns.
##  Returns 1 if successful, otherwise returns zero.
##  int AddFileNames ( VTK_FILEPATH const char * pattern ) ; /@{ *
##  Recurse into subdirectories.
##  virtual void SetRecurse ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Recurse  to  << _arg ) ; if ( this -> Recurse != _arg ) { this -> Recurse = _arg ; this -> Modified ( ) ; } } ; virtual void RecurseOn ( ) { this -> SetRecurse ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void RecurseOff ( ) { this -> SetRecurse ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetRecurse ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Recurse  of  << this -> Recurse ) ; return this -> Recurse ; } ; /@} *
##  Return the number of files found.
##  int GetNumberOfFileNames ( ) ; *
##  Return the file at the given index, the indexing is 0 based.
##  VTK_FILEPATH const char * GetNthFileName ( int index ) ; /@{ *
##  Get an array that contains all the file names.
##  virtual vtkStringArray * GetnameFileNames ( ) { vtkDebugWithObjectMacro ( this , <<  returning  FileNames  address  << static_cast < vtkStringArray * > ( this -> FileNames ) ) ; return this -> FileNames ; } ; /@} protected : /@{ *
##  Set the wildcard pattern.
##  virtual void SetDirectoryPattern ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Pattern  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Pattern == nullptr && _arg == nullptr ) { return ; } if ( this -> Pattern && _arg && ( ! strcmp ( this -> Pattern , _arg ) ) ) { return ; } delete [ ] this -> Pattern ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Pattern = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Pattern = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetDirectoryPattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Pattern  of  << ( this -> Pattern ? this -> Pattern : (null) ) ) ; return this -> Pattern ; } ; /@} vtkGlobFileNames ( ) ; ~ vtkGlobFileNames ( ) override ; private : char * Directory ;  Directory for search. char * Pattern ;  Wildcard pattern vtkTypeBool Recurse ;  Recurse into subdirectories vtkStringArray * FileNames ;  VTK array of files private : vtkGlobFileNames ( const vtkGlobFileNames & ) = delete ; void operator = ( const vtkGlobFileNames & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
