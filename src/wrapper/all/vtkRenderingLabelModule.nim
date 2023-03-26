when defined(VTKRENDERINGLABEL_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGLABEL_DEPRECATED):
  discard
when not defined(VTKRENDERINGLABEL_DEPRECATED_EXPORT):
  const
    VTKRENDERINGLABEL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGLABEL_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGLABEL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: