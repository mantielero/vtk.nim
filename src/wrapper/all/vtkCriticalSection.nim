## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCriticalSection.h
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
##  @class   vtkCriticalSection
##  @brief   Critical section locking class
##
##  vtkCriticalSection allows the locking of variables which are accessed
##  through different threads.  This header file also defines
##  vtkSimpleCriticalSection which is not a subclass of vtkObject.
##  The API is identical to that of vtkMutexLock, and the behavior is
##  identical as well, except on Windows 9x/NT platforms. The only difference
##  on these platforms is that vtkMutexLock is more flexible, in that
##  it works across processes as well as across threads, but also costs
##  more, in that it evokes a 600-cycle x86 ring transition. The
##  vtkCriticalSection provides a higher-performance equivalent (on
##  Windows) but won't work across processes. Since it is unclear how,
##  in vtk, an object at the vtk level can be shared across processes
##  in the first place, one should use vtkCriticalSection unless one has
##  a very good reason to use vtkMutexLock. If higher-performance equivalents
##  for non-Windows platforms (Irix, SunOS, etc) are discovered, they
##  should replace the implementations in this class
##

## !!!Ignored construct:  # vtkCriticalSection_h [NewLine] # vtkCriticalSection_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkObject.h [NewLine] # < mutex >  for std::mutex [NewLine]  Remove with VTK_DEPRECATED_IN_9_2_0 because it was not actually deprecated
##  in 9.1.0. VTK_DEPRECATED_IN_9_1_0 ( Use std::mutex instead ) class VTKCOMMONCORE_EXPORT vtkCriticalSection : public vtkObject { public : static vtkCriticalSection * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCriticalSection :: IsTypeOf ( type ) ; } static vtkCriticalSection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCriticalSection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCriticalSection * NewInstance ( ) const { return vtkCriticalSection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCriticalSection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCriticalSection :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Lock the vtkCriticalSection
##  void Lock ( ) ; *
##  Unlock the vtkCriticalSection
##  void Unlock ( ) ; protected : std :: mutex mtx ; vtkCriticalSection ( ) = default ; ~ vtkCriticalSection ( ) override = default ; private : vtkCriticalSection ( const vtkCriticalSection & ) = delete ; void operator = ( const vtkCriticalSection & ) = delete ; } ;
## Error: expected ';'!!!

proc Lock*() {.importcpp: "::Lock(@)", header: "vtkCriticalSection.h".}
proc Unlock*() {.importcpp: "::Unlock(@)", header: "vtkCriticalSection.h".}