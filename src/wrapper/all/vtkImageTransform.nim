## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageTransform.h
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
##  @class   vtkImageTransform
##  @brief   helper class to transform output of non-axis-aligned images
##
##  vtkImageTransform is a helper class to transform the output of
##  image filters (i.e., filter that input vtkImageData) by applying the
##  Index to Physical transformation from the input image, which can
##  include origin, spacing, direction. The transformation process is
##  threaded with vtkSMPTools for performance.
##
##  Typically in application the single method TransformPointSet() is
##  invoked to transform the output of an image algorithm (assuming
##  that the image's direction/orientation matrix is
##  non-identity). Note that vtkPointSets encompass vtkPolyData as well
##  as vtkUnstructuredGrids. In the future other output types may be
##  added. Note that specific methods for transforming points, normals,
##  and vectors is also provided by this class in case additional
##  output data arrays need to be transformed (since
##  TransformPointSet() only processes data arrays labeled as points,
##  normals, and vectors).
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##

## !!!Ignored construct:  # vtkImageTransform_h [NewLine] # vtkImageTransform_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkObject.h [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImageData"
discard "forward decl of vtkMatrix3x3"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPointSet"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkImageTransform : public vtkObject { public : /@{ *
##  Standard methods for construction, type information, printing.
##  static vtkImageTransform * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageTransform :: IsTypeOf ( type ) ; } static vtkImageTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageTransform * NewInstance ( ) const { return vtkImageTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Given a vtkImageData (and hence its associated orientation
##  matrix), and an instance of vtkPointSet, transform its points, as
##  well as any normals and vectors, associated with the
##  vtkPointSet. This is a convenience function, internally it calls
##  TranslatePoints(), TransformPoints(), TransformNormals(), and/or
##  TransformVectors() as appropriate. Note that both the normals and
##  vectors associated with the point and cell data are transformed
##  unless the second signature is called, which controls whether to
##  transform normals and/or vectors.
##  static void TransformPointSet ( vtkImageData * im , vtkPointSet * ps ) ; static void TransformPointSet ( vtkImageData * im , vtkPointSet * ps , bool transNormals , bool transVectors ) ; /@} *
##  Given x-y-z points represented by a vtkDataArray,
##  translate the points using the image origin. This
##  method is useful if there is no orientation or
##  spacing to apply.
##  static void TranslatePoints ( double * t , vtkDataArray * da ) ; *
##  Given x-y-z points represented by a vtkDataArray,
##  transform the points using the matrix provided.
##  static void TransformPoints ( vtkMatrix4x4 * m4 , vtkDataArray * da ) ; *
##  Given three-component normals represented by a vtkDataArray,
##  transform the normals using the matrix provided.
##  static void TransformNormals ( vtkMatrix3x3 * m3 , double spacing [ 3 ] , vtkDataArray * da ) ; *
##  Given three-component vectors represented by a vtkDataArray,
##  transform the vectors using the matrix provided.
##  static void TransformVectors ( vtkMatrix3x3 * m3 , double spacing [ 3 ] , vtkDataArray * da ) ; protected : vtkImageTransform ( ) = default ; ~ vtkImageTransform ( ) override = default ; private : vtkImageTransform ( const vtkImageTransform & ) = delete ; void operator = ( const vtkImageTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
