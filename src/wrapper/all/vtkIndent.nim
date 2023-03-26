## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIndent.h
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
##  @class   vtkIndent
##  @brief   a simple class to control print indentation
##
##  vtkIndent is used to control indentation during the chaining print
##  process. This way nested objects can correctly indent themselves.
##

## !!!Ignored construct:  # vtkIndent_h [NewLine] # vtkIndent_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkSystemIncludes.h [NewLine] class vtkIndent ;
## Error: token expected: ; but got: &!!!

## !!!Ignored construct:  VTKCOMMONCORE_EXPORT ostream & operator << ( ostream & os , const vtkIndent & o ) ;
## Error: token expected: ; but got: &!!!

## !!!Ignored construct:  class VTKCOMMONCORE_EXPORT vtkIndent { public : void Delete ( ) { delete this ; } explicit vtkIndent ( int ind = 0 ) { this -> Indent = ind ; } static vtkIndent * New ( ) ; *
##  Determine the next indentation level. Keep indenting by two until the
##  max of forty.
##  vtkIndent GetNextIndent ( ) ; *
##  Print out the indentation. Basically output a bunch of spaces.
##  friend VTKCOMMONCORE_EXPORT ostream & operator << ( ostream & os , const vtkIndent & o ) ; protected : int Indent ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkIndent.h
