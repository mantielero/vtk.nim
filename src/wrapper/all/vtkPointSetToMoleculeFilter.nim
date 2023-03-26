## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointSetToMoleculeFilter.h
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
##
##  @class vtkPointSetToMoleculeFilter
##  @brief Converts a pointset into a molecule.
##
##  vtkPointSetToMoleculeFilter is a filter that takes a vtkPointSet as input
##  and generates a vtkMolecule.
##  Each point of the given vtkPointSet will become an atom of the vtkMolecule.
##  The vtkPointSet should provide a point data array (default is scalar one)
##  to specify the atomic number of each atom.
##

## !!!Ignored construct:  # vtkPointSetToMoleculeFilter_h [NewLine] # vtkPointSetToMoleculeFilter_h [NewLine] # vtkDomainsChemistryModule.h  For export macro # vtkMoleculeAlgorithm.h [NewLine] class VTKDOMAINSCHEMISTRY_EXPORT vtkPointSetToMoleculeFilter : public vtkMoleculeAlgorithm { public : static vtkPointSetToMoleculeFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMoleculeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMoleculeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointSetToMoleculeFilter :: IsTypeOf ( type ) ; } static vtkPointSetToMoleculeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointSetToMoleculeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointSetToMoleculeFilter * NewInstance ( ) const { return vtkPointSetToMoleculeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointSetToMoleculeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointSetToMoleculeFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set if the filter should look for lines in input cells and convert them
##  into bonds.
##  default is ON.
##  virtual bool GetConvertLinesIntoBonds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertLinesIntoBonds  of  << this -> ConvertLinesIntoBonds ) ; return this -> ConvertLinesIntoBonds ; } ; virtual void SetConvertLinesIntoBonds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConvertLinesIntoBonds  to  << _arg ) ; if ( this -> ConvertLinesIntoBonds != _arg ) { this -> ConvertLinesIntoBonds = _arg ; this -> Modified ( ) ; } } ; virtual void ConvertLinesIntoBondsOn ( ) { this -> SetConvertLinesIntoBonds ( static_cast < bool > ( 1 ) ) ; } virtual void ConvertLinesIntoBondsOff ( ) { this -> SetConvertLinesIntoBonds ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkPointSetToMoleculeFilter ( ) ; ~ vtkPointSetToMoleculeFilter ( ) override = default ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; bool ConvertLinesIntoBonds ; private : vtkPointSetToMoleculeFilter ( const vtkPointSetToMoleculeFilter & ) = delete ; void operator = ( const vtkPointSetToMoleculeFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
