when defined(VTKGUISUPPORTQT_STATIC_DEFINE):
else:
when not defined(VTKGUISUPPORTQT_DEPRECATED):
  discard
when not defined(VTKGUISUPPORTQT_DEPRECATED_EXPORT):
  const
    VTKGUISUPPORTQT_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKGUISUPPORTQT_DEPRECATED_NO_EXPORT):
  const
    VTKGUISUPPORTQT_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: