## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContextDevice3D.h
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
##  @class   vtkContextDevice3D
##  @brief   Abstract class for drawing 3D primitives.
##
##
##  This defines the interface for a vtkContextDevice3D. In this sense a
##  ContextDevice is a class used to paint 3D primitives onto a device, such as
##  an OpenGL context.
##
##  This is private API, and should not be used outside of the vtkContext3D.
##

## !!!Ignored construct:  # vtkContextDevice3D_h [NewLine] # vtkContextDevice3D_h [NewLine] # vtkObject.h [NewLine] # vtkRect.h  For the rectangles.. # vtkRenderingContext2DModule.h  For export macro # vtkVector.h  For the vector coordinates. [NewLine] class vtkMatrix4x4 ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkViewport"
discard "forward decl of vtkPen"
discard "forward decl of vtkBrush"
## !!!Ignored construct:  class VTKRENDERINGCONTEXT2D_EXPORT vtkContextDevice3D : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkContextDevice3D :: IsTypeOf ( type ) ; } static vtkContextDevice3D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkContextDevice3D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkContextDevice3D * NewInstance ( ) const { return vtkContextDevice3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContextDevice3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContextDevice3D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkContextDevice3D * New ( ) ; *
##  Draw a polyline between the specified points.
##  \sa DrawLines()
##  virtual void DrawPoly ( const float * verts , int n , const unsigned char * colors = nullptr , int nc = 0 ) = 0 ; *
##  Draw lines defined by specified pair of points.
##  \sa DrawPoly()
##  virtual void DrawLines ( const float * verts , int n , const unsigned char * colors = nullptr , int nc = 0 ) = 0 ; *
##  Draw points at the vertex positions specified.
##  virtual void DrawPoints ( const float * verts , int n , const unsigned char * colors = nullptr , int nc = 0 ) = 0 ; *
##  Draw triangles to generate the specified mesh.
##  virtual void DrawTriangleMesh ( const float * mesh , int n , const unsigned char * colors , int nc ) = 0 ; *
##  Apply the supplied pen which controls the outlines of shapes, as well as
##  lines, points and related primitives. This makes a deep copy of the vtkPen
##  object in the vtkContext2D, it does not hold a pointer to the supplied object.
##  virtual void ApplyPen ( vtkPen * pen ) = 0 ; *
##  Apply the supplied brush which controls the outlines of shapes, as well as
##  lines, points and related primitives. This makes a deep copy of the vtkBrush
##  object in the vtkContext2D, it does not hold a pointer to the supplied object.
##  virtual void ApplyBrush ( vtkBrush * brush ) = 0 ; *
##  Set the model view matrix for the display
##  virtual void SetMatrix ( vtkMatrix4x4 * m ) = 0 ; *
##  Set the model view matrix for the display
##  virtual void GetMatrix ( vtkMatrix4x4 * m ) = 0 ; *
##  Multiply the current model view matrix by the supplied one
##  virtual void MultiplyMatrix ( vtkMatrix4x4 * m ) = 0 ; *
##  Push the current matrix onto the stack.
##  virtual void PushMatrix ( ) = 0 ; *
##  Pop the current matrix off of the stack.
##  virtual void PopMatrix ( ) = 0 ; *
##  Supply a float array of length 4 with x1, y1, width, height specifying
##  clipping region for the device in pixels.
##  virtual void SetClipping ( const vtkRecti & rect ) = 0 ; *
##  Disable clipping of the display.
##  Remove in a future release - retained for API compatibility.
##  virtual void DisableClipping ( ) { this -> EnableClipping ( false ) ; } *
##  Enable or disable the clipping of the scene.
##  virtual void EnableClipping ( bool enable ) = 0 ; /@{ *
##  Enable/Disable the specified clipping plane.
##  virtual void EnableClippingPlane ( int i , double * planeEquation ) = 0 ; virtual void DisableClippingPlane ( int i ) = 0 ; /@} protected : vtkContextDevice3D ( ) ; ~ vtkContextDevice3D ( ) override ; private : vtkContextDevice3D ( const vtkContextDevice3D & ) = delete ; void operator = ( const vtkContextDevice3D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
