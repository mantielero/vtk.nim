## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSimpleBondPerceiver.h
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
##  @class   vtkSimpleBondPerceiver
##  @brief   Create a simple guess of a molecule's
##  topology
##
##
##
##  vtkSimpleBondPerceiver performs a simple check of all interatomic distances
##  and adds a single bond between atoms that are reasonably close. If the
##  interatomic distance is less than the sum of the two atom's covalent radii
##  plus a tolerance, a single bond is added.
##
##
##  @warning
##  This algorithm does not consider valences, hybridization, aromaticity, or
##  anything other than atomic separations. It will not produce anything other
##  than single bonds.
##

## !!!Ignored construct:  # vtkSimpleBondPerceiver_h [NewLine] # vtkSimpleBondPerceiver_h [NewLine] # vtkDomainsChemistryModule.h  For export macro # vtkMoleculeAlgorithm.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMolecule"
discard "forward decl of vtkPeriodicTable"
## !!!Ignored construct:  class VTKDOMAINSCHEMISTRY_EXPORT vtkSimpleBondPerceiver : public vtkMoleculeAlgorithm { public : static vtkSimpleBondPerceiver * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMoleculeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMoleculeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSimpleBondPerceiver :: IsTypeOf ( type ) ; } static vtkSimpleBondPerceiver * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSimpleBondPerceiver * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSimpleBondPerceiver * NewInstance ( ) const { return vtkSimpleBondPerceiver :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSimpleBondPerceiver :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSimpleBondPerceiver :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the tolerance used in the comparisons. (Default: 0.45)
##  virtual void SetTolerance ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; virtual float GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  Set/Get if the tolerance is absolute (i.e. added to radius)
##  or not (i.e. multiplied with radius). Default is true.
##  virtual bool GetToleranceIsToleranceAbsolute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IsToleranceAbsolute  of  << this -> IsToleranceAbsolute ) ; return this -> IsToleranceAbsolute ; } ; virtual void SetToleranceIsToleranceAbsolute ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IsToleranceAbsolute  to  << _arg ) ; if ( this -> IsToleranceAbsolute != _arg ) { this -> IsToleranceAbsolute = _arg ; this -> Modified ( ) ; } } ; /@} protected : vtkSimpleBondPerceiver ( ) ; ~ vtkSimpleBondPerceiver ( ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; *
##  Compute the bonds of input molecule.
##  virtual void ComputeBonds ( vtkMolecule * molecule ) ; *
##  Get the covalent radius corresponding to atomic number, modulated by Tolerance.
##  Tolerance is multiplied if IsToleranceAbsolute is false.
##  Half Tolerance is added if IsToleranceAbsolute is true (for backward compatibility)
##  double GetCovalentRadiusWithTolerance ( vtkPeriodicTable * table , vtkIdType atomicNumber ) ; float Tolerance ; bool IsToleranceAbsolute ; private : vtkSimpleBondPerceiver ( const vtkSimpleBondPerceiver & ) = delete ; void operator = ( const vtkSimpleBondPerceiver & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
