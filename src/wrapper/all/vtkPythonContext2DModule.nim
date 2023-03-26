when defined(VTKPYTHONCONTEXT2D_STATIC_DEFINE):
else:
when not defined(VTKPYTHONCONTEXT2D_DEPRECATED):
  discard
when not defined(VTKPYTHONCONTEXT2D_DEPRECATED_EXPORT):
  const
    VTKPYTHONCONTEXT2D_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKPYTHONCONTEXT2D_DEPRECATED_NO_EXPORT):
  const
    VTKPYTHONCONTEXT2D_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: