when defined(VTKRENDERINGVOLUMEAMR_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGVOLUMEAMR_DEPRECATED):
  discard
when not defined(VTKRENDERINGVOLUMEAMR_DEPRECATED_EXPORT):
  const
    VTKRENDERINGVOLUMEAMR_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGVOLUMEAMR_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGVOLUMEAMR_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: