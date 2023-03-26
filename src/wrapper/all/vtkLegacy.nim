## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLegacy.h.in
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

## !!!Ignored construct:  # vtkLegacy_h [NewLine] # vtkLegacy_h [NewLine] ----------------------------------------------------------------------------
##    _  _   ___   _____  ___                          _  _   ___   _____  ___
##   | \| | / _ \ |_   _|| __|                        | \| | / _ \ |_   _|| __|
##   | .  || (_) |  | |  | _|                         | .  || (_) |  | |  | _|
##   |_|\_| \___/   |_|  |___|                        |_|\_| \___/   |_|  |___|
##
##  The mechanisms present in this file should no longer be used. Instead, the
##  mechanisms present in `vtkDeprecation.h` should be preferred. The benefits:
##
##    - documentation of *when* the method was removed
##    - support for ignoring warnings if an older VTK is also expected to work
##    - no VTK build will magically take methods away from clients
##
##  When these must be used (though it is no excuse; just pick a new name):
##
##    - changing the signature of a method (e.g., the return type)
##    - adding non-optional arguments in a way that doesn't support overloading
## ----------------------------------------------------------------------------  Compatibility settings. # [NewLine]  #undef VTK_LEGACY_SILENT ----------------------------------------------------------------------------
##  Setup legacy code policy.  Define VTK_LEGACY macro to mark legacy methods where they are
##  declared in their class.  Example usage:
##
##    // @deprecated Replaced by MyOtherMethod() as of VTK 5.0.
##    VTK_LEGACY(void MyMethod()); # defined ( ) [NewLine]  Remove legacy methods completely.  Put a bogus declaration in
##  place to avoid stray semicolons because this is an error for some
##  compilers.  Using a class forward declaration allows any number
##  of repeats in any context without generating unique names. # VTK_LEGACY ( method ) VTK_LEGACY__0 ( method , __LINE__ ) [NewLine] # VTK_LEGACY__0 ( method , line ) VTK_LEGACY__1 ( method , line ) [NewLine] # VTK_LEGACY__1 ( method , line ) class vtkLegacyMethodRemoved ## line [NewLine] # defined ( VTK_LEGACY_SILENT ) || defined ( VTK_WRAPPING_CXX ) [NewLine]  Provide legacy methods with no warnings. # VTK_LEGACY ( method ) method [NewLine] # [NewLine]  Setup compile-time warnings for uses of deprecated methods if
##  possible on this compiler. # defined ( __GNUC__ ) && ! defined ( __INTEL_COMPILER ) [NewLine] # VTK_LEGACY ( method ) method __attribute__ ( ( deprecated ) ) [NewLine] # defined ( _MSC_VER ) [NewLine] # VTK_LEGACY ( method ) __declspec ( deprecated ) method [NewLine] # [NewLine] # VTK_LEGACY ( method ) method [NewLine] # [NewLine] # [NewLine]  Macros to create runtime deprecation warning messages in function
##  bodies.  Example usage:
##
##    #if !defined(VTK_LEGACY_REMOVE)
##    void vtkMyClass::MyOldMethod()
##    {
##      VTK_LEGACY_BODY(vtkMyClass::MyOldMethod, "VTK 5.0");
##    }
##    #endif
##
##    #if !defined(VTK_LEGACY_REMOVE)
##    void vtkMyClass::MyMethod()
##    {
##      VTK_LEGACY_REPLACED_BODY(vtkMyClass::MyMethod, "VTK 5.0",
##                               vtkMyClass::MyOtherMethod);
##    }
##    #endif # defined ( ) || defined ( VTK_LEGACY_SILENT ) [NewLine] # VTK_LEGACY_BODY ( method , version ) [NewLine] # VTK_LEGACY_REPLACED_BODY ( method , version , replace ) [NewLine] # [NewLine] # VTK_LEGACY_BODY ( method , version ) do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkmsg <<  #  was deprecated for  version  and will be removed in a future version. ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayGenericWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) [NewLine] # VTK_LEGACY_REPLACED_BODY ( method , version , replace ) do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkmsg <<  #  was deprecated for  version  and will be removed in a future version.  Use  #  instead. ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayGenericWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) [NewLine] # [NewLine] # [NewLine]
## Error: token expected: ; but got: ##!!!
