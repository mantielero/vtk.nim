## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkFacetWriter.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkFacetWriter
##  @brief   reads a dataset in Facet format
##
##  vtkFacetWriter creates an unstructured grid dataset. It reads ASCII files
##  stored in Facet format
##
##  The facet format looks like this:
##  FACET FILE ...
##  nparts
##  Part 1 name
##  0
##  npoints 0 0
##  p1x p1y p1z
##  p2x p2y p2z
##  ...
##  1
##  Part 1 name
##  ncells npointspercell
##  p1c1 p2c1 p3c1 ... pnc1 materialnum partnum
##  p1c2 p2c2 p3c2 ... pnc2 materialnum partnum
##  ...
##

## !!!Ignored construct:  # vtkFacetWriter_h [NewLine] # vtkFacetWriter_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkInformation ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOGEOMETRY_EXPORT vtkFacetWriter : public vtkPolyDataAlgorithm { public : static vtkFacetWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFacetWriter :: IsTypeOf ( type ) ; } static vtkFacetWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFacetWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFacetWriter * NewInstance ( ) const { return vtkFacetWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFacetWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFacetWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify file name of Facet datafile to read
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} *
##  Write data
##  void Write ( ) ; void WriteToStream ( ostream * ost ) ; protected : vtkFacetWriter ( ) ; ~ vtkFacetWriter ( ) override ;  This is called by the superclass.
##  This is the method you should override. int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int WriteDataToStream ( ostream * ost , vtkPolyData * data ) ; char * FileName ; ostream * OutputStream ; private : vtkFacetWriter ( const vtkFacetWriter & ) = delete ; void operator = ( const vtkFacetWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
