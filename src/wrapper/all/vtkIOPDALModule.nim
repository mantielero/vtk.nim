when defined(VTKIOPDAL_STATIC_DEFINE):
else:
when not defined(VTKIOPDAL_DEPRECATED):
  discard
when not defined(VTKIOPDAL_DEPRECATED_EXPORT):
  const
    VTKIOPDAL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOPDAL_DEPRECATED_NO_EXPORT):
  const
    VTKIOPDAL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: