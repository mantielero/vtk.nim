## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInterpolationKernel.h
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
##  @class   vtkInterpolationKernel
##  @brief   base class for interpolation kernels
##
##
##  vtkInterpolationKernel specifies an abstract interface for interpolation
##  kernels. An interpolation kernel is used to produce an interpolated data
##  value at a point X from the points + data in a local neighborhood
##  surrounding X. For example, given the N nearest points surrounding X, the
##  interpolation kernel provides N weights, which when combined with the N
##  data values associated with these nearest points, produces an interpolated
##  data value at point X.
##
##  Note that various kernel initialization methods are provided. The basic
##  method requires providing a point locator to accelerate neighborhood
##  queries. Some kernels may refer back to the original dataset, or the point
##  attribute data associated with the dataset. The initialization method
##  enables different styles of initialization and is kernel-dependent.
##
##  Typically the kernels are invoked in two parts: first, the basis is
##  computed using the supplied point locator and dataset. This basis is a
##  local footprint of point surrounding a poitnX. In this footprint are the
##  neighboring points used to compute the interpolation weights. Then, the
##  weights are computed from points forming the basis. However, advanced
##  users can develop their own basis, skipping the ComputeBasis() method, and
##  then invoke ComputeWeights() directly.
##
##  @warning
##  The ComputeBasis() and ComputeWeights() methods must be thread safe as they
##  are used in threaded algorithms.
##
##  @sa
##  vtkPointInterpolator vtkPointInterpolator2D vtkGeneralizedKernel
##  vtkGaussianKernel vtkSPHKernel vtkShepardKernel vtkVoronoiKernel
##

## !!!Ignored construct:  # vtkInterpolationKernel_h [NewLine] # vtkInterpolationKernel_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkObject.h [NewLine] class vtkAbstractPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdList"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkPointData"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkInterpolationKernel : public vtkObject { public : /@{ *
##  Standard method for type and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return vtkInterpolationKernel ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( vtkInterpolationKernel , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInterpolationKernel :: IsTypeOf ( type ) ; } static vtkInterpolationKernel * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( vtkInterpolationKernel ) ) { return static_cast < vtkInterpolationKernel * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInterpolationKernel * NewInstance ( ) const { return vtkInterpolationKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( vtkInterpolationKernel , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInterpolationKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Initialize the kernel. Pass information into the kernel that is
##  necessary to subsequently perform evaluation. The locator refers to the
##  points that are to be interpolated from; these points (ds) and the
##  associated point data (pd) are provided as well. Note that some kernels
##  may require manual setup / initialization, in which case set
##  RequiresInitialization to false, do not call Initialize(), and of course
##  manually initialize the kernel.
##  virtual void Initialize ( vtkAbstractPointLocator * loc , vtkDataSet * ds , vtkPointData * pd ) ; /@{ *
##  Indicate whether the kernel needs initialization. By default this data
##  member is true, and using classes will invoke Initialize() on the
##  kernel. However, if the user takes over initialization manually, then
##  set RequiresInitialization to false (0).
##  virtual void SetRequiresInitialization ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RequiresInitialization  to  << _arg ) ; if ( this -> RequiresInitialization != _arg ) { this -> RequiresInitialization = _arg ; this -> Modified ( ) ; } } ; virtual bool GetRequiresInitialization ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RequiresInitialization  of  << this -> RequiresInitialization ) ; return this -> RequiresInitialization ; } ; virtual void RequiresInitializationOn ( ) { this -> SetRequiresInitialization ( static_cast < bool > ( 1 ) ) ; } virtual void RequiresInitializationOff ( ) { this -> SetRequiresInitialization ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Given a point x (and optional associated point id), determine the points
##  around x which form an interpolation basis. The user must provide the
##  vtkIdList pIds, which will be dynamically resized as necessary. The
##  method returns the number of points in the basis. Typically this method
##  is called before ComputeWeights(). Note that ptId is optional in most
##  cases, although in some kernels it is used to facilitate basis
##  computation.
##  virtual vtkIdType ComputeBasis ( double x [ 3 ] , vtkIdList * pIds , vtkIdType ptId = 0 ) = 0 ; *
##  Given a point x, and a list of basis points pIds, compute interpolation
##  weights associated with these basis points.  Note that both the nearby
##  basis points list pIds and the weights array are provided by the caller
##  of the method, and may be dynamically resized as necessary. The method
##  returns the number of weights (pIds may be resized in some
##  cases). Typically this method is called after ComputeBasis(), although
##  advanced users can invoke ComputeWeights() and provide the interpolation
##  basis points pIds directly.
##  virtual vtkIdType ComputeWeights ( double x [ 3 ] , vtkIdList * pIds , vtkDoubleArray * weights ) = 0 ; protected : vtkInterpolationKernel ( ) ; ~ vtkInterpolationKernel ( ) override ; bool RequiresInitialization ; vtkAbstractPointLocator * Locator ; vtkDataSet * DataSet ; vtkPointData * PointData ;  Just clear out the data. Can be overloaded by subclasses as necessary. virtual void FreeStructures ( ) ; private : vtkInterpolationKernel ( const vtkInterpolationKernel & ) = delete ; void operator = ( const vtkInterpolationKernel & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
