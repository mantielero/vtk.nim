## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtView.h
##
## =========================================================================
## -------------------------------------------------------------------------
##   Copyright 2009 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkQtView
##  @brief   Superclass for Qt widget-based views.
##
##
##  This abstract superclass provides common api to integrate a Qt widget
##  into the VTK view framework. Not much here yet, but in the future there
##  could be methods around selection, event-handling, drag-and-drop, etc.
##
##

## !!!Ignored construct:  # vtkQtView_h [NewLine] # vtkQtView_h [NewLine] # vtkView.h [NewLine] # vtkViewsQtModule.h  For export macro [NewLine] # < QObject >  Needed to hook into Qt [NewLine] class VTKVIEWSQT_EXPORT vtkQtView : public QObject , public vtkView { Q_OBJECT public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkView Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkView :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQtView :: IsTypeOf ( type ) ; } static vtkQtView * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQtView * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQtView * NewInstance ( ) const { return vtkQtView :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkView :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtView :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtView :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get the main container of this view (a  QWidget).
##  The application typically places the view with a call
##  to GetWidget(): something like this
##  this->ui->box->layout()->addWidget(this->View->GetWidget());
##  virtual QWidget * GetWidget ( ) = 0 ; *
##  Calls QApplication::processEvents().  This is useful if you are using QWidgets
##  but have not called QApplication::exec because you don't want to give control
##  to the Qt event loop.  See also ProcessQtEventsNoUserEvents().
##  virtual void ProcessQtEvents ( ) ; *
##  Calls QApplication::processEvents(QEventLoop::ExcludeUserInputEvents).
##  See also ProcessQtEvents().
##  virtual void ProcessQtEventsNoUserInput ( ) ; *
##  Save an image.  Uses QPixmap::grab and QPixmap::save.  The image format will
##  be determined from the filename.  Qt's image format support may vary, usually
##  bmp, jpg, ppm, or png is a safe choice.  Returns false if there was a failure.
##  virtual bool SaveImage ( VTK_FILEPATH const char * fileName ) ; protected : vtkQtView ( ) ; ~ vtkQtView ( ) override ; private : vtkQtView ( const vtkQtView & ) = delete ; void operator = ( const vtkQtView & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkQtView.h
