when defined(VTKIOHDF_STATIC_DEFINE):
else:
when not defined(VTKIOHDF_DEPRECATED):
  discard
when not defined(VTKIOHDF_DEPRECATED_EXPORT):
  const
    VTKIOHDF_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOHDF_DEPRECATED_NO_EXPORT):
  const
    VTKIOHDF_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: