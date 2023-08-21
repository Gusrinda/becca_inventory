enum ToastType { ok, error }

class ToastData {
  final ToastType type;
  final String message;

  const ToastData({required this.type, required this.message});

  factory ToastData.ok(String message) =>
      ToastData(type: ToastType.ok, message: message);

  factory ToastData.error(String message) =>
      ToastData(type: ToastType.error, message: message);
}
