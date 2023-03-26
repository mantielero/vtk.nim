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
##  @class   vtkSimpleCriticalSection
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

## !!!Ignored construct:  # vtkSimpleCriticalSection_h [NewLine] # vtkSimpleCriticalSection_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkSystemIncludes.h [NewLine] # vtkThreads.h  for VTK_USE_PTHREADS and VTK_USE_WIN32_THREADS [NewLine] # defined ( VTK_USE_PTHREADS ) [NewLine] # < pthread . h >  Needed for pthreads implementation of mutex typedef pthread_mutex_t vtkCritSecType ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] # [NewLine] # VTK_USE_WIN32_THREADS [NewLine] # vtkWindows.h  Needed for win32 implementation of mutex typedef CRITICAL_SECTION vtkCritSecType ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] # [NewLine] # VTK_USE_PTHREADS [NewLine] # VTK_USE_WIN32_THREADS [NewLine] typedef int vtkCritSecType ;
## Error: did not expect [NewLine]!!!

##  Critical Section object that is not a vtkObject.

## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_1_0 ( Use std::mutex instead. ) VTKCOMMONCORE_EXPORT vtkSimpleCriticalSection { public :  Default cstor vtkSimpleCriticalSection ( ) { this -> Init ( ) ; }  Construct object locked if isLocked is different from 0 vtkSimpleCriticalSection ( int isLocked ) { this -> Init ( ) ; if ( isLocked ) { this -> Lock ( ) ; } }  Destructor virtual ~ vtkSimpleCriticalSection ( ) ; void Init ( ) ; *
##  Lock the vtkCriticalSection
##  void Lock ( ) ; *
##  Unlock the vtkCriticalSection
##  void Unlock ( ) ; protected : vtkCritSecType CritSec ; private : vtkSimpleCriticalSection ( const vtkSimpleCriticalSection & other ) = delete ; vtkSimpleCriticalSection & operator = ( const vtkSimpleCriticalSection & rhs ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkSimpleCriticalSection.h
