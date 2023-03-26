when defined(VTKRENDERINGOPENXR_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGOPENXR_DEPRECATED):
  discard
when not defined(VTKRENDERINGOPENXR_DEPRECATED_EXPORT):
  const
    VTKRENDERINGOPENXR_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGOPENXR_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGOPENXR_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: