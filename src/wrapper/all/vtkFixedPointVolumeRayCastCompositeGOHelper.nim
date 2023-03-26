## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFixedPointVolumeRayCastCompositeGOHelper.h
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
##  @class   vtkFixedPointVolumeRayCastCompositeGOHelper
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

## !!!Ignored construct:  # vtkFixedPointVolumeRayCastCompositeGOHelper_h [NewLine] # vtkFixedPointVolumeRayCastCompositeGOHelper_h [NewLine] # vtkFixedPointVolumeRayCastHelper.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class vtkFixedPointVolumeRayCastMapper ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkVolume"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkFixedPointVolumeRayCastCompositeGOHelper : public vtkFixedPointVolumeRayCastHelper { public : static vtkFixedPointVolumeRayCastCompositeGOHelper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkFixedPointVolumeRayCastHelper Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkFixedPointVolumeRayCastHelper :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFixedPointVolumeRayCastCompositeGOHelper :: IsTypeOf ( type ) ; } static vtkFixedPointVolumeRayCastCompositeGOHelper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFixedPointVolumeRayCastCompositeGOHelper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFixedPointVolumeRayCastCompositeGOHelper * NewInstance ( ) const { return vtkFixedPointVolumeRayCastCompositeGOHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFixedPointVolumeRayCastHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFixedPointVolumeRayCastCompositeGOHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFixedPointVolumeRayCastCompositeGOHelper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void GenerateImage ( int threadID , int threadCount , vtkVolume * vol , vtkFixedPointVolumeRayCastMapper * mapper ) override ; protected : vtkFixedPointVolumeRayCastCompositeGOHelper ( ) ; ~ vtkFixedPointVolumeRayCastCompositeGOHelper ( ) override ; private : vtkFixedPointVolumeRayCastCompositeGOHelper ( const vtkFixedPointVolumeRayCastCompositeGOHelper & ) = delete ; void operator = ( const vtkFixedPointVolumeRayCastCompositeGOHelper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
