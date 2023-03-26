when defined(VTKIOPIO_STATIC_DEFINE):
else:
when not defined(VTKIOPIO_DEPRECATED):
  discard
when not defined(VTKIOPIO_DEPRECATED_EXPORT):
  const
    VTKIOPIO_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOPIO_DEPRECATED_NO_EXPORT):
  const
    VTKIOPIO_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: