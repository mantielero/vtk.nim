when defined(VTKIOLAS_STATIC_DEFINE):
else:
when not defined(VTKIOLAS_DEPRECATED):
  discard
when not defined(VTKIOLAS_DEPRECATED_EXPORT):
  const
    VTKIOLAS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOLAS_DEPRECATED_NO_EXPORT):
  const
    VTKIOLAS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: