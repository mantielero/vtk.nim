when defined(VTKIOCONVERGECFD_STATIC_DEFINE):
else:
when not defined(VTKIOCONVERGECFD_DEPRECATED):
  discard
when not defined(VTKIOCONVERGECFD_DEPRECATED_EXPORT):
  const
    VTKIOCONVERGECFD_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOCONVERGECFD_DEPRECATED_NO_EXPORT):
  const
    VTKIOCONVERGECFD_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: