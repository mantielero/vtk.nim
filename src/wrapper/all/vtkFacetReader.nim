## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkFacetReader.h
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
##  @class   vtkFacetReader
##  @brief   reads a dataset in Facet format
##
##  vtkFacetReader creates a poly data dataset. It reads ASCII files
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

## !!!Ignored construct:  # vtkFacetReader_h [NewLine] # vtkFacetReader_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSHYBRID_EXPORT vtkFacetReader : public vtkPolyDataAlgorithm { public : static vtkFacetReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFacetReader :: IsTypeOf ( type ) ; } static vtkFacetReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFacetReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFacetReader * NewInstance ( ) const { return vtkFacetReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFacetReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFacetReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify file name of Facet datafile to read
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} static int CanReadFile ( VTK_FILEPATH const char * filename ) ; protected : vtkFacetReader ( ) ; ~ vtkFacetReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * FileName ; private : vtkFacetReader ( const vtkFacetReader & ) = delete ; void operator = ( const vtkFacetReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
