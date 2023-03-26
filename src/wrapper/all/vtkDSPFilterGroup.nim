## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDSPFilterGroup.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkDSPFilterGroup
##  @brief   used by the Exodus readers
##
##  vtkDSPFilterGroup is used by vtkExodusReader, vtkExodusIIReader and
##  vtkPExodusReader to do temporal smoothing of data
##  @sa
##  vtkDSPFilterDefinition vtkExodusReader vtkExodusIIReader vtkPExodusReader
##

## !!!Ignored construct:  # vtkDSPFilterGroup_h [NewLine] # vtkDSPFilterGroup_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkObject.h [NewLine] class vtkDSPFilterGroupVectorIntSTLCloak ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDSPFilterGroupVectorVectorIntSTLCloak"
discard "forward decl of vtkDSPFilterGroupVectorArraySTLCloak"
discard "forward decl of vtkDSPFilterGroupVectorVectorArraySTLCloak"
discard "forward decl of vtkDSPFilterGroupVectorStringSTLCloak"
discard "forward decl of vtkDSPFilterGroupVectorDefinitionSTLCloak"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkDSPFilterDefinition"
## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkDSPFilterGroup : public vtkObject { public : static vtkDSPFilterGroup * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDSPFilterGroup :: IsTypeOf ( type ) ; } static vtkDSPFilterGroup * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDSPFilterGroup * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDSPFilterGroup * NewInstance ( ) const { return vtkDSPFilterGroup :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDSPFilterGroup :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDSPFilterGroup :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void AddFilter ( vtkDSPFilterDefinition * filter ) ; void RemoveFilter ( const char * a_outputVariableName ) ; bool IsThisInputVariableInstanceNeeded ( const char * a_name , int a_timestep , int a_outputTimestep ) ; bool IsThisInputVariableInstanceCached ( const char * a_name , int a_timestep ) ; void AddInputVariableInstance ( const char * a_name , int a_timestep , vtkFloatArray * a_data ) ; vtkFloatArray * GetOutput ( int a_whichFilter , int a_whichTimestep , int & a_instancesCalculated ) ; vtkFloatArray * GetCachedInput ( int a_whichFilter , int a_whichTimestep ) ; vtkFloatArray * GetCachedOutput ( int a_whichFilter , int a_whichTimestep ) ; const char * GetInputVariableName ( int a_whichFilter ) ; int GetNumFilters ( ) ; void Copy ( vtkDSPFilterGroup * other ) ; vtkDSPFilterDefinition * GetFilter ( int a_whichFilter ) ; vtkDSPFilterGroupVectorDefinitionSTLCloak * std::vector<vtkDSPFilterDefinition *> FilterDefinitions ; protected : vtkDSPFilterGroup ( ) ; ~ vtkDSPFilterGroup ( ) override ; vtkDSPFilterGroupVectorArraySTLCloak * std::vector<vtkFloatArray *> CachedInputs ; vtkDSPFilterGroupVectorStringSTLCloak * std::vector<std::string> CachedInputNames ; vtkDSPFilterGroupVectorIntSTLCloak * std::vector<int> CachedInputTimesteps ; vtkDSPFilterGroupVectorVectorArraySTLCloak * std::vector< std::vector<vtkFloatArray *> > CachedOutputs ; vtkDSPFilterGroupVectorVectorIntSTLCloak * std::vector< std::vector<int> > CachedOutputTimesteps ; private : vtkDSPFilterGroup ( const vtkDSPFilterGroup & ) = delete ; void operator = ( const vtkDSPFilterGroup & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
