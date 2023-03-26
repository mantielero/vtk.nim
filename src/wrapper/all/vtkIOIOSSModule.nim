when defined(VTKIOIOSS_STATIC_DEFINE):
else:
when not defined(VTKIOIOSS_DEPRECATED):
  discard
when not defined(VTKIOIOSS_DEPRECATED_EXPORT):
  const
    VTKIOIOSS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOIOSS_DEPRECATED_NO_EXPORT):
  const
    VTKIOIOSS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: