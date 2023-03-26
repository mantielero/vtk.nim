when defined(VTKIOTRUCHAS_STATIC_DEFINE):
else:
when not defined(VTKIOTRUCHAS_DEPRECATED):
  discard
when not defined(VTKIOTRUCHAS_DEPRECATED_EXPORT):
  const
    VTKIOTRUCHAS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOTRUCHAS_DEPRECATED_NO_EXPORT):
  const
    VTKIOTRUCHAS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: