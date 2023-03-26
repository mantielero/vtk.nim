when defined(VTKVIEWSQT_STATIC_DEFINE):
else:
when not defined(VTKVIEWSQT_DEPRECATED):
  discard
when not defined(VTKVIEWSQT_DEPRECATED_EXPORT):
  const
    VTKVIEWSQT_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKVIEWSQT_DEPRECATED_NO_EXPORT):
  const
    VTKVIEWSQT_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: