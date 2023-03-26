when defined(VTKINFOVISCORE_STATIC_DEFINE):
else:
when not defined(VTKINFOVISCORE_DEPRECATED):
  discard
when not defined(VTKINFOVISCORE_DEPRECATED_EXPORT):
  const
    VTKINFOVISCORE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKINFOVISCORE_DEPRECATED_NO_EXPORT):
  const
    VTKINFOVISCORE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: