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
##  @class   vtkLASRasterReader
##  @brief   Reads LIDAR data saved using the LAS file format.
##
##  vtkLASReader is a source object that reads LIDAR data saved using
##  the LAS file format. This reader uses the libLAS library.
##  It produces a vtkPolyData with point data arrays:
##  "intensity": vtkUnsignedShortArray
##  "classification": vtkUnsignedCharArray (optional)
##  "color": vtkUnsignedShortArray (optional)
##
##
##  @sa
##  vtkPolyData
##

## !!!Ignored construct:  # vtkLASReader_h [NewLine] # vtkLASReader_h [NewLine] # < vtkIOLASModule . h >  For export macro [NewLine] # < vtkPolyDataAlgorithm . h > [NewLine] namespace liblas { class Header ; class Reader ; } ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOLAS_EXPORT vtkLASReader : public vtkPolyDataAlgorithm { public : vtkLASReader ( const vtkLASReader & ) = delete ; void operator = ( const vtkLASReader & ) = delete ; static vtkLASReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLASReader :: IsTypeOf ( type ) ; } static vtkLASReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLASReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLASReader * NewInstance ( ) const { return vtkLASReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLASReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLASReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Accessor for name of the file that will be opened
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; protected : vtkLASReader ( ) ; ~ vtkLASReader ( ) override ; *
##  Core implementation of the data set reader
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; *
##  Read point record data i.e. position and visualisation data
##  void ReadPointRecordData ( liblas :: Reader & reader , vtkPolyData * pointsPolyData ) ; char * FileName ; } ;
## Error: token expected: ; but got: [identifier]!!!
