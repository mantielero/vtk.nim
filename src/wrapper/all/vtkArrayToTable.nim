## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayToTable.h
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
##  @class   vtkArrayToTable
##  @brief   Converts one- and two-dimensional vtkArrayData
##  objects to vtkTable
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

## !!!Ignored construct:  # vtkArrayToTable_h [NewLine] # vtkArrayToTable_h [NewLine] # vtkInfovisCoreModule.h  For export macro # vtkTableAlgorithm.h [NewLine] class VTKINFOVISCORE_EXPORT vtkArrayToTable : public vtkTableAlgorithm { public : static vtkArrayToTable * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkArrayToTable :: IsTypeOf ( type ) ; } static vtkArrayToTable * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkArrayToTable * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkArrayToTable * NewInstance ( ) const { return vtkArrayToTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayToTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayToTable :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkArrayToTable ( ) ; ~ vtkArrayToTable ( ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkArrayToTable ( const vtkArrayToTable & ) = delete ; void operator = ( const vtkArrayToTable & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
