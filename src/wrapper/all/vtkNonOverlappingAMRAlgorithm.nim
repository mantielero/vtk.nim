## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkNonOverlappingAMRAlgorithm.h
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
##  @class   vtkNonOverlappingAMRAlgorithm
##   produce vtkNonOverlappingAMR as output.
##
##
##
##

## !!!Ignored construct:  # vtkNonOverlappingAMRAlgorithm_h [NewLine] # vtkNonOverlappingAMRAlgorithm_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkUniformGridAMRAlgorithm.h [NewLine] class vtkNonOverlappingAMR ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformation"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkNonOverlappingAMRAlgorithm : public vtkUniformGridAMRAlgorithm { public : static vtkNonOverlappingAMRAlgorithm * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUniformGridAMRAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUniformGridAMRAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkNonOverlappingAMRAlgorithm :: IsTypeOf ( type ) ; } static vtkNonOverlappingAMRAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkNonOverlappingAMRAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkNonOverlappingAMRAlgorithm * NewInstance ( ) const { return vtkNonOverlappingAMRAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUniformGridAMRAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNonOverlappingAMRAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNonOverlappingAMRAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output data object for a port on this algorithm
##  vtkNonOverlappingAMR * GetOutput ( ) ; vtkNonOverlappingAMR * GetOutput ( int ) ; /@} protected : vtkNonOverlappingAMRAlgorithm ( ) ; ~ vtkNonOverlappingAMRAlgorithm ( ) override ; /@{ *
##  See algorithm for more info.
##  int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; /@} private : vtkNonOverlappingAMRAlgorithm ( const vtkNonOverlappingAMRAlgorithm & ) = delete ; void operator = ( const vtkNonOverlappingAMRAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
