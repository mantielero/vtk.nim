when defined(VTKIOPARALLELLSDYNA_STATIC_DEFINE):
else:
when not defined(VTKIOPARALLELLSDYNA_DEPRECATED):
  discard
when not defined(VTKIOPARALLELLSDYNA_DEPRECATED_EXPORT):
  const
    VTKIOPARALLELLSDYNA_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOPARALLELLSDYNA_DEPRECATED_NO_EXPORT):
  const
    VTKIOPARALLELLSDYNA_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: