## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpaquePass.h
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
##  @class   vtkOpaquePass
##  @brief   Render the opaque geometry with property key
##  filtering.
##
##  vtkOpaquePass renders the opaque geometry of all the props that have the
##  keys contained in vtkRenderState.
##
##  This pass expects an initialized depth buffer and color buffer.
##  Initialized buffers means they have been cleared with farest z-value and
##  background color/gradient/transparent color.
##
##  @sa
##  vtkRenderPass vtkDefaultPass
##

## !!!Ignored construct:  # vtkOpaquePass_h [NewLine] # vtkOpaquePass_h [NewLine] # vtkDefaultPass.h [NewLine] # vtkRenderingOpenGL2Module.h  For export macro [NewLine] class VTKRENDERINGOPENGL2_EXPORT vtkOpaquePass : public vtkDefaultPass { public : static vtkOpaquePass * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDefaultPass Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDefaultPass :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpaquePass :: IsTypeOf ( type ) ; } static vtkOpaquePass * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpaquePass * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpaquePass * NewInstance ( ) const { return vtkOpaquePass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDefaultPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpaquePass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpaquePass :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Perform rendering according to a render state \p s.
##  \pre s_exists: s!=0
##  void Render ( const vtkRenderState * s ) override ; protected : *
##  Default constructor.
##  vtkOpaquePass ( ) ; *
##  Destructor.
##  ~ vtkOpaquePass ( ) override ; private : vtkOpaquePass ( const vtkOpaquePass & ) = delete ; void operator = ( const vtkOpaquePass & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
