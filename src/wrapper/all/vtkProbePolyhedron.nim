## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProbePolyhedron.h
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
##  @class   vtkProbePolyhedron
##  @brief   probe/interpolate data values in the interior,
##  exterior or of the surface of a closed, manifold polyhedron
##
##  vtkProbePolyhedron is a filter that computes point attributes (e.g.,
##  scalars, vectors, etc.) at specified point positions. The filter has two
##  inputs: the Input and Source. The Source geometric structure is passed
##  through the filter. The point attributes are computed at the Input point
##  positions by interpolating into the source data. In this filter, the
##  Source is always a closed, non-self-intersecting, polyhedral mesh. For
##  example, we can compute data values on a plane (plane specified as Input)
##  from a triangle mesh (e.g., output of marching cubes).
##
##  This filter can be used to resample data from a mesh onto a different
##  dataset type. For example, a polyhedral mesh (vtkPolyData) can be probed
##  with a volume (three-dimensional vtkImageData), and then volume rendering
##  techniques can be used to visualize the results. Another example: a line
##  or curve can be used to probe a mesh to produce x-y plots along that line or
##  curve.
##
##  @warning
##  Note that cell data is not interpolated from the source. If you need cell data,
##  you can always use vtkPointDataToCellData and/or vtkCellDataToPointData in
##  various combinations.
##
##  @warning
##  Note that the filter interpolates from a mesh to points interior, exterior
##  or on the surface of the mesh. This process is necessarily an
##  approximation. Currently the approach of Mean Value Coordinates is used,
##  but this filter may be extended in the future to use other methods.
##
##
##  @sa
##  vtkProbeFilter vtkMeanValueCoordinatesInterpolator vtkPolyhedron
##

## !!!Ignored construct:  # vtkProbePolyhedron_h [NewLine] # vtkProbePolyhedron_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkDataSetAttributes.h  needed for vtkDataSetAttributes::FieldList # vtkFiltersGeneralModule.h  For export macro [NewLine] class vtkIdTypeArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCharArray"
discard "forward decl of vtkMaskPoints"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkProbePolyhedron : public vtkDataSetAlgorithm { public : /@{ *
##  Standard methods for instantiable (i.e., concrete) class.
##  static vtkProbePolyhedron * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProbePolyhedron :: IsTypeOf ( type ) ; } static vtkProbePolyhedron * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProbePolyhedron * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProbePolyhedron * NewInstance ( ) const { return vtkProbePolyhedron :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProbePolyhedron :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProbePolyhedron :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the point locations used to probe input. Any geometry
##  can be used.
##  void SetSourceData ( vtkPolyData * source ) ; vtkPolyData * GetSource ( ) ; /@} *
##  Specify the point locations used to probe input. Any geometry
##  can be used. New style. Equivalent to SetInputConnection(1, algOutput).
##  void SetSourceConnection ( vtkAlgorithmOutput * algOutput ) ; /@{ *
##  Specify whether to probe (and hence produce) point data. The
##  interpolated point data of the source will produce the output
##  point data (output points are passed from the input points).
##  virtual void SetProbePointData ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProbePointData  to  << _arg ) ; if ( this -> ProbePointData != _arg ) { this -> ProbePointData = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetProbePointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProbePointData  of  << this -> ProbePointData ) ; return this -> ProbePointData ; } ; virtual void ProbePointDataOn ( ) { this -> SetProbePointData ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ProbePointDataOff ( ) { this -> SetProbePointData ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether to probe (and hence produce) cell data. The
##  interpolated point data of the source will produce the output
##  cell data (output cells are passed from the input cells). Note
##  that the probing of the input uses the centers of the cells as
##  the probe position.
##  virtual void SetProbePointDataProbeCellData ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProbeCellData  to  << _arg ) ; if ( this -> ProbeCellData != _arg ) { this -> ProbeCellData = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetProbePointDataProbeCellData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProbeCellData  of  << this -> ProbeCellData ) ; return this -> ProbeCellData ; } ; virtual void ProbeCellDataOn ( ) { this -> SetProbePointDataProbeCellData ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ProbeCellDataOff ( ) { this -> SetProbePointDataProbeCellData ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkProbePolyhedron ( ) ; ~ vtkProbePolyhedron ( ) override ; vtkTypeBool ProbePointData ; vtkTypeBool ProbeCellData ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkProbePolyhedron ( const vtkProbePolyhedron & ) = delete ; void operator = ( const vtkProbePolyhedron & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
