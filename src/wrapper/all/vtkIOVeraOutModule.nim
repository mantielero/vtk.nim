when defined(VTKIOVERAOUT_STATIC_DEFINE):
else:
when not defined(VTKIOVERAOUT_DEPRECATED):
  discard
when not defined(VTKIOVERAOUT_DEPRECATED_EXPORT):
  const
    VTKIOVERAOUT_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOVERAOUT_DEPRECATED_NO_EXPORT):
  const
    VTKIOVERAOUT_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: