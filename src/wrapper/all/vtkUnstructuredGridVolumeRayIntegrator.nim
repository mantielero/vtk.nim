## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridVolumeRayIntegrator.h
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
##  @class   vtkUnstructuredGridVolumeRayIntegrator
##  @brief   a superclass for volume ray integration functions
##
##
##
##  vtkUnstructuredGridVolumeRayIntegrator is a superclass for ray
##  integration functions that can be used within a
##  vtkUnstructuredGridVolumeRayCastMapper.
##
##  @sa
##  vtkUnstructuredGridVolumeRayCastMapper
##  vtkUnstructuredGridVolumeRayCastFunction
##

## !!!Ignored construct:  # vtkUnstructuredGridVolumeRayIntegrator_h [NewLine] # vtkUnstructuredGridVolumeRayIntegrator_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class vtkVolume ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkUnstructuredGridVolumeRayIntegrator : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridVolumeRayIntegrator :: IsTypeOf ( type ) ; } static vtkUnstructuredGridVolumeRayIntegrator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridVolumeRayIntegrator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridVolumeRayIntegrator * NewInstance ( ) const { return vtkUnstructuredGridVolumeRayIntegrator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridVolumeRayIntegrator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridVolumeRayIntegrator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set up the integrator with the given properties and scalars.
##  virtual void Initialize ( vtkVolume * volume , vtkDataArray * scalars ) = 0 ; *
##  Given a set of intersections (defined by the three arrays), compute
##  the piecewise integration of the array in front to back order.
##  /c intersectionLengths holds the lengths of each piecewise segment.
##  /c nearIntersections and /c farIntersections hold the scalar values at
##  the front and back of each segment.  /c color should contain the RGBA
##  value of the volume in front of the segments passed in, and the result
##  will be placed back into /c color.
##  virtual void Integrate ( vtkDoubleArray * intersectionLengths , vtkDataArray * nearIntersections , vtkDataArray * farIntersections , float color [ 4 ] ) = 0 ; protected : vtkUnstructuredGridVolumeRayIntegrator ( ) ; ~ vtkUnstructuredGridVolumeRayIntegrator ( ) override ; private : vtkUnstructuredGridVolumeRayIntegrator ( const vtkUnstructuredGridVolumeRayIntegrator & ) = delete ; void operator = ( const vtkUnstructuredGridVolumeRayIntegrator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
