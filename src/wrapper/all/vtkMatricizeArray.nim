## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMatricizeArray.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkMatricizeArray
##  @brief   Convert an array of arbitrary dimensions to a
##  matrix.
##
##
##  Given a sparse input array of arbitrary dimension, creates a sparse output
##  matrix (vtkSparseArray<double>) where each column is a slice along an
##  arbitrary dimension from the source.
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

## !!!Ignored construct:  # vtkMatricizeArray_h [NewLine] # vtkMatricizeArray_h [NewLine] # vtkArrayDataAlgorithm.h [NewLine] # vtkFiltersGeneralModule.h  For export macro [NewLine] class VTKFILTERSGENERAL_EXPORT vtkMatricizeArray : public vtkArrayDataAlgorithm { public : static vtkMatricizeArray * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkArrayDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkArrayDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMatricizeArray :: IsTypeOf ( type ) ; } static vtkMatricizeArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMatricizeArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMatricizeArray * NewInstance ( ) const { return vtkMatricizeArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMatricizeArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMatricizeArray :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Returns the 0-numbered dimension that will be mapped to columns in the output
##  virtual vtkIdType GetSliceDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SliceDimension  of  << this -> SliceDimension ) ; return this -> SliceDimension ; } ; /@} /@{ *
##  Sets the 0-numbered dimension that will be mapped to columns in the output
##  virtual void SetSliceDimension ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SliceDimension  to  << _arg ) ; if ( this -> SliceDimension != _arg ) { this -> SliceDimension = _arg ; this -> Modified ( ) ; } } ; /@} protected : vtkMatricizeArray ( ) ; ~ vtkMatricizeArray ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkMatricizeArray ( const vtkMatricizeArray & ) = delete ; void operator = ( const vtkMatricizeArray & ) = delete ; class Generator ; vtkIdType SliceDimension ; } ;
## Error: token expected: ; but got: [identifier]!!!
