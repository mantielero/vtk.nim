## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStreamSurface.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##    This software is distributed WITHOUT ANY WARRANTY; without even
##    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##    PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkStreamSurface
##  @brief   Advect a stream surface in a vector field
##
##  vtkStreamSurface is a surface streamer that generates a surface using the vectors in the input.
##  Depending on the UseIterativeSeeding parameter, the simple or iterative version is called.
##  The iterative version produces better surfaces, but takes longer.
##
##  @par Thanks:
##  Developed by Roxana Bujack and Karen Tsai at Los Alamos National Laboratory under LDRD 20190143ER
##

## !!!Ignored construct:  # vtkStreamSurface_h [NewLine] # vtkStreamSurface_h [NewLine] # vtkFiltersFlowPathsModule.h  For export macro # vtkStreamTracer.h [NewLine] class vtkAppendPolyData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkRuledSurfaceFilter"
## !!!Ignored construct:  class VTKFILTERSFLOWPATHS_EXPORT vtkStreamSurface : public vtkStreamTracer { public : static vtkStreamSurface * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStreamTracer Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStreamTracer :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkStreamSurface :: IsTypeOf ( type ) ; } static vtkStreamSurface * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkStreamSurface * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkStreamSurface * NewInstance ( ) const { return vtkStreamSurface :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStreamTracer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStreamSurface :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStreamSurface :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify/determine if the simple (fast) or iterative (correct) version is called.
##  virtual void SetUseIterativeSeeding ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseIterativeSeeding  to  << _arg ) ; if ( this -> UseIterativeSeeding != _arg ) { this -> UseIterativeSeeding = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseIterativeSeeding ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseIterativeSeeding  of  << this -> UseIterativeSeeding ) ; return this -> UseIterativeSeeding ; } ; virtual void UseIterativeSeedingOn ( ) { this -> SetUseIterativeSeeding ( static_cast < bool > ( 1 ) ) ; } virtual void UseIterativeSeedingOff ( ) { this -> SetUseIterativeSeeding ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkStreamSurface ( ) ; ~ vtkStreamSurface ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkStreamSurface ( const vtkStreamSurface & ) = delete ; void operator = ( const vtkStreamSurface & ) = delete ; *
##  first advect all point in seeds and then connect the resulting streamlines to a surface
##  field is the vector values dataset in which the streamsurface is advected
##  seeds is the polydata with the start curve
##  output is the final streamsurface
##  @return 1 if successful, 0 if empty
##  int AdvectSimple ( vtkDataObject * field , vtkPolyData * seeds , vtkPolyData * output ) ; *
##  loop: 1.advect one step at a time
##  2. then form surface strip and add it to existing surface
##  3. then check if points have diverged and insert new ones if necessary
##  field is the vecotr values dataset in which the streamsurface is advected
##  seeds is the polydata with the start curve
##  output is the final streamsurface
##  @param field: vector field in which the surfave is advected
##  @param seeds: initial values
##  @param integrationDirection: forward, backward, or both
##  @param output: the final surface
##  @return 1 if successful, 0 if not
##  int AdvectIterative ( vtkDataObject * field , vtkPolyData * seeds , int integrationDirection , vtkPolyData * output ) ; *
##  depending on this boolen the simple (fast) or iterative (correct) version is called
##  bool UseIterativeSeeding = false ; vtkNew < vtkRuledSurfaceFilter > RuledSurface ; vtkNew < vtkStreamTracer > StreamTracer ; vtkNew < vtkAppendPolyData > AppendSurfaces ; } ;
## Error: token expected: ; but got: [identifier]!!!
