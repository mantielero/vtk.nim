when defined(VTKFILTERSPROGRAMMABLE_STATIC_DEFINE):
else:
when not defined(VTKFILTERSPROGRAMMABLE_DEPRECATED):
  discard
when not defined(VTKFILTERSPROGRAMMABLE_DEPRECATED_EXPORT):
  const
    VTKFILTERSPROGRAMMABLE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSPROGRAMMABLE_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSPROGRAMMABLE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: