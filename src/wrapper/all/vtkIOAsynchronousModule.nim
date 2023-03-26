when defined(VTKIOASYNCHRONOUS_STATIC_DEFINE):
else:
when not defined(VTKIOASYNCHRONOUS_DEPRECATED):
  discard
when not defined(VTKIOASYNCHRONOUS_DEPRECATED_EXPORT):
  const
    VTKIOASYNCHRONOUS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOASYNCHRONOUS_DEPRECATED_NO_EXPORT):
  const
    VTKIOASYNCHRONOUS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: