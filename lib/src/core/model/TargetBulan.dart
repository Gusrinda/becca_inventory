class TargetBulan {
  final int target;
  final int terpenuhi;

//<editor-fold desc="Data Methods">
  const TargetBulan({
    required this.target,
    required this.terpenuhi,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TargetBulan &&
          runtimeType == other.runtimeType &&
          target == other.target &&
          terpenuhi == other.terpenuhi);

  @override
  int get hashCode => target.hashCode ^ terpenuhi.hashCode;

  @override
  String toString() {
    return 'TargetBulan{' +
        ' target: $target,' +
        ' terpenuhi: $terpenuhi,' +
        '}';
  }

  TargetBulan copyWith({
    int? target,
    int? terpenuhi,
  }) {
    return TargetBulan(
      target: target ?? this.target,
      terpenuhi: terpenuhi ?? this.terpenuhi,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'target': this.target,
      'terpenuhi': this.terpenuhi,
    };
  }

  factory TargetBulan.fromMap(Map<String, dynamic> map) {
    return TargetBulan(
      target: map['target'] as int,
      terpenuhi: map['terpenuhi'] as int,
    );
  }

//</editor-fold>
}
