when defined(VTKIOENSIGHT_STATIC_DEFINE):
else:
when not defined(VTKIOENSIGHT_DEPRECATED):
  discard
when not defined(VTKIOENSIGHT_DEPRECATED_EXPORT):
  const
    VTKIOENSIGHT_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOENSIGHT_DEPRECATED_NO_EXPORT):
  const
    VTKIOENSIGHT_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: