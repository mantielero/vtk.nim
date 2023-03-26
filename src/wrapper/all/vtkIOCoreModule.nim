when defined(VTKIOCORE_STATIC_DEFINE):
else:
when not defined(VTKIOCORE_DEPRECATED):
  discard
when not defined(VTKIOCORE_DEPRECATED_EXPORT):
  const
    VTKIOCORE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOCORE_DEPRECATED_NO_EXPORT):
  const
    VTKIOCORE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: