when defined(VTKIOAMR_STATIC_DEFINE):
else:
when not defined(VTKIOAMR_DEPRECATED):
  discard
when not defined(VTKIOAMR_DEPRECATED_EXPORT):
  const
    VTKIOAMR_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOAMR_DEPRECATED_NO_EXPORT):
  const
    VTKIOAMR_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: