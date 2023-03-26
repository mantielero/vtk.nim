## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTranslucentPass.h
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
##  @class   vtkTranslucentPass
##  @brief   Render the translucent polygonal geometry
##  with property key filtering.
##
##  vtkTranslucentPass renders the translucent polygonal geometry of all the
##  props that have the keys contained in vtkRenderState.
##
##  This pass expects an initialized depth buffer and color buffer.
##  Initialized buffers means they have been cleared with farest z-value and
##  background color/gradient/transparent color.
##
##  @sa
##  vtkRenderPass vtkDefaultPass
##

## !!!Ignored construct:  # vtkTranslucentPass_h [NewLine] # vtkTranslucentPass_h [NewLine] # vtkDefaultPass.h [NewLine] # vtkRenderingOpenGL2Module.h  For export macro [NewLine] class VTKRENDERINGOPENGL2_EXPORT vtkTranslucentPass : public vtkDefaultPass { public : static vtkTranslucentPass * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDefaultPass Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDefaultPass :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTranslucentPass :: IsTypeOf ( type ) ; } static vtkTranslucentPass * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTranslucentPass * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTranslucentPass * NewInstance ( ) const { return vtkTranslucentPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDefaultPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTranslucentPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTranslucentPass :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Perform rendering according to a render state \p s.
##  \pre s_exists: s!=0
##  void Render ( const vtkRenderState * s ) override ; protected : *
##  Default constructor.
##  vtkTranslucentPass ( ) ; *
##  Destructor.
##  ~ vtkTranslucentPass ( ) override ; private : vtkTranslucentPass ( const vtkTranslucentPass & ) = delete ; void operator = ( const vtkTranslucentPass & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
