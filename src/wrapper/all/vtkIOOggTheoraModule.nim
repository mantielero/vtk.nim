when defined(VTKIOOGGTHEORA_STATIC_DEFINE):
else:
when not defined(VTKIOOGGTHEORA_DEPRECATED):
  discard
when not defined(VTKIOOGGTHEORA_DEPRECATED_EXPORT):
  const
    VTKIOOGGTHEORA_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOOGGTHEORA_DEPRECATED_NO_EXPORT):
  const
    VTKIOOGGTHEORA_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: