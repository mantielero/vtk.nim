when defined(VTKIOSEGY_STATIC_DEFINE):
else:
when not defined(VTKIOSEGY_DEPRECATED):
  discard
when not defined(VTKIOSEGY_DEPRECATED_EXPORT):
  const
    VTKIOSEGY_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOSEGY_DEPRECATED_NO_EXPORT):
  const
    VTKIOSEGY_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: