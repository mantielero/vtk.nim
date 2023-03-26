## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDummyGPUInfoList.h
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
##  @class   vtkDummyGPUInfoList
##  @brief   Do thing during Probe()
##
##  vtkDummyGPUInfoList implements Probe() by just setting the count of
##  GPUs to be zero. Useful when an OS specific implementation is not available.
##  @sa
##  vtkGPUInfo vtkGPUInfoList
##

## !!!Ignored construct:  # vtkDummyGPUInfoList_h [NewLine] # vtkDummyGPUInfoList_h [NewLine] # vtkGPUInfoList.h [NewLine] # vtkRenderingOpenGL2Module.h  For export macro [NewLine] class VTKRENDERINGOPENGL2_EXPORT vtkDummyGPUInfoList : public vtkGPUInfoList { public : static vtkDummyGPUInfoList * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGPUInfoList Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGPUInfoList :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDummyGPUInfoList :: IsTypeOf ( type ) ; } static vtkDummyGPUInfoList * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDummyGPUInfoList * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDummyGPUInfoList * NewInstance ( ) const { return vtkDummyGPUInfoList :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGPUInfoList :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDummyGPUInfoList :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDummyGPUInfoList :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Build the list of vtkInfoGPU if not done yet.
##  \post probed: IsProbed()
##  void Probe ( ) override ; protected : /@{ *
##  Default constructor.
##  vtkDummyGPUInfoList ( ) ; ~ vtkDummyGPUInfoList ( ) override ; /@} private : vtkDummyGPUInfoList ( const vtkDummyGPUInfoList & ) = delete ; void operator = ( const vtkDummyGPUInfoList & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
