## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeRenderManager.h
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
##  @class   vtkCompositeRenderManager
##  @brief   An object to control sort-last parallel rendering.
##
##
##  vtkCompositeRenderManager is a subclass of vtkParallelRenderManager that
##  uses compositing to do parallel rendering.  This class has
##  replaced vtkCompositeManager.
##
##

## !!!Ignored construct:  # vtkCompositeRenderManager_h [NewLine] # vtkCompositeRenderManager_h [NewLine] # vtkParallelRenderManager.h [NewLine] # vtkRenderingParallelModule.h  For export macro [NewLine] class vtkCompositer ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFloatArray"
## !!!Ignored construct:  class VTKRENDERINGPARALLEL_EXPORT vtkCompositeRenderManager : public vtkParallelRenderManager { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkParallelRenderManager Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkParallelRenderManager :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCompositeRenderManager :: IsTypeOf ( type ) ; } static vtkCompositeRenderManager * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCompositeRenderManager * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCompositeRenderManager * NewInstance ( ) const { return vtkCompositeRenderManager :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParallelRenderManager :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeRenderManager :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeRenderManager :: New ( ) ; } public : ; static vtkCompositeRenderManager * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the composite algorithm.
##  void SetCompositer ( vtkCompositer * c ) ; virtual vtkCompositer * GetnameCompositer ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Compositer  address  << static_cast < vtkCompositer * > ( this -> Compositer ) ) ; return this -> Compositer ; } ; /@} protected : vtkCompositeRenderManager ( ) ; ~ vtkCompositeRenderManager ( ) override ; vtkCompositer * Compositer ; void PreRenderProcessing ( ) override ; void PostRenderProcessing ( ) override ; vtkFloatArray * DepthData ; vtkUnsignedCharArray * TmpPixelData ; vtkFloatArray * TmpDepthData ; int SavedMultiSamplesSetting ; private : vtkCompositeRenderManager ( const vtkCompositeRenderManager & ) = delete ; void operator = ( const vtkCompositeRenderManager & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
