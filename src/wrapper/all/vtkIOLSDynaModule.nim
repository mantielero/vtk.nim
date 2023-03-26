when defined(VTKIOLSDYNA_STATIC_DEFINE):
else:
when not defined(VTKIOLSDYNA_DEPRECATED):
  discard
when not defined(VTKIOLSDYNA_DEPRECATED_EXPORT):
  const
    VTKIOLSDYNA_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOLSDYNA_DEPRECATED_NO_EXPORT):
  const
    VTKIOLSDYNA_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: