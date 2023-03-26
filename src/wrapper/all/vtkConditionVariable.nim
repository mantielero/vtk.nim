## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConditionVariable.h
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
##  @class   vtkConditionVariable
##  @brief   mutual exclusion locking class
##
##  vtkConditionVariable allows the locking of variables which are accessed
##  through different threads.  This header file also defines
##  vtkSimpleConditionVariable which is not a subclass of vtkObject.
##
##  The win32 implementation is based on notes provided by
##  Douglas C. Schmidt and Irfan Pyarali,
##  Department of Computer Science,
##  Washington University, St. Louis, Missouri.
##  http://www.cs.wustl.edu/~schmidt/win32-cv-1.html
##

## !!!Ignored construct:  # vtkConditionVariable_h [NewLine] # vtkConditionVariable_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkObject.h [NewLine] # vtkThreads.h  for VTK_USE_PTHREADS and VTK_USE_WIN32_THREADS [NewLine] # vtkMutexLock.h  Need for friend access to vtkSimpleMutexLock [NewLine] # defined ( VTK_USE_PTHREADS ) [NewLine] # < pthread . h >  Need POSIX thread implementation of mutex (even win32 provides mutexes) typedef pthread_cond_t vtkConditionType ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] # [NewLine]  Typically a top level windows application sets _WIN32_WINNT. If it is not set we set it to
##  0x0501 (Windows XP) # VTK_USE_WIN32_THREADS [NewLine] # _WIN32_WINNT [NewLine] # _WIN32_WINNT 0x0501  0x0501 means target Windows XP or later # [NewLine] # vtkWindows.h  Needed for win32 CRITICAL_SECTION, HANDLE, etc. # [NewLine] # VTK_USE_WIN32_THREADS [NewLine] # 1 [NewLine] struct pthread_cond_t_t {  Number of threads waiting on condition. int WaitingThreadCount ;  Lock for WaitingThreadCount CRITICAL_SECTION WaitingThreadCountCritSec ;  Semaphore to block threads waiting for the condition to change. vtkWindowsHANDLE Semaphore ;  An event used to wake up thread(s) waiting on the semaphore
##  when pthread_cond_signal or pthread_cond_broadcast is called. vtkWindowsHANDLE DoneWaiting ;  Was pthread_cond_broadcast called? size_t WasBroadcast ; } ;
## Error: did not expect [NewLine]!!!

type
  pthread_cond_t* = pthread_cond_t_t

## ignored statement

type
  vtkConditionType* = pthread_cond_t

## !!!Ignored construct:  struct pthread_cond_t_t [NewLine] {  Number of threads waiting on condition. int WaitingThreadCount ;  Lock for WaitingThreadCount CRITICAL_SECTION WaitingThreadCountCritSec ;  Number of threads to release when pthread_cond_broadcast()
##  or pthread_cond_signal() is called. int ReleaseCount ;  Used to prevent one thread from decrementing ReleaseCount all
##  by itself instead of letting others respond. int NotifyCount ;  A manual-reset event that's used to block and release waiting threads. vtkWindowsHANDLE Event ; } ;
## Error: identifier expected, but got: [NewLine]!!!

type
  pthread_cond_t* = pthread_cond_t_t

## ignored statement

type
  pthread_cond_t_tvtkConditionType* = pthread_cond_t

when not defined(VTK_USE_PTHREADS):
  when not defined(VTK_USE_WIN32_THREADS):
    type
      pthread_cond_t_tvtkConditionType* = cint
##  Condition variable that is not a vtkObject.

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Use std::condition_variable_any instead. ) class VTKCOMMONCORE_EXPORT vtkSimpleConditionVariable { public : vtkSimpleConditionVariable ( ) ; ~ vtkSimpleConditionVariable ( ) ; static vtkSimpleConditionVariable * New ( ) ; void Delete ( ) { delete this ; } *
##  Wake one thread waiting for the condition to change.
##  void Signal ( ) ; *
##  Wake all threads waiting for the condition to change.
##  void Broadcast ( ) ; *
##  Wait for the condition to change.
##  Upon entry, the mutex must be locked and the lock held by the calling thread.
##  Upon exit, the mutex will be locked and held by the calling thread.
##  Between entry and exit, the mutex will be unlocked and may be held by other threads.
##
##  @param mutex The mutex that should be locked on entry and will be locked on exit (but not in
##    between)
##  @retval Normally, this function returns 0. Should a thread be interrupted by a signal, a
##    non-zero value may be returned.
##  int Wait ( vtkSimpleMutexLock & mutex ) ; protected : vtkConditionType ConditionVariable ; private : vtkSimpleConditionVariable ( const vtkSimpleConditionVariable & other ) = delete ; vtkSimpleConditionVariable & operator = ( const vtkSimpleConditionVariable & rhs ) = delete ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Use std::condition_variable_any instead. ) class VTKCOMMONCORE_EXPORT vtkConditionVariable : public vtkObject { public : static vtkConditionVariable * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkConditionVariable :: IsTypeOf ( type ) ; } static vtkConditionVariable * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkConditionVariable * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkConditionVariable * NewInstance ( ) const { return vtkConditionVariable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConditionVariable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConditionVariable :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Wake one thread waiting for the condition to change.
##  void Signal ( ) ; *
##  Wake all threads waiting for the condition to change.
##  void Broadcast ( ) ; *
##  Wait for the condition to change.
##  Upon entry, the mutex must be locked and the lock held by the calling thread.
##  Upon exit, the mutex will be locked and held by the calling thread.
##  Between entry and exit, the mutex will be unlocked and may be held by other threads.
##
##  @param mutex The mutex that should be locked on entry and will be locked on exit (but not in
##    between)
##  @retval Normally, this function returns 0. Should a thread be interrupted by a signal, a
##    non-zero value may be returned.
##  int Wait ( vtkMutexLock * mutex ) ; protected : vtkConditionVariable ( ) = default ; vtkSimpleConditionVariable SimpleConditionVariable ; private : vtkConditionVariable ( const vtkConditionVariable & ) = delete ; void operator = ( const vtkConditionVariable & ) = delete ; } ;
## Error: expected ';'!!!

proc Signal*() {.importcpp: "pthread_cond_t_t::Signal(@)",
               header: "vtkConditionVariable.h".}
proc Broadcast*() {.importcpp: "pthread_cond_t_t::Broadcast(@)",
                  header: "vtkConditionVariable.h".}
proc Wait*(lock: ptr vtkMutexLock): cint {.importcpp: "pthread_cond_t_t::Wait(@)",
                                      header: "vtkConditionVariable.h".}