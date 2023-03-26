when defined(VTKIOVPIC_STATIC_DEFINE):
else:
when not defined(VTKIOVPIC_DEPRECATED):
  discard
when not defined(VTKIOVPIC_DEPRECATED_EXPORT):
  const
    VTKIOVPIC_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOVPIC_DEPRECATED_NO_EXPORT):
  const
    VTKIOVPIC_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: