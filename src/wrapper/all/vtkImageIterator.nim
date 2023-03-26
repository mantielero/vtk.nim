## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageIterator.h
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
##  @class   vtkImageIterator
##  @brief   a simple image iterator
##
##  This is a simple image iterator that can be used to iterate over an
##  image. This should be used internally by Filter writers.
##
##  @sa
##  vtkImageData vtkImageProgressIterator
##

## !!!Ignored construct:  # vtkImageIterator_h [NewLine] # vtkImageIterator_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkSystemIncludes.h [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  template < class DType > [end of template] class VTKCOMMONDATAMODEL_EXPORT vtkImageIterator { public : typedef DType * SpanIterator ; *
##  Default empty constructor, useful only when creating an array of iterators
##  You need to call Initialize afterward
##  vtkImageIterator ( ) ; *
##  Create an image iterator for a given image data and a given extent
##  vtkImageIterator ( vtkImageData * id , int * ext ) ; *
##  Initialize the image iterator for a given image data, and given extent
##  void Initialize ( vtkImageData * id , int * ext ) ; *
##  Move the iterator to the next span
##  void NextSpan ( ) ; *
##  Return an iterator (pointer) for the span
##  SpanIterator BeginSpan ( ) { return this -> Pointer ; } *
##  Return an iterator (pointer) for the end of the span
##  SpanIterator EndSpan ( ) { return this -> SpanEndPointer ; } *
##  Test if the end of the extent has been reached
##  vtkTypeBool IsAtEnd ( ) { return ( this -> Pointer >= this -> EndPointer ) ; } protected : DType * Pointer ; DType * SpanEndPointer ; DType * SliceEndPointer ; DType * EndPointer ; vtkIdType Increments [ 3 ] ; vtkIdType ContinuousIncrements [ 3 ] ; } ;
## Error: token expected: ; but got: [identifier]!!!

when not defined(vtkImageIterator_cxx):
  when defined(_MSC_VER):
    ##  The following is needed when the vtkImageIterator is declared
    ##  dllexport and is used from another class in vtkCommonCore
  vtkExternTemplateMacro(extern, `template`, class,
                         VTKCOMMONDATAMODEL_EXPORTVTKCOMMONDATAMODEL_EXPORT,
                         vtkImageIterator)
  when defined(_MSC_VER):
    discard
##  VTK-HeaderTest-Exclude: vtkImageIterator.h
