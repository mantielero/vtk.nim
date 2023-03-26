## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTrivialConsumer.h
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
##  @class   vtkTrivialConsumer
##  @brief   Consumer to consume data off of a pipeline.
##
##  vtkTrivialConsumer caps off a pipeline so that no output data is left
##  hanging around when a pipeline executes when data is set to be released (see
##  vtkDataObject::SetGlobalReleaseDataFlag). This is intended to be used for
##  tools such as Catalyst and not end users.
##

## !!!Ignored construct:  # vtkTrivialConsumer_h [NewLine] # vtkTrivialConsumer_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro [NewLine] class VTKCOMMONEXECUTIONMODEL_EXPORT vtkTrivialConsumer : public vtkAlgorithm { public : static vtkTrivialConsumer * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTrivialConsumer :: IsTypeOf ( type ) ; } static vtkTrivialConsumer * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTrivialConsumer * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTrivialConsumer * NewInstance ( ) const { return vtkTrivialConsumer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTrivialConsumer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTrivialConsumer :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkTrivialConsumer ( ) ; ~ vtkTrivialConsumer ( ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; private : vtkTrivialConsumer ( const vtkTrivialConsumer & ) = delete ; void operator = ( const vtkTrivialConsumer & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
