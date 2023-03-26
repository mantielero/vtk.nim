when defined(VTKJAVA_STATIC_DEFINE):
else:
when not defined(VTKJAVA_DEPRECATED):
  discard
when not defined(VTKJAVA_DEPRECATED_EXPORT):
  const
    VTKJAVA_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKJAVA_DEPRECATED_NO_EXPORT):
  const
    VTKJAVA_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: