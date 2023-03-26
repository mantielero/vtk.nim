when defined(VTKFILTERSPYTHON_STATIC_DEFINE):
else:
when not defined(VTKFILTERSPYTHON_DEPRECATED):
  discard
when not defined(VTKFILTERSPYTHON_DEPRECATED_EXPORT):
  const
    VTKFILTERSPYTHON_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSPYTHON_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSPYTHON_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: