## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetReader.h
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
##  @class   vtkDataSetReader
##  @brief   class to read any type of vtk dataset
##
##  vtkDataSetReader is a class that provides instance variables and methods
##  to read any type of dataset in Visualization Toolkit (vtk) format.  The
##  output type of this class will vary depending upon the type of data
##  file. Convenience methods are provided to keep the data as a particular
##  type. (See text for format description details).
##  The superclass of this class, vtkDataReader, provides many methods for
##  controlling the reading of the data file, see vtkDataReader for more
##  information.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  @sa
##  vtkDataReader vtkPolyDataReader vtkRectilinearGridReader
##  vtkStructuredPointsReader vtkStructuredGridReader vtkUnstructuredGridReader
##

## !!!Ignored construct:  # vtkDataSetReader_h [NewLine] # vtkDataSetReader_h [NewLine] # vtkDataReader.h [NewLine] # vtkIOLegacyModule.h  For export macro [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkStructuredPoints"
discard "forward decl of vtkUnstructuredGrid"
## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkDataSetReader : public vtkDataReader { public : static vtkDataSetReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataSetReader :: IsTypeOf ( type ) ; } static vtkDataSetReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataSetReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataSetReader * NewInstance ( ) const { return vtkDataSetReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output of this filter
##  vtkDataSet * GetOutput ( ) ; vtkDataSet * GetOutput ( int idx ) ; /@} /@{ *
##  Get the output as various concrete types. This method is typically used
##  when you know exactly what type of data is being read.  Otherwise, use
##  the general GetOutput() method. If the wrong type is used nullptr is
##  returned.  (You must also set the filename of the object prior to
##  getting the output.)
##  vtkPolyData * GetPolyDataOutput ( ) ; vtkStructuredPoints * GetStructuredPointsOutput ( ) ; vtkStructuredGrid * GetStructuredGridOutput ( ) ; vtkUnstructuredGrid * GetUnstructuredGridOutput ( ) ; vtkRectilinearGrid * GetRectilinearGridOutput ( ) ; /@} *
##  This method can be used to find out the type of output expected without
##  needing to read the whole file.
##  virtual int ReadOutputType ( ) ; *
##  Read metadata from file.
##  int ReadMetaDataSimple ( VTK_FILEPATH const std :: string & fname , vtkInformation * metadata ) override ; *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ; protected : vtkDataSetReader ( ) ; ~ vtkDataSetReader ( ) override ; vtkDataObject * CreateOutput ( vtkDataObject * currentOutput ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; private : vtkDataSetReader ( const vtkDataSetReader & ) = delete ; void operator = ( const vtkDataSetReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
