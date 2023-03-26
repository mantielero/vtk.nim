when defined(VTKRENDERINGLOD_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGLOD_DEPRECATED):
  discard
when not defined(VTKRENDERINGLOD_DEPRECATED_EXPORT):
  const
    VTKRENDERINGLOD_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGLOD_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGLOD_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: