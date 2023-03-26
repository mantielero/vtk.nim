## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    QVTKOpenGLStereoWidget.h
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

## !!!Ignored construct:  # QVTKOpenGLStereoWidget_h [NewLine] # QVTKOpenGLStereoWidget_h [NewLine] # vtkGUISupportQtModule.h  For export macro # < QWidget > [NewLine] # QVTKOpenGLWindow.h  needed for ivar # < QPointer >  needed for ivar [NewLine]  Forward Qt class declarations class QSurfaceFormat ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of QOpenGLContext"
discard "forward decl of QVTKInteractorAdapter"
discard "forward decl of QVTKOpenGLWindow"
discard "forward decl of vtkGenericOpenGLRenderWindow"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkRenderWindowInteractor"
## !!!Ignored construct:  class VTKGUISUPPORTQT_EXPORT QVTKOpenGLStereoWidget : public QWidget { Q_OBJECT typedef QWidget Superclass ; public : QVTKOpenGLStereoWidget ( QWidget * parent = nullptr , Qt :: WindowFlags f = Qt :: WindowFlags ( ) ) ; QVTKOpenGLStereoWidget ( QOpenGLContext * shareContext , QWidget * parent = nullptr , Qt :: WindowFlags f = Qt :: WindowFlags ( ) ) ; QVTKOpenGLStereoWidget ( vtkGenericOpenGLRenderWindow * w , QWidget * parent = nullptr , Qt :: WindowFlags f = Qt :: WindowFlags ( ) ) ; QVTKOpenGLStereoWidget ( vtkGenericOpenGLRenderWindow * w , QOpenGLContext * shareContext , QWidget * parent = nullptr , Qt :: WindowFlags f = Qt :: WindowFlags ( ) ) ; ~ QVTKOpenGLStereoWidget ( ) override ; /@{ *
##  @copydoc QVTKOpenGLWindow::setRenderWindow()
##  void setRenderWindow ( vtkGenericOpenGLRenderWindow * win ) { this -> VTKOpenGLWindow -> setRenderWindow ( win ) ; } void setRenderWindow ( vtkRenderWindow * win ) { this -> VTKOpenGLWindow -> setRenderWindow ( win ) ; } /@} *
##  @copydoc QVTKOpenGLWindow::renderWindow()
##  vtkRenderWindow * renderWindow ( ) const { return this -> VTKOpenGLWindow -> renderWindow ( ) ; } *
##  @copydoc QVTKOpenGLWindow::interactor()
##  QVTKInteractor * interactor ( ) const { return this -> VTKOpenGLWindow -> interactor ( ) ; } *
##  @copydoc QVTKRenderWindowAdapter::defaultFormat(bool)
##  static QSurfaceFormat defaultFormat ( bool stereo_capable = false ) { return QVTKOpenGLWindow :: defaultFormat ( stereo_capable ) ; } *
##  @copydoc QVTKOpenGLWindow::setEnableHiDPI()
##  void setEnableHiDPI ( bool enable ) { this -> VTKOpenGLWindow -> setEnableHiDPI ( enable ) ; } bool enableHiDPI ( ) const { return this -> VTKOpenGLWindow -> enableHiDPI ( ) ; } /@{ *
##  Set/Get unscaled DPI value. Defaults to 72, which is also the default value
##  in vtkWindow.
##  void setUnscaledDPI ( int dpi ) { this -> VTKOpenGLWindow -> setUnscaledDPI ( dpi ) ; } int unscaledDPI ( ) const { return this -> VTKOpenGLWindow -> unscaledDPI ( ) ; } /@} /@{ *
##  Set/Get a custom device pixel ratio to use to map Qt sizes to VTK (or
##  OpenGL) sizes. Thus, when the QWidget is resized, it called
##  `vtkRenderWindow::SetSize` on the internal vtkRenderWindow after
##  multiplying the QWidget's size by this scale factor.
##
##  By default, this is set to 0. Which means that `devicePixelRatio` obtained
##  from Qt will be used. Set this to a number greater than 0 to override this
##  behaviour and use the custom scale factor instead.
##
##  `effectiveDevicePixelRatio` can be used to obtain the device-pixel-ratio
##  that will be used given the value for customDevicePixelRatio.
##  void setCustomDevicePixelRatio ( double cdpr ) { this -> VTKOpenGLWindow -> setCustomDevicePixelRatio ( cdpr ) ; } ; double customDevicePixelRatio ( ) const { return this -> VTKOpenGLWindow -> customDevicePixelRatio ( ) ; } ; double effectiveDevicePixelRatio ( ) const { return this -> VTKOpenGLWindow -> effectiveDevicePixelRatio ( ) ; } ; /@} /@{ *
##  @copydoc QVTKOpenGLWindow::setDefaultCursor()
##  void setDefaultCursor ( const QCursor & cursor ) { this -> VTKOpenGLWindow -> setDefaultCursor ( cursor ) ; } const QCursor & defaultCursor ( ) const { return this -> VTKOpenGLWindow -> defaultCursor ( ) ; } /@} *
##  Returns true if the internal QOpenGLWindow's is valid, i.e. if OpenGL
##  resources, like the context, have been successfully initialized.
##  bool isValid ( ) { return this -> VTKOpenGLWindow -> isValid ( ) ; } *
##  Expose internal QVTKOpenGLWindow::grabFramebuffer(). Renders and returns
##  a 32-bit RGB image of the framebuffer.
##  QImage grabFramebuffer ( ) ; *
##  Returns the embedded QVTKOpenGLWindow.
##  QVTKOpenGLWindow * embeddedOpenGLWindow ( ) const { return this -> VTKOpenGLWindow ; } *
##  Sets the requested surface format.
##
##  When the format is not explicitly set via this function, the format
##  returned by QSurfaceFormat::defaultFormat() will be used. This means that
##  when having multiple OpenGL widgets, individual calls to this function can
##  be replaced by one single call to QSurfaceFormat::setDefaultFormat() before
##  creating the first widget.
##  void setFormat ( const QSurfaceFormat & fmt ) { this -> VTKOpenGLWindow -> setFormat ( fmt ) ; } *
##  Returns the context and surface format used by this widget and its toplevel window.
##  QSurfaceFormat format ( ) const { return this -> VTKOpenGLWindow -> format ( ) ; } protected : void resizeEvent ( QResizeEvent * evt ) override ; void paintEvent ( QPaintEvent * evt ) override ; private : QPointer < QVTKOpenGLWindow > VTKOpenGLWindow ; } ;
## Error: token expected: ; but got: [identifier]!!!
