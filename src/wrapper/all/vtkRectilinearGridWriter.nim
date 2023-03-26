## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearGridWriter.h
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
##  @class   vtkRectilinearGridWriter
##  @brief   write vtk rectilinear grid data file
##
##  vtkRectilinearGridWriter is a source object that writes ASCII or binary
##  rectilinear grid data files in vtk format. See text for format details.
##
##  @warning
##  Binary files written on one system may not be readable on other systems.
##

## !!!Ignored construct:  # vtkRectilinearGridWriter_h [NewLine] # vtkRectilinearGridWriter_h [NewLine] # vtkDataWriter.h [NewLine] # vtkIOLegacyModule.h  For export macro [NewLine] class vtkRectilinearGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkRectilinearGridWriter : public vtkDataWriter { public : static vtkRectilinearGridWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRectilinearGridWriter :: IsTypeOf ( type ) ; } static vtkRectilinearGridWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRectilinearGridWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRectilinearGridWriter * NewInstance ( ) const { return vtkRectilinearGridWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearGridWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearGridWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the input to this writer.
##  vtkRectilinearGrid * GetInput ( ) ; vtkRectilinearGrid * GetInput ( int port ) ; /@} /@{ *
##  When WriteExtent is on, vtkStructuredPointsWriter writes
##  data extent in the output file. Otherwise, it writes dimensions.
##  The only time this option is useful is when the extents do
##  not start at (0, 0, 0). This is an options to support writing
##  of older formats while still using a newer VTK.
##  virtual void SetWriteExtent ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WriteExtent  to  << _arg ) ; if ( this -> WriteExtent != _arg ) { this -> WriteExtent = _arg ; this -> Modified ( ) ; } } ; virtual bool GetWriteExtent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteExtent  of  << this -> WriteExtent ) ; return this -> WriteExtent ; } ; virtual void WriteExtentOn ( ) { this -> SetWriteExtent ( static_cast < bool > ( 1 ) ) ; } virtual void WriteExtentOff ( ) { this -> SetWriteExtent ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkRectilinearGridWriter ( ) : WriteExtent ( false ) { } ~ vtkRectilinearGridWriter ( ) override = default ; void WriteData ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; bool WriteExtent ; private : vtkRectilinearGridWriter ( const vtkRectilinearGridWriter & ) = delete ; void operator = ( const vtkRectilinearGridWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
