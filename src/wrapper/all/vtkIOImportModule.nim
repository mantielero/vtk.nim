when defined(VTKIOIMPORT_STATIC_DEFINE):
else:
when not defined(VTKIOIMPORT_DEPRECATED):
  discard
when not defined(VTKIOIMPORT_DEPRECATED_EXPORT):
  const
    VTKIOIMPORT_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOIMPORT_DEPRECATED_NO_EXPORT):
  const
    VTKIOIMPORT_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: