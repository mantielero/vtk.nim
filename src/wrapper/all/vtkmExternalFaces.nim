## =============================================================================
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2012 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
## =============================================================================
## *
##  @class   vtkmExternalFaces
##  @brief   generate External Faces of a DataSet
##
##  vtkmExternalFaces is a filter that extracts all external faces from a
##  data set. An external face is defined is defined as a face/side of a cell
##  that belongs only to one cell in the entire mesh.
##  @warning
##  This filter is currently only supports propagation of point properties
##
##

## !!!Ignored construct:  # vtkmExternalFaces_h [NewLine] # vtkmExternalFaces_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h required for correct implementation # vtkAlgorithm.h [NewLine] class vtkUnstructuredGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmExternalFaces : public vtkAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmExternalFaces :: IsTypeOf ( type ) ; } static vtkmExternalFaces * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmExternalFaces * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmExternalFaces * NewInstance ( ) const { return vtkmExternalFaces :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmExternalFaces :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmExternalFaces :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmExternalFaces * New ( ) ; *
##  Set the input DataSet
##  void SetInputData ( vtkUnstructuredGrid * ds ) ; *
##  Get the resulr DataSet
##  vtkUnstructuredGrid * GetOutput ( ) ; /@{ *
##  Get/Set if the points from the input that are unused in the output should
##  be removed. This will take extra time but the result dataset may use
##  less memory. Off by default.
##  virtual void SetCompactPoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CompactPoints  to  << _arg ) ; if ( this -> CompactPoints != _arg ) { this -> CompactPoints = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCompactPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CompactPoints  of  << this -> CompactPoints ) ; return this -> CompactPoints ; } ; virtual void CompactPointsOn ( ) { this -> SetCompactPoints ( static_cast < bool > ( 1 ) ) ; } virtual void CompactPointsOff ( ) { this -> SetCompactPoints ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkmExternalFaces ( ) ; ~ vtkmExternalFaces ( ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; virtual int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; bool CompactPoints ; private : vtkmExternalFaces ( const vtkmExternalFaces & ) = delete ; void operator = ( const vtkmExternalFaces & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
