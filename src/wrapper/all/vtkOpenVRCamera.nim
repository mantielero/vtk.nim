## =========================================================================
##
##   Program:   Visualization Toolkit
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
##  @class   vtkOpenVRCamera
##  @brief   OpenVR camera
##
##  vtkOpenVRCamera is a concrete implementation of the abstract class
##  vtkCamera.  vtkOpenVRCamera interfaces to the OpenVR rendering library.
##

## !!!Ignored construct:  # vtkOpenVRCamera_h [NewLine] # vtkOpenVRCamera_h [NewLine] # vtkNew.h  ivars # vtkRenderingOpenVRModule.h  For export macro # vtkVRHMDCamera.h [NewLine] class vtkRenderer ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMatrix4x4"
## !!!Ignored construct:  class VTKRENDERINGOPENVR_EXPORT vtkOpenVRCamera : public vtkVRHMDCamera { public : static vtkOpenVRCamera * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkVRHMDCamera Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkVRHMDCamera :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpenVRCamera :: IsTypeOf ( type ) ; } static vtkOpenVRCamera * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpenVRCamera * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpenVRCamera * NewInstance ( ) const { return vtkOpenVRCamera :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVRHMDCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenVRCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenVRCamera :: New ( ) ; } public : ; *
##  Implement base class method.
##  void Render ( vtkRenderer * ren ) override ; protected : vtkOpenVRCamera ( ) ; ~ vtkOpenVRCamera ( ) override ;  gets the pose and projections for the left and right eyes from
##  the openvr library void UpdateHMDToEyeMatrices ( vtkRenderer * ) ; void UpdateWorldToEyeMatrices ( vtkRenderer * ) override ; void UpdateEyeToProjectionMatrices ( vtkRenderer * ) override ;  all the matrices below are stored in VTK convention
##  as A = Mx where x is a column vector.  we get these from OpenVR vtkNew < vtkMatrix4x4 > HMDToLeftEyeMatrix ; vtkNew < vtkMatrix4x4 > HMDToRightEyeMatrix ;  used as part of the calculation vtkNew < vtkMatrix4x4 > PhysicalToHMDMatrix ; private : vtkOpenVRCamera ( const vtkOpenVRCamera & ) = delete ; void operator = ( const vtkOpenVRCamera & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
