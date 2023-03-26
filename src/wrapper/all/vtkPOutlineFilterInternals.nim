## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPOutlineFilterInternals.h
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
##  @class   vtkPOutlineFilterInternals
##  @brief   create wireframe outline (or corners) for arbitrary data set
##
##  vtkPOutlineFilterInternals has common code for vtkOutlineFilter and
##  vtkOutlineCornerFilter. It assumes the filter is operated in a data parallel
##  pipeline.
##
##  This class does not inherit from vtkObject and is not intended to be used
##  outside of VTK.
##

## !!!Ignored construct:  # vtkPOutlineFilterInternals_h [NewLine] # vtkPOutlineFilterInternals_h [NewLine] # vtkBoundingBox.h   needed for vtkBoundingBox. # vtkFiltersParallelModule.h  For export macro # < vector >  needed for std::vector [NewLine] class vtkBoundingBox ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataObject"
discard "forward decl of vtkDataObjectTree"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkGraph"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkOverlappingAMR"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkUniformGridAMR"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkPOutlineFilterInternals { public : vtkPOutlineFilterInternals ( ) = default ; virtual ~ vtkPOutlineFilterInternals ( ) = default ; *
##  Behave like a vtkAlgorithm::RequestData and compute the outline geometry
##  based on the parameters and provided inputs.
##  Intented to be called in vtkOutlineCornerFilter::RequestData and in
##  vtkOutlineFilter::RequestData.
##  int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; *
##  Set the controller to be used.
##  Default is nullptr.
##  void SetController ( vtkMultiProcessController * ) ; *
##  Set whether or not to generate a corner outline.
##  Default is false.
##  void SetIsCornerSource ( bool value ) ; *
##  Set the corner factor to use when creating corner outline.
##  Default is 0.2.
##  void SetCornerFactor ( double cornerFactor ) ; private : vtkPOutlineFilterInternals ( const vtkPOutlineFilterInternals & ) = delete ; vtkPOutlineFilterInternals & operator = ( const vtkPOutlineFilterInternals & ) = delete ; int RequestData ( vtkOverlappingAMR * amr , vtkPolyData * output ) ; int RequestData ( vtkUniformGridAMR * amr , vtkPolyData * output ) ; int RequestData ( vtkDataObjectTree * cd , vtkPolyData * output ) ; int RequestData ( vtkDataSet * ds , vtkPolyData * output ) ; int RequestData ( vtkGraph * graph , vtkPolyData * output ) ; void CollectCompositeBounds ( vtkDataObject * input ) ; vtkSmartPointer < vtkPolyData > GenerateOutlineGeometry ( double bounds [ 6 ] ) ; std :: vector < vtkBoundingBox > BoundsList ; vtkMultiProcessController * Controller = nullptr ; bool IsCornerSource = false ; double CornerFactor = 0.2 ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkPOutlineFilterInternals.h
