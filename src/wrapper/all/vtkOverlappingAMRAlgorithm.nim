## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkOverlappingAMRAlgorithm.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkOverlappingAMRAlgorithm
##  @brief   A base class for all algorithms that take as input vtkOverlappingAMR and
##   produce vtkOverlappingAMR.
##

## !!!Ignored construct:  # vtkOverlappingAMRAlgorithm_h [NewLine] # vtkOverlappingAMRAlgorithm_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkUniformGridAMRAlgorithm.h [NewLine] class vtkOverlappingAMR ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformation"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkOverlappingAMRAlgorithm : public vtkUniformGridAMRAlgorithm { public : static vtkOverlappingAMRAlgorithm * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUniformGridAMRAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUniformGridAMRAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOverlappingAMRAlgorithm :: IsTypeOf ( type ) ; } static vtkOverlappingAMRAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOverlappingAMRAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOverlappingAMRAlgorithm * NewInstance ( ) const { return vtkOverlappingAMRAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUniformGridAMRAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOverlappingAMRAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOverlappingAMRAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output data object for a port on this algorithm
##  vtkOverlappingAMR * GetOutput ( ) ; vtkOverlappingAMR * GetOutput ( int ) ; /@} protected : vtkOverlappingAMRAlgorithm ( ) ; ~ vtkOverlappingAMRAlgorithm ( ) override ; /@{ *
##  See algorithm for more info.
##  int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; /@} private : vtkOverlappingAMRAlgorithm ( const vtkOverlappingAMRAlgorithm & ) = delete ; void operator = ( const vtkOverlappingAMRAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
