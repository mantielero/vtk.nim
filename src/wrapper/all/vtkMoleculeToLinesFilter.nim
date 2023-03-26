## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMoleculeToLinesFilter.h
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
##  @class   vtkMoleculeToLinesFilter
##  @brief Convert a molecule into a simple polydata with lines.
##
##  vtkMoleculeToLinesFilter is a filter class that takes vtkMolecule as input and
##  generates polydata on output.
##  Conversion is done following this rules:
##   - 1 atom == 1 point
##   - 1 bond == 1 line (cell of type VTK_LINE)
##   - atom data is copied as point data
##   - bond data is copied as cell data
##

## !!!Ignored construct:  # vtkMoleculeToLinesFilter_h [NewLine] # vtkMoleculeToLinesFilter_h [NewLine] # vtkDomainsChemistryModule.h  For export macro # vtkMoleculeToPolyDataFilter.h [NewLine] class VTKDOMAINSCHEMISTRY_EXPORT vtkMoleculeToLinesFilter : public vtkMoleculeToPolyDataFilter { public : static vtkMoleculeToLinesFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMoleculeToPolyDataFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMoleculeToPolyDataFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMoleculeToLinesFilter :: IsTypeOf ( type ) ; } static vtkMoleculeToLinesFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMoleculeToLinesFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMoleculeToLinesFilter * NewInstance ( ) const { return vtkMoleculeToLinesFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeToPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMoleculeToLinesFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMoleculeToLinesFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkMoleculeToLinesFilter ( ) = default ; ~ vtkMoleculeToLinesFilter ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkMoleculeToLinesFilter ( const vtkMoleculeToLinesFilter & ) = delete ; void operator = ( const vtkMoleculeToLinesFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
