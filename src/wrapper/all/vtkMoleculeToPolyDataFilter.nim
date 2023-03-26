## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMoleculeToPolyDataFilter.h
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
##  @class   vtkMoleculeToPolyDataFilter
##  @brief   abstract filter class
##
##  vtkMoleculeToPolyDataFilter is an abstract filter class whose
##  subclasses take as input datasets of type vtkMolecule and
##  generate polygonal data on output.
##

## !!!Ignored construct:  # vtkMoleculeToPolyDataFilter_h [NewLine] # vtkMoleculeToPolyDataFilter_h [NewLine] # vtkDomainsChemistryModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkMolecule ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKDOMAINSCHEMISTRY_EXPORT vtkMoleculeToPolyDataFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMoleculeToPolyDataFilter :: IsTypeOf ( type ) ; } static vtkMoleculeToPolyDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMoleculeToPolyDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMoleculeToPolyDataFilter * NewInstance ( ) const { return vtkMoleculeToPolyDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMoleculeToPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMoleculeToPolyDataFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkMolecule * GetInput ( ) ; protected : vtkMoleculeToPolyDataFilter ( ) ; ~ vtkMoleculeToPolyDataFilter ( ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkMoleculeToPolyDataFilter ( const vtkMoleculeToPolyDataFilter & ) = delete ; void operator = ( const vtkMoleculeToPolyDataFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
