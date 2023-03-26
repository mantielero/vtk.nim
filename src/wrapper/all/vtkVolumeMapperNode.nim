## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumeMapperNode.h
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
##  @class   vtkVolumeMapperNode
##  @brief   vtkViewNode specialized for vtkVolumeMappers
##
##  State storage and graph traversal for vtkVolumeMapper/PolyDataMapper and Property
##  Made a choice to merge PolyDataMapper, PolyDataMapper and property together. If there
##  is a compelling reason to separate them we can.
##

## !!!Ignored construct:  # vtkVolumeMapperNode_h [NewLine] # vtkVolumeMapperNode_h [NewLine] # vtkMapperNode.h [NewLine] # vtkRenderingSceneGraphModule.h  For export macro [NewLine] # < vector > for results [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkVolumeMapper"
discard "forward decl of vtkPolyData"
## !!!Ignored construct:  class VTKRENDERINGSCENEGRAPH_EXPORT vtkVolumeMapperNode : public vtkMapperNode { public : static vtkVolumeMapperNode * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMapperNode Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMapperNode :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVolumeMapperNode :: IsTypeOf ( type ) ; } static vtkVolumeMapperNode * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVolumeMapperNode * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVolumeMapperNode * NewInstance ( ) const { return vtkVolumeMapperNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeMapperNode :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkVolumeMapperNode ( ) ; ~ vtkVolumeMapperNode ( ) override ; private : vtkVolumeMapperNode ( const vtkVolumeMapperNode & ) = delete ; void operator = ( const vtkVolumeMapperNode & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
