when defined(VTKRENDERINGFFMPEGOPENGL2_STATIC_DEFINE):
else:
when not defined(VTKRENDERINGFFMPEGOPENGL2_DEPRECATED):
  discard
when not defined(VTKRENDERINGFFMPEGOPENGL2_DEPRECATED_EXPORT):
  const
    VTKRENDERINGFFMPEGOPENGL2_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKRENDERINGFFMPEGOPENGL2_DEPRECATED_NO_EXPORT):
  const
    VTKRENDERINGFFMPEGOPENGL2_DEPRECATED_NO_EXPORT* = __attribute__(
        (__deprecated__))
when 0: