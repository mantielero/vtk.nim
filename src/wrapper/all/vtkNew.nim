## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNew.h
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
##  @class   vtkNew
##  @brief   Allocate and hold a VTK object.
##
##  vtkNew is a class template that on construction allocates and
##  initializes an instance of its template argument using T::New().
##  It assumes ownership of one reference during its lifetime, and calls
##  T->Delete() on destruction.
##
##  Automatic casting to raw pointer is available for convenience, but
##  users of this method should ensure that they do not
##  return this pointer if the vtkNew will go out of scope without
##  incrementing its reference count.
##
##  vtkNew is a drop in replacement for vtkSmartPointer, for example,
##
##  \code
##  vtkNew<vtkRenderer> ren;
##  vtkNew<vtkRenderWindow> renWin;
##  renWin->AddRenderer(ren);
##  vtkNew<vtkRenderWindowInteractor> iren;
##  iren->SetRenderWindow(renWin);
##  \endcode
##
##
##  @sa
##  vtkSmartPointer vtkWeakPointer
##

import
  vtkIOStream, vtkMeta

discard "forward decl of vtkObjectBase"
type
  vtkNew*[T] {.importcpp: "vtkNew<\'0>", header: "vtkNew.h", bycopy.} = object ##  Allow other smart pointers friend access:


## !!!Ignored construct:   These static asserts only fire when the function calling CheckTypes is
##  used. Thus, this smart pointer class may still be used as a member variable
##  with a forward declared T, so long as T is defined by the time the calling
##  function is used. template < typename U = T > [end of template] static void CheckTypes ( ) noexcept { static_assert ( vtk :: detail :: IsComplete < T > :: value , vtkNew<T>'s T type has not been defined. Missing include? ) ; static_assert ( vtk :: detail :: IsComplete < U > :: value , Cannot store an object with undefined type in  vtkNew. Missing include? ) ; static_assert ( std :: is_base_of < T , U > :: value , Argument type is not compatible with vtkNew<T>'s  T type. ) ; static_assert ( std :: is_base_of < vtkObjectBase , T > :: value , vtkNew can only be used with subclasses of vtkObjectBase. ) ; } public : *
##  Create a new T on construction.
##  vtkNew ( ) : Object ( T :: New ( ) ) { vtkNew :: CheckTypes ( ) ; } *
##  Move the object into the constructed vtkNew wrapper, stealing its
##  reference. The argument is reset to nullptr.
##  @{
##  vtkNew ( vtkNew && o ) noexcept : Object ( o . Object ) { o . Object = nullptr ; } template < typename U > vtkNew ( vtkNew < U > && o ) noexcept : Object ( o . Object ) { vtkNew :: CheckTypes < U > ( ) ; o . Object = nullptr ; } /@} /@{ *
##  Deletes reference to instance of T.
##  ~ vtkNew ( ) { this -> Reset ( ) ; } void Reset ( ) { T * obj = this -> Object ; if ( obj ) { this -> Object = nullptr ; obj -> Delete ( ) ; } } /@} *
##  Enable pointer-like dereference syntax. Returns a pointer to the contained
##  object.
##  T * operator -> ( ) const noexcept { return this -> Object ; } /@{ *
##  Get a raw pointer to the contained object. When using this function be
##  careful that the reference count does not drop to 0 when using the pointer
##  returned. This will happen when the vtkNew object goes out of
##  scope for example.
##  T * GetPointer ( ) const noexcept { return this -> Object ; } T * Get ( ) const noexcept { return this -> Object ; } operator T * ( ) const noexcept { return static_cast < T * > ( this -> Object ) ; } /@} *
##  Dereference the pointer and return a reference to the contained object.
##  When using this function be careful that the reference count does not
##  drop to 0 when using the pointer returned.
##  This will happen when the vtkNew object goes out of scope for example.
##  T & operator * ( ) const noexcept { return * static_cast < T * > ( this -> Object ) ; } *
##  Move assignment operator.
##  vtkNew < T > & operator = ( vtkNew < T > && other ) noexcept { this -> Reset ( ) ; this -> Object = other . Object ; other . Object = nullptr ; return * this ; } private : vtkNew ( vtkNew < T > const & ) = delete ;
## Error: token expected: > [end of template] but got: =!!!

##  VTK-HeaderTest-Exclude: vtkNew.h
