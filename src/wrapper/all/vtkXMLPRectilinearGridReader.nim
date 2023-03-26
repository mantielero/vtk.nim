## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPRectilinearGridReader.h
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
##  @class   vtkXMLPRectilinearGridReader
##  @brief   Read PVTK XML RectilinearGrid files.
##
##  vtkXMLPRectilinearGridReader reads the PVTK XML RectilinearGrid
##  file format.  This reads the parallel format's summary file and
##  then uses vtkXMLRectilinearGridReader to read data from the
##  individual RectilinearGrid piece files.  Streaming is supported.
##  The standard extension for this reader's file format is "pvtr".
##
##  @sa
##  vtkXMLRectilinearGridReader
##

## !!!Ignored construct:  # vtkXMLPRectilinearGridReader_h [NewLine] # vtkXMLPRectilinearGridReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLPStructuredDataReader.h [NewLine] class vtkRectilinearGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLPRectilinearGridReader : public vtkXMLPStructuredDataReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLPStructuredDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLPStructuredDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPRectilinearGridReader :: IsTypeOf ( type ) ; } static vtkXMLPRectilinearGridReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPRectilinearGridReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPRectilinearGridReader * NewInstance ( ) const { return vtkXMLPRectilinearGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPStructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPRectilinearGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPRectilinearGridReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkXMLPRectilinearGridReader * New ( ) ; /@{ *
##  Get the reader's output.
##  vtkRectilinearGrid * GetOutput ( ) ; vtkRectilinearGrid * GetOutput ( int idx ) ; /@} protected : vtkXMLPRectilinearGridReader ( ) ; ~ vtkXMLPRectilinearGridReader ( ) override ; vtkRectilinearGrid * GetPieceInput ( int index ) ; void SetupEmptyOutput ( ) override ; const char * GetDataSetName ( ) override ; void SetOutputExtent ( int * extent ) override ; void GetPieceInputExtent ( int index , int * extent ) override ; int ReadPrimaryElement ( vtkXMLDataElement * ePrimary ) override ; void SetupOutputData ( ) override ; int ReadPieceData ( ) override ; vtkXMLDataReader * CreatePieceReader ( ) override ; void CopySubCoordinates ( int * inBounds , int * outBounds , int * subBounds , vtkDataArray * inArray , vtkDataArray * outArray ) ; int FillOutputPortInformation ( int , vtkInformation * ) override ;  The PCoordinates element with coordinate information. vtkXMLDataElement * PCoordinatesElement ; private : vtkXMLPRectilinearGridReader ( const vtkXMLPRectilinearGridReader & ) = delete ; void operator = ( const vtkXMLPRectilinearGridReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
