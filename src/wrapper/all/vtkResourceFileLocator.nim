## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResourceFileLocator.h
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
##  @class vtkResourceFileLocator
##  @brief utility to locate resource files.
##
##  VTK based application often need to locate resource files, such configuration
##  files, Python modules, etc. vtkResourceFileLocator provides methods that can
##  be used to locate such resource files at runtime.
##
##  Using `Locate`, one can locate files relative to an
##  anchor directory such as the executable directory, or the library directory.
##
##  `GetLibraryPathForSymbolUnix` and `GetLibraryPathForSymbolWin32` methods can
##  be used to locate the library that provides a particular symbol. For example,
##  this is used by `vtkPythonInterpreter` to ensure that the `vtk` Python package
##  is located relative the VTK libraries, irrespective of the application location.
##

## !!!Ignored construct:  # vtkResourceFileLocator_h [NewLine] # vtkResourceFileLocator_h [NewLine] # vtkCommonMiscModule.h  For export macro # vtkObject.h [NewLine] # < string >  needed for std::string # < vector >  needed for std::vector [NewLine] class VTKCOMMONMISC_EXPORT vtkResourceFileLocator : public vtkObject { public : static vtkResourceFileLocator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkResourceFileLocator :: IsTypeOf ( type ) ; } static vtkResourceFileLocator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkResourceFileLocator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkResourceFileLocator * NewInstance ( ) const { return vtkResourceFileLocator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResourceFileLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResourceFileLocator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The log verbosity to use when logging information about the resource
##  searching. Default is `vtkLogger::VERBOSITY_TRACE`.
##  virtual void SetLogVerbosity ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LogVerbosity  to  << _arg ) ; if ( this -> LogVerbosity != _arg ) { this -> LogVerbosity = _arg ; this -> Modified ( ) ; } } ; virtual int GetLogVerbosity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LogVerbosity  of  << this -> LogVerbosity ) ; return this -> LogVerbosity ; } ; /@} /@{ *
##  Given a starting anchor directory, look for the landmark file relative to
##  the anchor. If found return the anchor. If not found, go one directory up
##  and then look the landmark file again.
##  virtual std :: string Locate ( const std :: string & anchor , const std :: string & landmark , const std :: string & defaultDir = std :: string ( ) ) ; /@} /@{ *
##  This variant is used to look for landmark relative to the anchor using
##  additional prefixes for the landmark file. For example, if you're looking for
##  `vtk/__init__.py`, but it can be placed relative to your anchor location
##  (let's say the executable directory), under "lib" or "lib/python", then
##  use this variant with "lib", and "lib/python" passed in as the landmark
##  prefixes. On success, the returned value will be anchor + matching prefix.
##  virtual std :: string Locate ( const std :: string & anchor , const std :: vector < std :: string > & landmark_prefixes , const std :: string & landmark , const std :: string & defaultDir = std :: string ( ) ) ; /@} /@{ *
##  Returns the name of the library providing the symbol. For example, if you
##  want to locate where the VTK libraries located call
##  `GetLibraryPathForSymbolUnix("GetVTKVersion")` on Unixes and
##  `GetLibraryPathForSymbolWin32(GetVTKVersion)` on Windows. Alternatively, you
##  can simply use the `vtkGetLibraryPathForSymbol(GetVTKVersion)` macro
##  that makes the appropriate call as per the current platform.
##  static VTK_FILEPATH std :: string GetLibraryPathForSymbolUnix ( const char * symbolname ) ; static VTK_FILEPATH std :: string GetLibraryPathForSymbolWin32 ( const void * fptr ) ; /@} protected : vtkResourceFileLocator ( ) ; ~ vtkResourceFileLocator ( ) override ; private : vtkResourceFileLocator ( const vtkResourceFileLocator & ) = delete ; void operator = ( const vtkResourceFileLocator & ) = delete ; int LogVerbosity ; } ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  # defined ( _WIN32 ) && ! defined ( __CYGWIN__ ) [NewLine] # vtkGetLibraryPathForSymbol ( function ) vtkResourceFileLocator :: GetLibraryPathForSymbolWin32 ( reinterpret_cast < const void * > [end of template] ( & function ) ) [NewLine] # [NewLine] # vtkGetLibraryPathForSymbol ( function ) vtkResourceFileLocator :: GetLibraryPathForSymbolUnix ( # ) [NewLine] # [NewLine] # [NewLine]
## Error: did not expect #!!!
