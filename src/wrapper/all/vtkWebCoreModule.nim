when defined(VTKWEBCORE_STATIC_DEFINE):
else:
when not defined(VTKWEBCORE_DEPRECATED):
  discard
when not defined(VTKWEBCORE_DEPRECATED_EXPORT):
  const
    VTKWEBCORE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKWEBCORE_DEPRECATED_NO_EXPORT):
  const
    VTKWEBCORE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: