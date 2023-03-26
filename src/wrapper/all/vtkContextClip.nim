## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContextItem.h
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
##  @class   vtkContextClip
##  @brief   all children of this item are clipped
##  by the specified area.
##
##
##  This class can be used to clip the rendering of an item inside a rectangular
##  area.
##

## !!!Ignored construct:  # vtkContextClip_h [NewLine] # vtkContextClip_h [NewLine] # vtkAbstractContextItem.h [NewLine] # vtkRenderingContext2DModule.h  For export macro # vtkSmartPointer.h  Needed for SP ivars. [NewLine] class VTKRENDERINGCONTEXT2D_EXPORT vtkContextClip : public vtkAbstractContextItem { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractContextItem Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractContextItem :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkContextClip :: IsTypeOf ( type ) ; } static vtkContextClip * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkContextClip * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkContextClip * NewInstance ( ) const { return vtkContextClip :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContextClip :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContextClip :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Creates a vtkContextClip object.
##  static vtkContextClip * New ( ) ; *
##  Perform any updates to the item that may be necessary before rendering.
##  The scene should take care of calling this on all items before their
##  Paint function is invoked.
##  void Update ( ) override ; *
##  Paint event for the item, called whenever the item needs to be drawn.
##  bool Paint ( vtkContext2D * painter ) override ; *
##  Set the origin, width and height of the clipping rectangle. These are in
##  pixel coordinates.
##  virtual void SetClip ( float x , float y , float width , float height ) ; *
##  Get the clipping rectangle parameters in pixel coordinates:
##  virtual void GetRect ( float rect [ 4 ] ) ; virtual float GetX ( ) { return Dims [ 0 ] ; } virtual float GetY ( ) { return Dims [ 1 ] ; } virtual float GetWidth ( ) { return Dims [ 2 ] ; } virtual float GetHeight ( ) { return Dims [ 3 ] ; } protected : vtkContextClip ( ) ; ~ vtkContextClip ( ) override ; float Dims [ 4 ] ; private : vtkContextClip ( const vtkContextClip & ) = delete ; void operator = ( const vtkContextClip & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetRect*(rect: array[4, cfloat]) {.importcpp: "VTKRENDERINGCONTEXT2D_EXPORT::GetRect(@)",
                                    header: "vtkContextClip.h".}