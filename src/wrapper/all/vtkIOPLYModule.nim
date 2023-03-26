when defined(VTKIOPLY_STATIC_DEFINE):
else:
when not defined(VTKIOPLY_DEPRECATED):
  discard
when not defined(VTKIOPLY_DEPRECATED_EXPORT):
  const
    VTKIOPLY_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOPLY_DEPRECATED_NO_EXPORT):
  const
    VTKIOPLY_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: