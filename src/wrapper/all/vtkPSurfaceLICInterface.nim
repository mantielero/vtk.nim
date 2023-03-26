## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPSurfaceLICInterface.h
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
##  @class   vtkPSurfaceLICInterface
##  @brief   parallel parts of the vtkSurfaceLICInterface
##
##
##  Parallel parts of the vtkSurfaceLICInterface, see that class for
##  documentation.
##

## !!!Ignored construct:  # vtkPSurfaceLICInterface_h [NewLine] # vtkPSurfaceLICInterface_h [NewLine] # vtkRenderingParallelLICModule.h  For export macro # vtkSurfaceLICInterface.h [NewLine] # < string >  for string [NewLine] class vtkPainterCommunicator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKRENDERINGPARALLELLIC_EXPORT vtkPSurfaceLICInterface : public vtkSurfaceLICInterface { public : static vtkPSurfaceLICInterface * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSurfaceLICInterface Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSurfaceLICInterface :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPSurfaceLICInterface :: IsTypeOf ( type ) ; } static vtkPSurfaceLICInterface * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPSurfaceLICInterface * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPSurfaceLICInterface * NewInstance ( ) const { return vtkPSurfaceLICInterface :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSurfaceLICInterface :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPSurfaceLICInterface :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPSurfaceLICInterface :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Methods used for parallel benchmarks. Use cmake to define
##  vtkSurfaceLICInterfaceTIME to enable benchmarks. During each
##  update timing information is stored, it can be written to
##  disk by calling WriteLog.
##  void WriteTimerLog ( VTK_FILEPATH const char * fileName ) override ; protected : vtkPSurfaceLICInterface ( ) ; ~ vtkPSurfaceLICInterface ( ) ; *
##  Get the min/max across all ranks. min/max are in/out.
##  In serial operation this is a no-op, in parallel it
##  is a global collective reduction.
##  void GetGlobalMinMax ( vtkPainterCommunicator * comm , float & min , float & max ) override ; *
##  Creates a new communicator with/without the calling processes
##  as indicated by the passed in flag, if not 0 the calling process
##  is included in the new communicator. In parallel this call is mpi
##  collective on the world communicator. In serial this is a no-op.
##  vtkPainterCommunicator * CreateCommunicator ( int include ) override ; *
##  Ensure that if any rank updates the communicator they all
##  do. This is a global collective operation.
##  bool NeedToUpdateCommunicator ( ) override ; /@{ *
##  Methods used for parallel benchmarks. Use cmake to define
##  vtkSurfaceLICInterfaceTIME to enable benchmarks. During each
##  update timing information is stored, it can be written to
##  disk by calling WriteLog.
##  virtual void StartTimerEvent ( const char * name ) ; virtual void EndTimerEvent ( const char * name ) ; /@} private : std :: string LogFileName ; private : vtkPSurfaceLICInterface ( const vtkPSurfaceLICInterface & ) = delete ; void operator = ( const vtkPSurfaceLICInterface & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
