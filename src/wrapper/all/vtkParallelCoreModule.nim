when defined(VTKPARALLELCORE_STATIC_DEFINE):
else:
when not defined(VTKPARALLELCORE_DEPRECATED):
  discard
when not defined(VTKPARALLELCORE_DEPRECATED_EXPORT):
  const
    VTKPARALLELCORE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKPARALLELCORE_DEPRECATED_NO_EXPORT):
  const
    VTKPARALLELCORE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: