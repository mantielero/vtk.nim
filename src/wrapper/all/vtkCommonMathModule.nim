when defined(VTKCOMMONMATH_STATIC_DEFINE):
else:
when not defined(VTKCOMMONMATH_DEPRECATED):
  discard
when not defined(VTKCOMMONMATH_DEPRECATED_EXPORT):
  const
    VTKCOMMONMATH_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKCOMMONMATH_DEPRECATED_NO_EXPORT):
  const
    VTKCOMMONMATH_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: