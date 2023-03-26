when defined(VTKIMAGINGMATH_STATIC_DEFINE):
else:
when not defined(VTKIMAGINGMATH_DEPRECATED):
  discard
when not defined(VTKIMAGINGMATH_DEPRECATED_EXPORT):
  const
    VTKIMAGINGMATH_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIMAGINGMATH_DEPRECATED_NO_EXPORT):
  const
    VTKIMAGINGMATH_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: