## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDSPFilterDefinition.h
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
##  @class   vtkDSPFilterDefinition
##  @brief   used by the Exodus readers
##
##  vtkDSPFilterDefinition is used by vtkExodusReader, vtkExodusIIReader and
##  vtkPExodusReader to do temporal smoothing of data
##  @sa
##  vtkDSPFilterGroup vtkExodusReader vtkExodusIIReader vtkPExodusReader
##

## !!!Ignored construct:  # vtkDSPFilterDefinition_h [NewLine] # vtkDSPFilterDefinition_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkObject.h [NewLine] class vtkDSPFilterDefinitionVectorDoubleSTLCloak ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDSPFilterDefinitionStringSTLCloak"
## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkDSPFilterDefinition : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDSPFilterDefinition :: IsTypeOf ( type ) ; } static vtkDSPFilterDefinition * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDSPFilterDefinition * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDSPFilterDefinition * NewInstance ( ) const { return vtkDSPFilterDefinition :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDSPFilterDefinition :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDSPFilterDefinition :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkDSPFilterDefinition * New ( ) ; protected : vtkDSPFilterDefinition ( ) ; vtkDSPFilterDefinition ( vtkDSPFilterDefinition * other ) ; ~ vtkDSPFilterDefinition ( ) override ; public : void Copy ( vtkDSPFilterDefinition * other ) ; void Clear ( ) ; bool IsThisInputVariableInstanceNeeded ( int a_timestep , int a_outputTimestep ) ; void PushBackNumeratorWeight ( double a_value ) ; void PushBackDenominatorWeight ( double a_value ) ; void PushBackForwardNumeratorWeight ( double a_value ) ; void SetInputVariableName ( const char * a_value ) ; void SetOutputVariableName ( const char * a_value ) ; const char * GetInputVariableName ( ) ; const char * GetOutputVariableName ( ) ; int GetNumNumeratorWeights ( ) ; int GetNumDenominatorWeights ( ) ; int GetNumForwardNumeratorWeights ( ) ; double GetNumeratorWeight ( int a_which ) ; double GetDenominatorWeight ( int a_which ) ; double GetForwardNumeratorWeight ( int a_which ) ; vtkDSPFilterDefinitionVectorDoubleSTLCloak * NumeratorWeights ; vtkDSPFilterDefinitionVectorDoubleSTLCloak * DenominatorWeights ; vtkDSPFilterDefinitionVectorDoubleSTLCloak * ForwardNumeratorWeights ; vtkDSPFilterDefinitionStringSTLCloak * InputVariableName ; vtkDSPFilterDefinitionStringSTLCloak * OutputVariableName ; protected : private : vtkDSPFilterDefinition ( const vtkDSPFilterDefinition & ) = delete ; void operator = ( const vtkDSPFilterDefinition & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
