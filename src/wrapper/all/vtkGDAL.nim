## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGDAL.h
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
##  @class   vtkGDAL
##  @brief   Shared data for GDAL classes
##
##

## !!!Ignored construct:  # vtkGDAL_h [NewLine] # vtkGDAL_h [NewLine] # vtkObject.h [NewLine] # < vtkIOGDALModule . h >  For export macro [NewLine] class vtkInformationStringKey ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformationIntegerVectorKey"
## !!!Ignored construct:  class VTKIOGDAL_EXPORT vtkGDAL : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGDAL :: IsTypeOf ( type ) ; } static vtkGDAL * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGDAL * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGDAL * NewInstance ( ) const { return vtkGDAL :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGDAL :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGDAL :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  Key used to put GDAL map projection string in the output information
##  by readers. static vtkInformationStringKey * MAP_PROJECTION ( ) ; static vtkInformationIntegerVectorKey * FLIP_AXIS ( ) ; protected : private : vtkGDAL ( ) ;  Static class ~ vtkGDAL ( ) override ; vtkGDAL ( const vtkGDAL & ) = delete ; void operator = ( const vtkGDAL & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
