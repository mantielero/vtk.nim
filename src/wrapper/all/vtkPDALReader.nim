## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGDALRasterReader.h
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
##  @class   vtkPDALReader
##  @brief   Reads LIDAR data using the PDAL library.
##
##  vtkPDALReader reads LIDAR data using the PDAL library.  See the
##  readers section on www.pdal.io for the supported formats. It produces a
##  vtkPolyData with point data arrays for attributes such as Intensity,
##  Classification, Color, ...
##
##
##  @sa
##  vtkPolyData
##

## !!!Ignored construct:  # vtkPDALReader_h [NewLine] # vtkPDALReader_h [NewLine] # < vtkIOPDALModule . h >  For export macro [NewLine] # < vtkPolyDataAlgorithm . h > [NewLine] namespace pdal { class Stage ; } ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOPDAL_EXPORT vtkPDALReader : public vtkPolyDataAlgorithm { public : vtkPDALReader ( const vtkPDALReader & ) = delete ; void operator = ( const vtkPDALReader & ) = delete ; static vtkPDALReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPDALReader :: IsTypeOf ( type ) ; } static vtkPDALReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPDALReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPDALReader * NewInstance ( ) const { return vtkPDALReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPDALReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPDALReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Name of the file that will be opened
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; protected : vtkPDALReader ( ) ; ~ vtkPDALReader ( ) override ; *
##  Core implementation of the data set reader
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; *
##  Read point record data i.e. position and visualisation data
##  void ReadPointRecordData ( pdal :: Stage & reader , vtkPolyData * pointsPolyData ) ; char * FileName ; } ;
## Error: token expected: ; but got: [identifier]!!!
