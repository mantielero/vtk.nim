when defined(VTKRENDERINGQT_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGQT_DEPRECATED):
  discard
when not defined(VTKRENDERINGQT_DEPRECATED_EXPORT):
  const
    VTKRENDERINGQT_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGQT_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGQT_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: