## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWindowsTestUtilities.h
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
##  on msvc add in stack trace info as systeminformation
##  does not seem to include it.
##

## !!!Ignored construct:  # VTK_WINDOWS_TEST_UTILITIES [NewLine] # VTK_WINDOWS_TEST_UTILITIES [NewLine] # vtkCompiler.h [NewLine] # defined ( VTK_COMPILER_MSVC ) && defined ( _WIN32 ) [NewLine] # < sstream > [NewLine] # < windows . h > [NewLine] inline LONG WINAPI vtkWindowsTestUlititiesExceptionHandler ( EXCEPTION_POINTERS * ExceptionInfo ) { switch ( ExceptionInfo -> ExceptionRecord -> ExceptionCode ) { case EXCEPTION_ACCESS_VIOLATION : vtkLog ( ERROR , << Error: EXCEPTION_ACCESS_VIOLATION
##  ) ; break ; case EXCEPTION_ARRAY_BOUNDS_EXCEEDED : vtkLog ( ERROR , << Error: EXCEPTION_ARRAY_BOUNDS_EXCEEDED
##  ) ; break ; case EXCEPTION_BREAKPOINT : vtkLog ( ERROR , << Error: EXCEPTION_BREAKPOINT
##  ) ; break ; case EXCEPTION_DATATYPE_MISALIGNMENT : vtkLog ( ERROR , << Error: EXCEPTION_DATATYPE_MISALIGNMENT
##  ) ; break ; case EXCEPTION_FLT_DENORMAL_OPERAND : vtkLog ( ERROR , << Error: EXCEPTION_FLT_DENORMAL_OPERAND
##  ) ; break ; case EXCEPTION_FLT_DIVIDE_BY_ZERO : vtkLog ( ERROR , << Error: EXCEPTION_FLT_DIVIDE_BY_ZERO
##  ) ; break ; case EXCEPTION_FLT_INEXACT_RESULT : vtkLog ( ERROR , << Error: EXCEPTION_FLT_INEXACT_RESULT
##  ) ; break ; case EXCEPTION_FLT_INVALID_OPERATION : vtkLog ( ERROR , << Error: EXCEPTION_FLT_INVALID_OPERATION
##  ) ; break ; case EXCEPTION_FLT_OVERFLOW : vtkLog ( ERROR , << Error: EXCEPTION_FLT_OVERFLOW
##  ) ; break ; case EXCEPTION_FLT_STACK_CHECK : vtkLog ( ERROR , << Error: EXCEPTION_FLT_STACK_CHECK
##  ) ; break ; case EXCEPTION_FLT_UNDERFLOW : vtkLog ( ERROR , << Error: EXCEPTION_FLT_UNDERFLOW
##  ) ; break ; case EXCEPTION_ILLEGAL_INSTRUCTION : vtkLog ( ERROR , << Error: EXCEPTION_ILLEGAL_INSTRUCTION
##  ) ; break ; case EXCEPTION_IN_PAGE_ERROR : vtkLog ( ERROR , << Error: EXCEPTION_IN_PAGE_ERROR
##  ) ; break ; case EXCEPTION_INT_DIVIDE_BY_ZERO : vtkLog ( ERROR , << Error: EXCEPTION_INT_DIVIDE_BY_ZERO
##  ) ; break ; case EXCEPTION_INT_OVERFLOW : vtkLog ( ERROR , << Error: EXCEPTION_INT_OVERFLOW
##  ) ; break ; case EXCEPTION_INVALID_DISPOSITION : vtkLog ( ERROR , << Error: EXCEPTION_INVALID_DISPOSITION
##  ) ; break ; case EXCEPTION_NONCONTINUABLE_EXCEPTION : vtkLog ( ERROR , << Error: EXCEPTION_NONCONTINUABLE_EXCEPTION
##  ) ; break ; case EXCEPTION_PRIV_INSTRUCTION : vtkLog ( ERROR , << Error: EXCEPTION_PRIV_INSTRUCTION
##  ) ; break ; case EXCEPTION_SINGLE_STEP : vtkLog ( ERROR , << Error: EXCEPTION_SINGLE_STEP
##  ) ; break ; case EXCEPTION_STACK_OVERFLOW : vtkLog ( ERROR , << Error: EXCEPTION_STACK_OVERFLOW
##  ) ; break ; default : vtkLog ( ERROR , << Error: Unrecognized Exception
##  ) ; break ; } std :: string stack = vtksys :: SystemInformation :: GetProgramStack ( 0 , 0 ) ; vtkLog ( ERROR , << stack ) ; return EXCEPTION_CONTINUE_SEARCH ; } inline void vtkWindowsTestUtilitiesSetupForTesting ( void ) { SetUnhandledExceptionFilter ( vtkWindowsTestUlititiesExceptionHandler ) ; } # [NewLine] inline void vtkWindowsTestUtilitiesSetupForTesting ( void ) { return ; } # [NewLine] # [NewLine]  VTK-HeaderTest-Exclude: vtkWindowsTestUtilities.h
## Error: token expected: ; but got: [identifier]!!!
