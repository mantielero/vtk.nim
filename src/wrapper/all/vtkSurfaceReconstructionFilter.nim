## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSurfaceReconstructionFilter.h
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
##  @class   vtkSurfaceReconstructionFilter
##  @brief   reconstructs a surface from unorganized points
##
##  vtkSurfaceReconstructionFilter takes a list of points assumed to lie on
##  the surface of a solid 3D object. A signed measure of the distance to the
##  surface is computed and sampled on a regular grid. The grid can then be
##  contoured at zero to extract the surface. The default values for
##  neighborhood size and sample spacing should give reasonable results for
##  most uses but can be set if desired. This procedure is based on the PhD
##  work of Hugues Hoppe: http://www.research.microsoft.com/~hoppe
##

## !!!Ignored construct:  # vtkSurfaceReconstructionFilter_h [NewLine] # vtkSurfaceReconstructionFilter_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingHybridModule.h  For export macro [NewLine] class VTKIMAGINGHYBRID_EXPORT vtkSurfaceReconstructionFilter : public vtkImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSurfaceReconstructionFilter :: IsTypeOf ( type ) ; } static vtkSurfaceReconstructionFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSurfaceReconstructionFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSurfaceReconstructionFilter * NewInstance ( ) const { return vtkSurfaceReconstructionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSurfaceReconstructionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSurfaceReconstructionFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with NeighborhoodSize=20.
##  static vtkSurfaceReconstructionFilter * New ( ) ; /@{ *
##  Specify the number of neighbors each point has, used for estimating the
##  local surface orientation.  The default value of 20 should be OK for
##  most applications, higher values can be specified if the spread of
##  points is uneven. Values as low as 10 may yield adequate results for
##  some surfaces. Higher values cause the algorithm to take longer. Higher
##  values will cause errors on sharp boundaries.
##  virtual int GetNeighborhoodSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NeighborhoodSize  of  << this -> NeighborhoodSize ) ; return this -> NeighborhoodSize ; } ; virtual void SetNeighborhoodSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NeighborhoodSize  to  << _arg ) ; if ( this -> NeighborhoodSize != _arg ) { this -> NeighborhoodSize = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Specify the spacing of the 3D sampling grid. If not set, a
##  reasonable guess will be made.
##  virtual double GetNeighborhoodSizeSampleSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SampleSpacing  of  << this -> SampleSpacing ) ; return this -> SampleSpacing ; } ; virtual void SetNeighborhoodSizeSampleSpacing ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SampleSpacing  to  << _arg ) ; if ( this -> SampleSpacing != _arg ) { this -> SampleSpacing = _arg ; this -> Modified ( ) ; } } ; /@} protected : vtkSurfaceReconstructionFilter ( ) ; ~ vtkSurfaceReconstructionFilter ( ) override = default ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int NeighborhoodSize ; double SampleSpacing ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkSurfaceReconstructionFilter ( const vtkSurfaceReconstructionFilter & ) = delete ; void operator = ( const vtkSurfaceReconstructionFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
