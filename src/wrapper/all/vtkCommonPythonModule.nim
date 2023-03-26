when defined(VTKCOMMONPYTHON_STATIC_DEFINE):
else:
when not defined(VTKCOMMONPYTHON_DEPRECATED):
  discard
when not defined(VTKCOMMONPYTHON_DEPRECATED_EXPORT):
  const
    VTKCOMMONPYTHON_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKCOMMONPYTHON_DEPRECATED_NO_EXPORT):
  const
    VTKCOMMONPYTHON_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: