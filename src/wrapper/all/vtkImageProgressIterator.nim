## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageProgressIterator.h
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
##  @class   vtkImageProgressIterator
##  @brief   a simple image iterator with progress
##
##  This is a simple image iterator that can be used to iterate over an
##  image. Typically used to iterate over the output image
##
##  @sa
##  vtkImageData vtkImageIterator
##

## !!!Ignored construct:  # vtkImageProgressIterator_h [NewLine] # vtkImageProgressIterator_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkImageIterator.h [NewLine] class vtkAlgorithm ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  template < class DType > [end of template] class VTKCOMMONEXECUTIONMODEL_EXPORT vtkImageProgressIterator : public vtkImageIterator < DType > { public : typedef vtkImageIterator < DType > Superclass ; *
##  Create a progress iterator for the provided image data
##  and extent to iterate over. The passes progress object will
##  receive any UpdateProgress calls if the thread id is zero
##  vtkImageProgressIterator ( vtkImageData * imgd , int * ext , vtkAlgorithm * po , int id ) ; *
##  Move the iterator to the next span, may call UpdateProgress on the
##  filter (vtkAlgorithm)
##  void NextSpan ( ) ; *
##  Overridden from vtkImageIterator to check AbortExecute on the
##  filter (vtkAlgorithm).
##  vtkTypeBool IsAtEnd ( ) ; protected : vtkAlgorithm * Algorithm ; unsigned long Count ; unsigned long Count2 ; unsigned long Target ; int ID ; } ;
## Error: token expected: ; but got: [identifier]!!!

when not defined(vtkImageProgressIterator_cxx):
  vtkExternTemplateMacro(extern, `template`, class, VTKCOMMONEXECUTIONMODEL_EXPORTVTKCOMMONEXECUTIONMODEL_EXPORT,
                         vtkImageProgressIterator)
##  VTK-HeaderTest-Exclude: vtkImageProgressIterator.h
