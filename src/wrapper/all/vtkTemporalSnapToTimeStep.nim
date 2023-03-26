## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTemporalSnapToTimeStep.h
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
##  @class   vtkTemporalSnapToTimeStep
##  @brief   modify the time range/steps of temporal data
##
##  vtkTemporalSnapToTimeStep  modify the time range or time steps of
##  the data without changing the data itself. The data is not resampled
##  by this filter, only the information accompanying the data is modified.
##
##  @par Thanks:
##  John Bidiscombe of CSCS - Swiss National Supercomputing Centre
##  for creating and contributing this class.
##  For related material, please refer to :
##  John Biddiscombe, Berk Geveci, Ken Martin, Kenneth Moreland, David Thompson,
##  "Time Dependent Processing in a Parallel Pipeline Architecture",
##  IEEE Visualization 2007.
##

## !!!Ignored construct:  # vtkTemporalSnapToTimeStep_h [NewLine] # vtkTemporalSnapToTimeStep_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] # < vector >  used because I am a bad boy. So there. [NewLine] class VTKFILTERSHYBRID_EXPORT vtkTemporalSnapToTimeStep : public vtkPassInputTypeAlgorithm { public : static vtkTemporalSnapToTimeStep * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTemporalSnapToTimeStep :: IsTypeOf ( type ) ; } static vtkTemporalSnapToTimeStep * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTemporalSnapToTimeStep * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTemporalSnapToTimeStep * NewInstance ( ) const { return vtkTemporalSnapToTimeStep :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTemporalSnapToTimeStep :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTemporalSnapToTimeStep :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; enum { VTK_SNAP_NEAREST = 0 , VTK_SNAP_NEXTBELOW_OR_EQUAL , VTK_SNAP_NEXTABOVE_OR_EQUAL } ; virtual void SetSnapMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SnapMode  to  << _arg ) ; if ( this -> SnapMode != _arg ) { this -> SnapMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetSnapMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SnapMode  of  << this -> SnapMode ) ; return this -> SnapMode ; } ; void SetSnapModeToNearest ( ) { this -> SetSnapMode ( VTK_SNAP_NEAREST ) ; } void SetSnapModeToNextBelowOrEqual ( ) { this -> SetSnapMode ( VTK_SNAP_NEXTBELOW_OR_EQUAL ) ; } void SetSnapModeToNextAboveOrEqual ( ) { this -> SetSnapMode ( VTK_SNAP_NEXTABOVE_OR_EQUAL ) ; } protected : vtkTemporalSnapToTimeStep ( ) ; ~ vtkTemporalSnapToTimeStep ( ) override ; *
##  see vtkAlgorithm for details
##  vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestUpdateExtent ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; std :: vector < double > InputTimeValues ; int HasDiscrete ; int SnapMode ; private : vtkTemporalSnapToTimeStep ( const vtkTemporalSnapToTimeStep & ) = delete ; void operator = ( const vtkTemporalSnapToTimeStep & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
