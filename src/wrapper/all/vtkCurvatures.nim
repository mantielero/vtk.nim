## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCurvatures.h
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
##  @class   vtkCurvatures
##  @brief   compute curvatures (Gauss and mean) of a Polydata object
##
##  vtkCurvatures takes a polydata input and computes the curvature of the
##  mesh at each point. Four possible methods of computation are available :
##
##  Gauss Curvature discrete Gauss curvature (\f$ K \f$),
##  \f$K_v = 2\pi-n_vf_v(\alpha)\f$, where \f$K_v\f$ is the curvature
##  at vertex \f$v\f$, \f$n_v\f$ the facet neighbours of the vertex \f$v\f$
##  and \f$f_v(\alpha)\f$ is the angle of \f$f\f$ at vertex \f$v\f$.
##  The contribution of every facet is for the moment weighted by the
##  (area of each facet)/3 The units of Gaussian Curvature are \f$m^{-2}\f$.
##
##  Mean Curvature \f$H_v = \overline{H_e}\f$, where \f$\overline{H_e}\f$ is
##  the average over the edge neighbours of \f$H_e\f$.
##  \f$H_e = l(e)*\alpha(e)\f$ where \f$e\f$ is an edge, \f$l\f$ is the length
##  and \f$\alpha\f$ is the dihederal angle such that
##  \f$-\pi < \alpha < \pi\f$. This means that the surface is assumed to
##  be orientable and the computation creates the orientation. The units of
##  Mean Curvature are \f$m^{-1}\f$.
##
##  Maximum (\f$k_{max}\f$) and Minimum (\f$k_{min}\f$) Principal Curvatures
##   are \f$k_{max} = H + \sqrt{H^2 - K}\f$ and
##  \f$k_{min} = H - \sqrt{H^2 - K}\f$.
##  Excepting spherical and planar surfaces which have equal
##  principal curvatures, the curvature at a point on a surface varies with
##  the direction one "sets off" from the point. For all directions, the
##  curvature will pass through two extrema: a minimum (\f$k_{min}\f$) and a
##  maximum (\f$k_{max}\f$) which occur at mutually orthogonal directions
##  to each other.
##
##  The sign of the Gauss curvature is a geometric ivariant, it should be
##  positive when the surface looks like a sphere, negative when it looks
##  like a saddle, however, the sign of the Mean curvature is not, it depends
##  on the convention for normals, This code assumes that normals point
##  outwards (ie from the surface of a sphere outwards). If a given mesh
##  produces curvatures of opposite senses then the flag InvertMeanCurvature
##   can be set and the Curvature reported by the Mean calculation will
##  be inverted.
##
##  For a little more information see
##  <a href="https://public.kitware.com/pipermail/vtkusers/2002-July/012198.html"
##  >Computing curvature of a surface</a>
##
##  @par Thanks:
##  <a href="https://en.wikipedia.org/wiki/Philip_Batchelor">Philip Batchelor</a>
##  for creating and contributing the class and Andrew Maclean for cleanups and
##  fixes. Thanks also to John Biddiscombe for adding the class and
##  Goodwin Lawlor for contributing a patch to calculate principal curvatures
##
##

## !!!Ignored construct:  # vtkCurvatures_h [NewLine] # vtkCurvatures_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_CURVATURE_GAUSS 0 [NewLine] # VTK_CURVATURE_MEAN 1 [NewLine] # VTK_CURVATURE_MAXIMUM 2 [NewLine] # VTK_CURVATURE_MINIMUM 3 [NewLine] class VTKFILTERSGENERAL_EXPORT vtkCurvatures : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCurvatures :: IsTypeOf ( type ) ; } static vtkCurvatures * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCurvatures * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCurvatures * NewInstance ( ) const { return vtkCurvatures :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCurvatures :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCurvatures :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with curvature type set to Gauss
##  static vtkCurvatures * New ( ) ; /@{ *
##  Set/Get Curvature type
##  VTK_CURVATURE_GAUSS: Gaussian curvature, stored as
##  DataArray "Gauss_Curvature"
##  VTK_CURVATURE_MEAN : Mean curvature, stored as
##  DataArray "Mean_Curvature"
##  virtual void SetCurvatureType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CurvatureType  to  << _arg ) ; if ( this -> CurvatureType != _arg ) { this -> CurvatureType = _arg ; this -> Modified ( ) ; } } ; virtual int GetCurvatureType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurvatureType  of  << this -> CurvatureType ) ; return this -> CurvatureType ; } ; void SetCurvatureTypeToGaussian ( ) { this -> SetCurvatureType ( VTK_CURVATURE_GAUSS ) ; } void SetCurvatureTypeToMean ( ) { this -> SetCurvatureType ( VTK_CURVATURE_MEAN ) ; } void SetCurvatureTypeToMaximum ( ) { this -> SetCurvatureType ( VTK_CURVATURE_MAXIMUM ) ; } void SetCurvatureTypeToMinimum ( ) { this -> SetCurvatureType ( VTK_CURVATURE_MINIMUM ) ; } /@} /@{ *
##  Set/Get the flag which inverts the mean curvature calculation for
##  meshes with inward pointing normals (default false)
##  virtual void SetCurvatureTypeInvertMeanCurvature ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InvertMeanCurvature  to  << _arg ) ; if ( this -> InvertMeanCurvature != _arg ) { this -> InvertMeanCurvature = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCurvatureTypeInvertMeanCurvature ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InvertMeanCurvature  of  << this -> InvertMeanCurvature ) ; return this -> InvertMeanCurvature ; } ; virtual void InvertMeanCurvatureOn ( ) { this -> SetInvertMeanCurvature ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InvertMeanCurvatureOff ( ) { this -> SetInvertMeanCurvature ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkCurvatures ( ) ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Discrete Gauss curvature (K) computation
##  void GetGaussCurvature ( vtkPolyData * output ) ; void ComputeGaussCurvature ( vtkCellArray * facets , vtkPolyData * output , double * gaussCurvatureData ) ; *
##  Discrete Mean curvature (H) computation
##  void GetMeanCurvature ( vtkPolyData * output ) ; *
##  Maximum principal curvature
##  void GetMaximumCurvature ( vtkPolyData * input , vtkPolyData * output ) ; *
##  Minimum principal curvature
##  void GetMinimumCurvature ( vtkPolyData * input , vtkPolyData * output ) ;  Vars int CurvatureType ; vtkTypeBool InvertMeanCurvature ; private : vtkCurvatures ( const vtkCurvatures & ) = delete ; void operator = ( const vtkCurvatures & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
