## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPProjectSphereFilter.h
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
##  @class   vtkPProjectSphereFilter
##  @brief   A filter to 'unroll' a sphere.  The
##  unroll longitude is -180.
##
##
##

## !!!Ignored construct:  # vtkPProjectSphereFilter_h [NewLine] # vtkPProjectSphereFilter_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkProjectSphereFilter.h [NewLine] class VTKFILTERSPARALLEL_EXPORT vtkPProjectSphereFilter : public vtkProjectSphereFilter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkProjectSphereFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkProjectSphereFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPProjectSphereFilter :: IsTypeOf ( type ) ; } static vtkPProjectSphereFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPProjectSphereFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPProjectSphereFilter * NewInstance ( ) const { return vtkPProjectSphereFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProjectSphereFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPProjectSphereFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPProjectSphereFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPProjectSphereFilter * New ( ) ; protected : vtkPProjectSphereFilter ( ) ; ~ vtkPProjectSphereFilter ( ) override ; *
##  Parallel part of the algorithm to figure out the closest point
##  to the centerline (i.e. line connecting -90 latitude to 90 latitude)
##  if we don't build cells using points at the poles.
##  void ComputePointsClosestToCenterLine ( double , vtkIdList * ) override ; *
##  If TranslateZ is true then this is the method that computes
##  the amount to translate.
##  double GetZTranslation ( vtkPointSet * input ) override ; private : vtkPProjectSphereFilter ( const vtkPProjectSphereFilter & ) = delete ; void operator = ( const vtkPProjectSphereFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
