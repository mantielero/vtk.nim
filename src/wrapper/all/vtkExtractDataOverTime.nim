## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractDataOverTime.h
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
##  @class   vtkExtractDataOverTime
##  @brief   extract point data from a time sequence for
##  a specified point id.
##
##  This filter extracts the point data from a time sequence and specified index
##  and creates an output of the same type as the input but with Points
##  containing "number of time steps" points; the point and PointData
##  corresponding to the PointIndex are extracted at each time step and added to
##  the output.  A PointData array is added called "Time" (or "TimeData" if
##  there is already an array called "Time"), which is the time at each index.
##

## !!!Ignored construct:  # vtkExtractDataOverTime_h [NewLine] # vtkExtractDataOverTime_h [NewLine] # vtkFiltersExtractionModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class VTKFILTERSEXTRACTION_EXPORT vtkExtractDataOverTime : public vtkPointSetAlgorithm { public : static vtkExtractDataOverTime * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractDataOverTime :: IsTypeOf ( type ) ; } static vtkExtractDataOverTime * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractDataOverTime * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractDataOverTime * NewInstance ( ) const { return vtkExtractDataOverTime :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractDataOverTime :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractDataOverTime :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Index of point to extract at each time step
##  virtual void SetPointIndex ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PointIndex  to  << _arg ) ; if ( this -> PointIndex != _arg ) { this -> PointIndex = _arg ; this -> Modified ( ) ; } } ; virtual int GetPointIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointIndex  of  << this -> PointIndex ) ; return this -> PointIndex ; } ; /@} /@{ *
##  Get the number of time steps
##  virtual int GetPointIndexNumberOfTimeSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTimeSteps  of  << this -> NumberOfTimeSteps ) ; return this -> NumberOfTimeSteps ; } ; /@} protected : vtkExtractDataOverTime ( ) ; ~ vtkExtractDataOverTime ( ) override = default ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int AllocateOutputData ( vtkPointSet * input , vtkPointSet * output ) ; int PointIndex ; int CurrentTimeIndex ; int NumberOfTimeSteps ; private : vtkExtractDataOverTime ( const vtkExtractDataOverTime & ) = delete ; void operator = ( const vtkExtractDataOverTime & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
