## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkErrorCode.h
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
##  @class   vtkErrorCode
##  @brief   superclass for error codes
##
##  vtkErrorCode is an mechanism for (currently) reader object to
##  return errors during reading file.
##

## !!!Ignored construct:  # vtkErrorCode_h [NewLine] # vtkErrorCode_h [NewLine] # vtkCommonMiscModule.h  For export macro # vtkSystemIncludes.h [NewLine]  The superclass that all commands should be subclasses of class VTKCOMMONMISC_EXPORT vtkErrorCode { public : static const char * GetStringFromErrorCode ( unsigned long error ) ; static unsigned long GetErrorCodeFromString ( const char * error ) ; static unsigned long GetLastSystemError ( ) ;  all the currently defined error codes
##  developers can use -- vtkErrorCode::UserError + int to
##  specify their own errors.
##  if this list is adjusted, be sure to adjust vtkErrorCodeErrorStrings
##  in vtkErrorCode.cxx to match. enum ErrorIds { NoError = 0 , FirstVTKErrorCode = 20000 , FileNotFoundError , CannotOpenFileError , UnrecognizedFileTypeError , PrematureEndOfFileError , FileFormatError , NoFileNameError , OutOfDiskSpaceError , UnknownError , UserError = 40000 } ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkErrorCode.h
