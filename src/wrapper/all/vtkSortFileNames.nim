## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSortFileNames.h
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
##  @class   vtkSortFileNames
##  @brief   Group and sort a set of filenames
##
##  vtkSortFileNames will take a list of filenames (e.g. from
##  a file load dialog) and sort them into one or more series.  If
##  the input list of filenames contains any directories, these can
##  be removed before sorting using the SkipDirectories flag.  This
##  class should be used where information about the series groupings
##  can be determined by the filenames, but it might not be successful
##  in cases where the information about the series groupings is
##  stored in the files themselves (e.g DICOM).
##  @sa
##  vtkImageReader2
##

## !!!Ignored construct:  # vtkSortFileNames_h [NewLine] # vtkSortFileNames_h [NewLine] # vtkIOCoreModule.h  For export macro # vtkObject.h [NewLine] class vtkStringArray ;
## Error: token expected: ; but got: [identifier]!!!

##  this is a helper class defined in the .cxx file

discard "forward decl of vtkStringArrayVector"
## !!!Ignored construct:  class VTKIOCORE_EXPORT vtkSortFileNames : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSortFileNames :: IsTypeOf ( type ) ; } static vtkSortFileNames * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSortFileNames * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSortFileNames * NewInstance ( ) const { return vtkSortFileNames :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSortFileNames :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSortFileNames :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkSortFileNames * New ( ) ; /@{ *
##  Sort the file names into groups, according to similarity in
##  filename name and path.  Files in different directories,
##  or with different extensions, or which do not fit into the same
##  numbered series will be placed into different groups.  This is
##  off by default.
##  virtual void SetGrouping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Grouping  to  << _arg ) ; if ( this -> Grouping != _arg ) { this -> Grouping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGrouping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Grouping  of  << this -> Grouping ) ; return this -> Grouping ; } ; virtual void GroupingOn ( ) { this -> SetGrouping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GroupingOff ( ) { this -> SetGrouping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Sort the files numerically, rather than lexicographically.
##  For filenames that contain numbers, this means the order will be
##  ["file8.dat", "file9.dat", "file10.dat"]
##  instead of the usual alphabetic sorting order
##  ["file10.dat" "file8.dat", "file9.dat"].
##  NumericSort is off by default.
##  virtual void SetGroupingNumericSort ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumericSort  to  << _arg ) ; if ( this -> NumericSort != _arg ) { this -> NumericSort = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGroupingNumericSort ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumericSort  of  << this -> NumericSort ) ; return this -> NumericSort ; } ; virtual void NumericSortOn ( ) { this -> SetGroupingNumericSort ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NumericSortOff ( ) { this -> SetGroupingNumericSort ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Ignore case when sorting.  This flag is honored by both
##  the sorting and the grouping. This is off by default.
##  virtual void SetGroupingNumericSortIgnoreCase ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IgnoreCase  to  << _arg ) ; if ( this -> IgnoreCase != _arg ) { this -> IgnoreCase = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGroupingNumericSortIgnoreCase ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IgnoreCase  of  << this -> IgnoreCase ) ; return this -> IgnoreCase ; } ; virtual void IgnoreCaseOn ( ) { this -> SetGroupingNumericSortIgnoreCase ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void IgnoreCaseOff ( ) { this -> SetGroupingNumericSortIgnoreCase ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Skip directories. If this flag is set, any input item that
##  is a directory rather than a file will not be included in
##  the output.  This is off by default.
##  virtual void SetGroupingNumericSortIgnoreCaseSkipDirectories ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SkipDirectories  to  << _arg ) ; if ( this -> SkipDirectories != _arg ) { this -> SkipDirectories = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGroupingNumericSortIgnoreCaseSkipDirectories ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SkipDirectories  of  << this -> SkipDirectories ) ; return this -> SkipDirectories ; } ; virtual void SkipDirectoriesOn ( ) { this -> SetGroupingNumericSortIgnoreCaseSkipDirectories ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SkipDirectoriesOff ( ) { this -> SetGroupingNumericSortIgnoreCaseSkipDirectories ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set a list of file names to group and sort.
##  void SetInputFileNames ( vtkStringArray * input ) ; virtual vtkStringArray * GetnameInputFileNames ( ) { vtkDebugWithObjectMacro ( this , <<  returning  InputFileNames  address  << static_cast < vtkStringArray * > ( this -> InputFileNames ) ) ; return this -> InputFileNames ; } ; /@} *
##  Get the full list of sorted filenames.
##  virtual vtkStringArray * GetFileNames ( ) ; *
##  Get the number of groups that the names were split into, if
##  grouping is on.  The filenames are automatically split into
##  groups, where the filenames in each group will be identical
##  except for their series numbers.  If grouping is not on, this
##  method will return zero.
##  virtual int GetNumberOfGroups ( ) ; *
##  Get the Nth group of file names.  This method should only
##  be used if grouping is on.  If grouping is off, it will always
##  return null.
##  virtual vtkStringArray * GetNthGroup ( int i ) ; *
##  Update the output filenames from the input filenames.
##  This method is called automatically by GetFileNames()
##  and GetNumberOfGroups() if the input names have changed.
##  virtual void Update ( ) ; protected : vtkSortFileNames ( ) ; ~ vtkSortFileNames ( ) override ; vtkTypeBool NumericSort ; vtkTypeBool IgnoreCase ; vtkTypeBool Grouping ; vtkTypeBool SkipDirectories ; vtkTimeStamp UpdateTime ; vtkStringArray * InputFileNames ; vtkStringArray * FileNames ; vtkStringArrayVector * Groups ; *
##  Fill the output.
##  virtual void Execute ( ) ; *
##  Sort the input string array, and append the results to the output.
##  virtual void SortFileNames ( vtkStringArray * input , vtkStringArray * output ) ; *
##  Separate a string array into groups and append them to the output.
##  virtual void GroupFileNames ( vtkStringArray * input , vtkStringArrayVector * output ) ; private : vtkSortFileNames ( const vtkSortFileNames & ) = delete ; void operator = ( const vtkSortFileNames & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
