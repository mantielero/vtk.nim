## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenerateTimeSteps.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##     This software is distributed WITHOUT ANY WARRANTY; without even
##     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##     PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkGenerateTimeSteps
##  @brief   Generate timesteps on any input
##
##  A vtkPassInputTypeAlgorithm that add timesteps during the request information
##  pass and just shallow copy its input to its output. Input timesteps are completely
##  ignored and the first timestep will be requested if any.
##

## !!!Ignored construct:  # vtkGenerateTimeSteps_h [NewLine] # vtkGenerateTimeSteps_h [NewLine] # vtkFiltersHybridModule.h  for export macro # vtkPassInputTypeAlgorithm.h [NewLine] # < vector >  for time steps [NewLine] class VTKFILTERSHYBRID_EXPORT vtkGenerateTimeSteps : public vtkPassInputTypeAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGenerateTimeSteps :: IsTypeOf ( type ) ; } static vtkGenerateTimeSteps * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGenerateTimeSteps * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGenerateTimeSteps * NewInstance ( ) const { return vtkGenerateTimeSteps :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenerateTimeSteps :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenerateTimeSteps :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkGenerateTimeSteps * New ( ) ; *
##  Get the number of time steps that will be extracted
##  int GetNumberOfTimeSteps ( ) const { return static_cast < int > ( this -> TimeStepValues . size ( ) ) ; } *
##  Add a time step value.
##  void AddTimeStepValue ( double timeStepValue ) ; /@{ *
##  Get/Set an array of time step values. For the Get function,
##  timeStepValues should be big enough for GetNumberOfTimeSteps() values.
##  void SetTimeStepValues ( int count , const double * timeStepValues ) ; void GetTimeStepValues ( double * timeStepValues ) const ; /@} *
##  Generate a range of values in [begin, end) with a step size of 'step'
##  void GenerateTimeStepValues ( double begin , double end , double step ) ; /@{ *
##  Clear the time step values
##  void ClearTimeStepValues ( ) { this -> TimeStepValues . clear ( ) ; this -> Modified ( ) ; } /@} protected : vtkGenerateTimeSteps ( ) = default ; ~ vtkGenerateTimeSteps ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; std :: vector < double > TimeStepValues ; private : vtkGenerateTimeSteps ( const vtkGenerateTimeSteps & ) = delete ; void operator = ( const vtkGenerateTimeSteps & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
