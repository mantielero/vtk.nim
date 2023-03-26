## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    TestErrorObserver.h
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

## !!!Ignored construct:  class ErrorObserver : public :: vtkCommand { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCommand Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCommand :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> ErrorObserver :: IsTypeOf ( type ) ; } static ErrorObserver * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < ErrorObserver * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE ErrorObserver * NewInstance ( ) const { return ErrorObserver :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCommand :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> ErrorObserver :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return ErrorObserver :: New ( ) ; } public : ; ErrorObserver ( ) : Error ( false ) , Warning ( false ) , ErrorMessage (  ) , WarningMessage (  ) { } static ErrorObserver * New ( ) { return new ErrorObserver ; } bool GetError ( ) const { return this -> Error ; } bool GetWarning ( ) const { return this -> Warning ; } void Clear ( ) { this -> Error = false ; this -> Warning = false ; this -> ErrorMessage =  ; this -> WarningMessage =  ; } void Execute ( vtkObject * vtkNotUsed ( caller ) , unsigned long event , void * calldata ) override { switch ( event ) { case vtkCommand :: ErrorEvent : ErrorMessage += static_cast < char * > ( calldata ) ; this -> Error = true ; break ; case vtkCommand :: WarningEvent : WarningMessage += static_cast < char * > ( calldata ) ; this -> Warning = true ; break ; } } std :: string GetErrorMessage ( ) { return ErrorMessage ; } std :: string GetWarningMessage ( ) { return WarningMessage ; } *
##  Check to see if an error or warning message exists.
##  Given an observer, a message and a status with an initial value,
##  Returns 1 if an error does not exist, or if msg is not contained
##  in the error message.
##  Returns 0 if the error exists and msg is contained in the error
##  message.
##  If the test fails, it reports the failing message, prepended with "ERROR:".
##  ctest will detect the ERROR and report a failure.
##  int CheckErrorMessage ( const std :: string & expectedMsg ) { if ( ! this -> GetError ( ) ) { std :: cout << ERROR: Failed to catch any error. Expected the error message to contain " << expectedMsg << [char literal] << std :: endl ; return 1 ; } else { std :: string gotMsg ( this -> GetErrorMessage ( ) ) ; if ( gotMsg . find ( expectedMsg ) == std :: string :: npos ) { std :: cout << ERROR: Error message does not contain " << expectedMsg << " got
## " << gotMsg << [char literal] << std :: endl ; return 1 ; } } this -> Clear ( ) ; return 0 ; } int CheckWarningMessage ( const std :: string & expectedMsg ) { if ( ! this -> GetWarning ( ) ) { std :: cout << ERROR: Failed to catch any warning. Expected the warning message to contain " << expectedMsg << [char literal] << std :: endl ; return 1 ; } else { std :: string gotMsg ( this -> GetWarningMessage ( ) ) ; if ( gotMsg . find ( expectedMsg ) == std :: string :: npos ) { std :: cout << ERROR: Warning message does not contain " << expectedMsg << " got
## " << gotMsg << [char literal] << std :: endl ; return 1 ; } } this -> Clear ( ) ; return 0 ; } private : bool Error ; bool Warning ; std :: string ErrorMessage ; std :: string WarningMessage ; } ;
## Error: identifier expected, but got: ::!!!

##  VTK-HeaderTest-Exclude: vtkTestErrorObserver.h
