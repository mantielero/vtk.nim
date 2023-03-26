## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDeformPointSet.h
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
##  @class   vtkDeformPointSet
##  @brief   use a control polyhedron to deform an input vtkPointSet
##
##  vtkDeformPointSet is a filter that uses a control polyhdron to deform an
##  input dataset of type vtkPointSet. The control polyhedron (or mesh) must
##  be a closed, manifold surface.
##
##  The filter executes as follows. In initial pipeline execution, the control
##  mesh and input vtkPointSet are assumed in undeformed position, and an
##  initial set of interpolation weights are computed for each point in the
##  vtkPointSet (one interpolation weight value for each point in the control
##  mesh). The filter then stores these interpolation weights after filter
##  execution. The next time the filter executes, assuming that the number of
##  points/cells in the control mesh and vtkPointSet have not changed, the
##  points in the vtkPointSet are recomputed based on the original
##  weights. Hence if the control mesh has been deformed, it will in turn
##  cause deformation in the vtkPointSet. This can be used to animate or edit
##  the geometry of the vtkPointSet.
##
##  @warning
##  Note that a set of interpolation weights per point in the vtkPointSet is
##  maintained. The number of interpolation weights is the number of points
##  in the control mesh. Hence keep the control mesh small in size or a n^2
##  data explostion will occur.
##
##  @warning
##  The filter maintains interpolation weights between executions (after the
##  initial execution pass computes the interpolation weights). You can
##  explicitly cause the filter to reinitialize by setting the
##  InitializeWeights boolean to true. By default, the filter will execute and
##  then set InitializeWeights to false.
##
##  @warning
##  This work was motivated by the work of Tao Ju et al in "Mesh Value Coordinates
##  for Closed Triangular Meshes." The MVC algorithm is currently used to generate
##  interpolation weights. However, in the future this filter may be extended to
##  provide other interpolation functions.
##
##  @warning
##  A final note: point data and cell data are passed from the input to the output.
##  Only the point coordinates of the input vtkPointSet are modified.
##
##  @sa
##  vtkMeanValueCoordinatesInterpolator vtkProbePolyhedron vtkPolyhedron
##

## !!!Ignored construct:  # vtkDeformPointSet_h [NewLine] # vtkDeformPointSet_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] # vtkSmartPointer.h  For protected ivars [NewLine] class vtkDoubleArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkDeformPointSet : public vtkPointSetAlgorithm { public : /@{ *
##  Standard methods for instantiable (i.e., concrete) class.
##  static vtkDeformPointSet * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDeformPointSet :: IsTypeOf ( type ) ; } static vtkDeformPointSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDeformPointSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDeformPointSet * NewInstance ( ) const { return vtkDeformPointSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDeformPointSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDeformPointSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the control mesh to deform the input vtkPointSet. The control
##  mesh must be a closed, non-self-intersecting, manifold mesh.
##  void SetControlMeshData ( vtkPolyData * controlMesh ) ; vtkPolyData * GetControlMeshData ( ) ; /@} *
##  Specify the point locations used to probe input. Any geometry
##  can be used. New style. Equivalent to SetInputConnection(1, algOutput).
##  void SetControlMeshConnection ( vtkAlgorithmOutput * algOutput ) ; /@{ *
##  Specify whether to regenerate interpolation weights or not. Initially
##  the filter will reexecute no matter what this flag is set to (initial
##  weights must be computed). Also, this flag is ignored if the number of
##  input points/cells or the number of control mesh points/cells changes
##  between executions. Thus flag is used to force reexecution and
##  recomputation of weights.
##  virtual void SetInitializeWeights ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InitializeWeights  to  << _arg ) ; if ( this -> InitializeWeights != _arg ) { this -> InitializeWeights = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetInitializeWeights ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InitializeWeights  of  << this -> InitializeWeights ) ; return this -> InitializeWeights ; } ; virtual void InitializeWeightsOn ( ) { this -> SetInitializeWeights ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InitializeWeightsOff ( ) { this -> SetInitializeWeights ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkDeformPointSet ( ) ; ~ vtkDeformPointSet ( ) override ; vtkTypeBool InitializeWeights ;  Keep track of information between execution passes vtkIdType InitialNumberOfControlMeshPoints ; vtkIdType InitialNumberOfControlMeshCells ; vtkIdType InitialNumberOfPointSetPoints ; vtkIdType InitialNumberOfPointSetCells ; vtkSmartPointer < vtkDoubleArray > Weights ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkDeformPointSet ( const vtkDeformPointSet & ) = delete ; void operator = ( const vtkDeformPointSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
