when defined(VTKIOGDAL_STATIC_DEFINE):
else:
when not defined(VTKIOGDAL_DEPRECATED):
  discard
when not defined(VTKIOGDAL_DEPRECATED_EXPORT):
  const
    VTKIOGDAL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOGDAL_DEPRECATED_NO_EXPORT):
  const
    VTKIOGDAL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: