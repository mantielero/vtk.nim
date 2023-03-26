when defined(VTKIOODBC_STATIC_DEFINE):
else:
when not defined(VTKIOODBC_DEPRECATED):
  discard
when not defined(VTKIOODBC_DEPRECATED_EXPORT):
  const
    VTKIOODBC_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOODBC_DEPRECATED_NO_EXPORT):
  const
    VTKIOODBC_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: