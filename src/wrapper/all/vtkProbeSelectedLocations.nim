## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProbeSelectedLocations.h
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
##  @class   vtkProbeSelectedLocations
##  @brief   similar to vtkExtractSelectedLocations
##  except that it interpolates the point attributes at the probe locations.
##
##  vtkProbeSelectedLocations is similar to vtkExtractSelectedLocations except
##  that it interpolates the point attributes at the probe location. This is
##  equivalent to the vtkProbeFilter except that the probe locations are provided
##  by a vtkSelection. The FieldType of the input vtkSelection is immaterial and
##  is ignored. The ContentType of the input vtkSelection must be
##  vtkSelection::LOCATIONS.
##

## !!!Ignored construct:  # vtkProbeSelectedLocations_h [NewLine] # vtkProbeSelectedLocations_h [NewLine] # vtkExtractSelectionBase.h [NewLine] # vtkFiltersExtractionModule.h  For export macro [NewLine] class VTKFILTERSEXTRACTION_EXPORT vtkProbeSelectedLocations : public vtkExtractSelectionBase { public : static vtkProbeSelectedLocations * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExtractSelectionBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExtractSelectionBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProbeSelectedLocations :: IsTypeOf ( type ) ; } static vtkProbeSelectedLocations * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProbeSelectedLocations * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProbeSelectedLocations * NewInstance ( ) const { return vtkProbeSelectedLocations :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractSelectionBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProbeSelectedLocations :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProbeSelectedLocations :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkProbeSelectedLocations ( ) ; ~ vtkProbeSelectedLocations ( ) override ; *
##  Sets up empty output dataset
##  int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkProbeSelectedLocations ( const vtkProbeSelectedLocations & ) = delete ; void operator = ( const vtkProbeSelectedLocations & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
