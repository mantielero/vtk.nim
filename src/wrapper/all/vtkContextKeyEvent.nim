## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContextScene.h
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
##  @class   vtkContextKeyEvent
##  @brief   data structure to represent key events.
##
##
##  Provides a convenient data structure to represent key events in the
##  vtkContextScene. Passed to vtkAbstractContextItem objects.
##

## !!!Ignored construct:  # vtkContextKeyEvent_h [NewLine] # vtkContextKeyEvent_h [NewLine] # vtkRenderingContext2DModule.h  For export macro # vtkVector.h  For vtkVector2i # vtkWeakPointer.h  For vtkWeakPointer [NewLine] class vtkRenderWindowInteractor ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKRENDERINGCONTEXT2D_EXPORT vtkContextKeyEvent { public : vtkContextKeyEvent ( ) ; *
##  Set the interactor for the key event.
##  void SetInteractor ( vtkRenderWindowInteractor * interactor ) ; *
##  Get the interactor for the key event. This can be null, and is provided
##  only for convenience.
##  vtkRenderWindowInteractor * GetInteractor ( ) const ; *
##  Set the position of the mouse when the key was pressed.
##  void SetPosition ( const vtkVector2i & position ) { this -> Position = position ; } *
##  Get the position of the mouse when the key was pressed.
##  vtkVector2i GetPosition ( ) const { return this -> Position ; } char GetKeyCode ( ) const ; protected : vtkWeakPointer < vtkRenderWindowInteractor > Interactor ; vtkVector2i Position ; } ;
## Error: token expected: ; but got: [identifier]!!!
