## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFixedPointVolumeRayCastCompositeHelper.h
##   Language:  C++
##
##   Copyright (c) 1993-2002 Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkFixedPointVolumeRayCastCompositeHelper
##  @brief   A helper that generates composite images for the volume ray cast mapper
##
##  This is one of the helper classes for the vtkFixedPointVolumeRayCastMapper.
##  It will generate composite images using an alpha blending operation.
##  This class should not be used directly, it is a helper class for
##  the mapper and has no user-level API.
##
##  @sa
##  vtkFixedPointVolumeRayCastMapper
##

## !!!Ignored construct:  # vtkFixedPointVolumeRayCastCompositeHelper_h [NewLine] # vtkFixedPointVolumeRayCastCompositeHelper_h [NewLine] # vtkFixedPointVolumeRayCastHelper.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class vtkFixedPointVolumeRayCastMapper ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkVolume"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkFixedPointVolumeRayCastCompositeHelper : public vtkFixedPointVolumeRayCastHelper { public : static vtkFixedPointVolumeRayCastCompositeHelper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkFixedPointVolumeRayCastHelper Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkFixedPointVolumeRayCastHelper :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFixedPointVolumeRayCastCompositeHelper :: IsTypeOf ( type ) ; } static vtkFixedPointVolumeRayCastCompositeHelper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFixedPointVolumeRayCastCompositeHelper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFixedPointVolumeRayCastCompositeHelper * NewInstance ( ) const { return vtkFixedPointVolumeRayCastCompositeHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFixedPointVolumeRayCastHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFixedPointVolumeRayCastCompositeHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFixedPointVolumeRayCastCompositeHelper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void GenerateImage ( int threadID , int threadCount , vtkVolume * vol , vtkFixedPointVolumeRayCastMapper * mapper ) override ; protected : vtkFixedPointVolumeRayCastCompositeHelper ( ) ; ~ vtkFixedPointVolumeRayCastCompositeHelper ( ) override ; private : vtkFixedPointVolumeRayCastCompositeHelper ( const vtkFixedPointVolumeRayCastCompositeHelper & ) = delete ; void operator = ( const vtkFixedPointVolumeRayCastCompositeHelper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
