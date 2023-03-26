## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPostScriptWriter.h
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
##  @class   vtkPostScriptWriter
##  @brief   Writes an image as a PostScript file.
##
##  vtkPostScriptWriter writes an image as a PostScript file using some
##  reasonable scalings and centered on the page which is assumed to be
##  about 8.5 by 11 inches. This is based loosely off of the code from
##  pnmtops.c. Right now there aren't any real options.
##

## !!!Ignored construct:  # vtkPostScriptWriter_h [NewLine] # vtkPostScriptWriter_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageWriter.h [NewLine] class VTKIOIMAGE_EXPORT vtkPostScriptWriter : public vtkImageWriter { public : static vtkPostScriptWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPostScriptWriter :: IsTypeOf ( type ) ; } static vtkPostScriptWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPostScriptWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPostScriptWriter * NewInstance ( ) const { return vtkPostScriptWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPostScriptWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPostScriptWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkPostScriptWriter ( ) = default ; ~ vtkPostScriptWriter ( ) override = default ; void WriteFile ( ostream * file , vtkImageData * data , int extent [ 6 ] , int wExt [ 6 ] ) override ; void WriteFileHeader ( ostream * , vtkImageData * , int wExt [ 6 ] ) override ; void WriteFileTrailer ( ostream * , vtkImageData * ) override ; private : vtkPostScriptWriter ( const vtkPostScriptWriter & ) = delete ; void operator = ( const vtkPostScriptWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
