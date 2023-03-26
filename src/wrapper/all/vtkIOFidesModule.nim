when defined(VTKIOFIDES_STATIC_DEFINE):
else:
when not defined(VTKIOFIDES_DEPRECATED):
  discard
when not defined(VTKIOFIDES_DEPRECATED_EXPORT):
  const
    VTKIOFIDES_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOFIDES_DEPRECATED_NO_EXPORT):
  const
    VTKIOFIDES_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: