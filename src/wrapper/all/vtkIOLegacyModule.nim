when defined(VTKIOLEGACY_STATIC_DEFINE):
else:
when not defined(VTKIOLEGACY_DEPRECATED):
  discard
when not defined(VTKIOLEGACY_DEPRECATED_EXPORT):
  const
    VTKIOLEGACY_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOLEGACY_DEPRECATED_NO_EXPORT):
  const
    VTKIOLEGACY_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: