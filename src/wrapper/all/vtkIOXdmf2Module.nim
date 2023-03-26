when defined(VTKIOXDMF2_STATIC_DEFINE):
else:
when not defined(VTKIOXDMF2_DEPRECATED):
  discard
when not defined(VTKIOXDMF2_DEPRECATED_EXPORT):
  const
    VTKIOXDMF2_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOXDMF2_DEPRECATED_NO_EXPORT):
  const
    VTKIOXDMF2_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: