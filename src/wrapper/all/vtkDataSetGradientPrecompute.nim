## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetGradientPrecompute.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   =========================================================================
## *
##  @class   vtkDataSetGradientPrecompute
##
##
##  Computes a geometry based vector field that the DataSetGradient filter uses to accelerate
##  gradient computation. This vector field is added to FieldData since it has a different
##  value for each vertex of each cell (a vertex shared by two cell has two different values).
##
##  @par Thanks:
##  This file is part of the generalized Youngs material interface reconstruction algorithm
##  contributed by CEA/DIF - Commissariat a l'Energie Atomique, Centre DAM Ile-De-France <br> BP12,
##  F-91297 Arpajon, France. <br> Implementation by Thierry Carrard (CEA)
##

## !!!Ignored construct:  # vtkDataSetGradientPrecompute_h [NewLine] # vtkDataSetGradientPrecompute_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersGeneralModule.h  For export macro [NewLine] class VTKFILTERSGENERAL_EXPORT vtkDataSetGradientPrecompute : public vtkDataSetAlgorithm { public : static vtkDataSetGradientPrecompute * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataSetGradientPrecompute :: IsTypeOf ( type ) ; } static vtkDataSetGradientPrecompute * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataSetGradientPrecompute * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataSetGradientPrecompute * NewInstance ( ) const { return vtkDataSetGradientPrecompute :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetGradientPrecompute :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetGradientPrecompute :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static int GradientPrecompute ( vtkDataSet * ds ) ; protected : vtkDataSetGradientPrecompute ( ) ; ~ vtkDataSetGradientPrecompute ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkDataSetGradientPrecompute ( const vtkDataSetGradientPrecompute & ) = delete ; void operator = ( const vtkDataSetGradientPrecompute & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
