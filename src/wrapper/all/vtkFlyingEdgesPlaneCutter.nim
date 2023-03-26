## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFlyingEdgesPlaneCutter.h
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
##  @class   vtkFlyingEdgesPlaneCutter
##  @brief   cut a volume with a plane and generate a
##  polygonal cut surface
##
##  vtkFlyingEdgesPlaneCutter is a specialization of the FlyingEdges algorithm
##  to cut a volume with a single plane. It is designed for performance and
##  an exploratory, fast workflow. The filter handles oriented volumes.
##
##  This algorithm is not only fast because it uses flying edges, but also
##  because it plays some "tricks" during processing. For example, rather
##  than evaluate the cut (plane) function on all volume points like vtkCutter
##  and its ilk do, this algorithm intersects the volume x-edges against the
##  plane to (potentially) generate the single intersection point. It then
##  quickly classifies the voxel edges as above, below, or straddling the cut
##  plane. Thus the number of plane evaluations is greatly reduced.
##
##  For more information see vtkFlyingEdges3D and/or the paper "Flying Edges:
##  A High-Performance Scalable Isocontouring Algorithm" by Schroeder,
##  Maynard, Geveci. Proc. of LDAV 2015. Chicago, IL.
##
##  @warning
##  This filter is specialized to 3D volumes. This implementation can produce
##  degenerate triangles (i.e., zero-area triangles).
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkFlyingEdges2D vtkFlyingEdges3D
##

## !!!Ignored construct:  # vtkFlyingEdgesPlaneCutter_h [NewLine] # vtkFlyingEdgesPlaneCutter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPlane"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkFlyingEdgesPlaneCutter : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard construction and print methods.
##  static vtkFlyingEdgesPlaneCutter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFlyingEdgesPlaneCutter :: IsTypeOf ( type ) ; } static vtkFlyingEdgesPlaneCutter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFlyingEdgesPlaneCutter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFlyingEdgesPlaneCutter * NewInstance ( ) const { return vtkFlyingEdgesPlaneCutter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFlyingEdgesPlaneCutter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFlyingEdgesPlaneCutter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  The modified time depends on the delegated cut plane.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Specify the plane (an implicit function) to perform the cutting. The
##  definition of the plane (its origin and normal) is controlled via this
##  instance of vtkPlane.
##  virtual void SetPlane ( vtkPlane * ) ; virtual vtkPlane * GetnamePlane ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Plane  address  << static_cast < vtkPlane * > ( this -> Plane ) ) ; return this -> Plane ; } ; /@} /@{ *
##  Set/Get the computation of normals. The normal generated is simply the
##  cut plane normal. By default this is disabled.
##  virtual void SetComputeNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetComputeNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetComputeNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to interpolate other attribute data besides the input
##  scalars (which are required). That is, as the isosurface is generated,
##  interpolate all other point attribute data across intersected edges.
##  virtual void SetComputeNormalsInterpolateAttributes ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InterpolateAttributes  to  << _arg ) ; if ( this -> InterpolateAttributes != _arg ) { this -> InterpolateAttributes = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormalsInterpolateAttributes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateAttributes  of  << this -> InterpolateAttributes ) ; return this -> InterpolateAttributes ; } ; virtual void InterpolateAttributesOn ( ) { this -> SetComputeNormalsInterpolateAttributes ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InterpolateAttributesOff ( ) { this -> SetComputeNormalsInterpolateAttributes ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get which component of the scalar array to contour on; defaults to 0.
##  virtual void SetComputeNormalsInterpolateAttributesArrayComponent ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ArrayComponent  to  << _arg ) ; if ( this -> ArrayComponent != _arg ) { this -> ArrayComponent = _arg ; this -> Modified ( ) ; } } ; virtual int GetComputeNormalsInterpolateAttributesArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ; /@} protected : vtkFlyingEdgesPlaneCutter ( ) ; ~ vtkFlyingEdgesPlaneCutter ( ) override ; vtkPlane * Plane ; vtkTypeBool ComputeNormals ; vtkTypeBool InterpolateAttributes ; int ArrayComponent ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkFlyingEdgesPlaneCutter ( const vtkFlyingEdgesPlaneCutter & ) = delete ; void operator = ( const vtkFlyingEdgesPlaneCutter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
