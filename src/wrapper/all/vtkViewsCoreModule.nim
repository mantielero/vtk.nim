when defined(VTKVIEWSCORE_STATIC_DEFINE):
else:
when not defined(VTKVIEWSCORE_DEPRECATED):
  discard
when not defined(VTKVIEWSCORE_DEPRECATED_EXPORT):
  const
    VTKVIEWSCORE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKVIEWSCORE_DEPRECATED_NO_EXPORT):
  const
    VTKVIEWSCORE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: