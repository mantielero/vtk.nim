## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTemplateAliasMacro.h
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
##  @class   vtkTemplateAliasMacro
##  @brief   Dispatch a scalar processing template.
##
##  vtkTemplateAliasMacro is used in a switch statement to
##  automatically generate duplicate code for all enabled scalar types.
##  The code can be written to use VTK_TT to refer to the type, and
##  each case generated will define VTK_TT appropriately.  The
##  difference between this and the standard vtkTemplateMacro is that
##  this version will set VTK_TT to an "alias" for each type.  The
##  alias may be the same type or may be a different type that is the
##  same size/signedness.  This is sufficient when only the numerical
##  value associated with instances of the type is needed, and it
##  avoids unnecessary template instantiations.
##
##  Example usage:
##
##    void* p = dataArray->GetVoidPointer(0);
##    switch(dataArray->GetDataType())
##      {
##      vtkTemplateAliasMacro(vtkMyTemplateFunction(static_cast<VTK_TT*>(p)));
##      }
##

## !!!Ignored construct:  # vtkTemplateAliasMacro_h [NewLine] # vtkTemplateAliasMacro_h [NewLine] # vtkTypeTraits.h [NewLine]  Allow individual switching of support for each scalar size/signedness.
##  These could be made advanced user options to be configured by CMake. # VTK_USE_INT8 1 [NewLine] # VTK_USE_UINT8 1 [NewLine] # VTK_USE_INT16 1 [NewLine] # VTK_USE_UINT16 1 [NewLine] # VTK_USE_INT32 1 [NewLine] # VTK_USE_UINT32 1 [NewLine] # VTK_USE_INT64 1 [NewLine] # VTK_USE_UINT64 1 [NewLine] # VTK_USE_FLOAT32 1 [NewLine] # VTK_USE_FLOAT64 1 [NewLine] --------------------------------------------------------------------------  Define helper macros to switch types on and off. # vtkTemplateAliasMacroCase ( typeN , call ) vtkTemplateAliasMacroCase0 ( typeN , call , VTK_TYPE_SIZED_ ## typeN ) [NewLine] # vtkTemplateAliasMacroCase0 ( typeN , call , sized ) vtkTemplateAliasMacroCase1 ( typeN , call , sized ) [NewLine] # vtkTemplateAliasMacroCase1 ( typeN , call , sized ) vtkTemplateAliasMacroCase2 ( typeN , call , VTK_USE_ ## sized ) [NewLine] # vtkTemplateAliasMacroCase2 ( typeN , call , value ) vtkTemplateAliasMacroCase3 ( typeN , call , value ) [NewLine] # vtkTemplateAliasMacroCase3 ( typeN , call , value ) vtkTemplateAliasMacroCase_ ## value ( typeN , call ) [NewLine] # vtkTemplateAliasMacroCase_0 ( typeN , call ) case VTK_ ## typeN : { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkmsg <<  Support for VTK_ #  not compiled. ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayGenericWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) ; } ;
## Error: did not expect ##!!!

## !!!Ignored construct:  break [NewLine] # vtkTemplateAliasMacroCase_1 ( typeN , call ) case VTK_ ## typeN : { typedef vtkTypeTraits < VTK_TYPE_NAME_ ## typeN > :: SizedType VTK_TT ; call ; } ;
## Error: token expected: ; but got: [NewLine]!!!

## !!!Ignored construct:  break [NewLine]  Define a macro to dispatch calls to a template instantiated over
##  the aliased scalar types. # vtkTemplateAliasMacro ( call ) vtkTemplateAliasMacroCase ( DOUBLE , call ) ;
## Error: token expected: ; but got: [NewLine]!!!

vtkTemplateAliasMacroCase(FLOAT, call)
vtkTemplateAliasMacroCase(LONG_LONG, call)
vtkTemplateAliasMacroCase(UNSIGNED_LONG_LONG, call)
vtkTemplateAliasMacroCase(ID_TYPE, call)
vtkTemplateAliasMacroCase(LONG, call)
vtkTemplateAliasMacroCase(UNSIGNED_LONG, call)
vtkTemplateAliasMacroCase(INT, call)
vtkTemplateAliasMacroCase(UNSIGNED_INT, call)
vtkTemplateAliasMacroCase(SHORT, call)
vtkTemplateAliasMacroCase(UNSIGNED_SHORT, call)
vtkTemplateAliasMacroCase(CHAR, call)
vtkTemplateAliasMacroCase(SIGNED_CHAR, call)
## !!!Ignored construct:  vtkTemplateAliasMacroCase ( UNSIGNED_CHAR , call ) [NewLine] # [NewLine]  VTK-HeaderTest-Exclude: vtkTemplateAliasMacro.h
## Error: expected ';'!!!
