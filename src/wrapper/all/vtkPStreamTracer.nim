## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPStreamTracer.h
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
##  @class   vtkPStreamTracer
##  @brief    parallel streamline generators
##
##  This class implements parallel streamline generators. By default all
##  processes must have access to the WHOLE seed source, i.e. the source must
##  be identical on all processes. If property `UseLocalSeedSource` is set to
##  false then this filter will aggregate seed sources from all ranks into a
##  single dataset.
##  @sa
##  vtkStreamTracer
##

## !!!Ignored construct:  # vtkPStreamTracer_h [NewLine] # vtkPStreamTracer_h [NewLine] # vtkSmartPointer.h  This is a leaf node. No need to use PIMPL to avoid compile time penalty. # vtkStreamTracer.h [NewLine] class vtkAbstractInterpolatedVelocityField ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
discard "forward decl of PStreamTracerPoint"
discard "forward decl of vtkOverlappingAMR"
discard "forward decl of AbstractPStreamTracerUtils"
import
  vtkFiltersParallelFlowPathsModule

## !!!Ignored construct:  class VTKFILTERSPARALLELFLOWPATHS_EXPORT vtkPStreamTracer : public vtkStreamTracer { public : /@{ *
##  Standard methods to instantiate the class, obtain type information and
##  print object state.
##  static vtkPStreamTracer * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStreamTracer Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStreamTracer :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPStreamTracer :: IsTypeOf ( type ) ; } static vtkPStreamTracer * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPStreamTracer * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPStreamTracer * NewInstance ( ) const { return vtkPStreamTracer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStreamTracer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPStreamTracer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPStreamTracer :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set/Get the controller use in compositing (set to the global controller
##  by default) If not using the default, this must be called before any
##  other methods.
##  virtual void SetController ( vtkMultiProcessController * controller ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} protected : vtkPStreamTracer ( ) ; ~ vtkPStreamTracer ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkMultiProcessController * Controller ; vtkAbstractInterpolatedVelocityField * Interpolator ; void SetInterpolator ( vtkAbstractInterpolatedVelocityField * ) ; int EmptyData ; private : vtkPStreamTracer ( const vtkPStreamTracer & ) = delete ; void operator = ( const vtkPStreamTracer & ) = delete ; void Trace ( vtkDataSet * input , int vecType , const char * vecName , PStreamTracerPoint * pt , vtkSmartPointer < vtkPolyData > & output , vtkAbstractInterpolatedVelocityField * func , int maxCellSize ) ; bool TraceOneStep ( vtkPolyData * traceOut , vtkAbstractInterpolatedVelocityField * , PStreamTracerPoint * pt ) ; void Prepend ( vtkPolyData * path , vtkPolyData * headh ) ; int Rank ; int NumProcs ; friend class AbstractPStreamTracerUtils ; vtkSmartPointer < AbstractPStreamTracerUtils > Utils ; } ;
## Error: token expected: ; but got: [identifier]!!!
