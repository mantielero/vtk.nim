## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridVolumeRayCastFunction.h
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
##  @class   vtkUnstructuredGridVolumeRayCastFunction
##  @brief   a superclass for ray casting functions
##
##
##  vtkUnstructuredGridVolumeRayCastFunction is a superclass for ray casting functions that
##  can be used within a vtkUnstructuredGridVolumeRayCastMapper.
##
##  @sa
##  vtkUnstructuredGridVolumeRayCastMapper vtkUnstructuredGridVolumeRayIntegrator
##

## !!!Ignored construct:  # vtkUnstructuredGridVolumeRayCastFunction_h [NewLine] # vtkUnstructuredGridVolumeRayCastFunction_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class vtkRenderer ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkVolume"
discard "forward decl of vtkUnstructuredGridVolumeRayCastIterator"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkUnstructuredGridVolumeRayCastFunction : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridVolumeRayCastFunction :: IsTypeOf ( type ) ; } static vtkUnstructuredGridVolumeRayCastFunction * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridVolumeRayCastFunction * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridVolumeRayCastFunction * NewInstance ( ) const { return vtkUnstructuredGridVolumeRayCastFunction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridVolumeRayCastFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridVolumeRayCastFunction :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; virtual void Initialize ( vtkRenderer * ren , vtkVolume * vol ) = 0 ; virtual void Finalize ( ) = 0 ; *
##  Returns a new object that will iterate over all the intersections of a
##  ray with the cells of the input.  The calling code is responsible for
##  deleting the returned object.
##  VTK_NEWINSTANCE virtual vtkUnstructuredGridVolumeRayCastIterator * NewIterator ( ) = 0 ; protected : vtkUnstructuredGridVolumeRayCastFunction ( ) = default ; ~ vtkUnstructuredGridVolumeRayCastFunction ( ) override = default ; private : vtkUnstructuredGridVolumeRayCastFunction ( const vtkUnstructuredGridVolumeRayCastFunction & ) = delete ; void operator = ( const vtkUnstructuredGridVolumeRayCastFunction & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
