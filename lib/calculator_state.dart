class CalculatorState {
  CalculatorState({
    required this.stack,
    required this.history,
  });

  final List<num> stack;
  final List<List<num>> history;

  static CalculatorState empty() => CalculatorState(stack: [], history: []);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculatorState &&
          runtimeType == other.runtimeType &&
          stack == other.stack &&
          history == other.history;

  @override
  int get hashCode => stack.hashCode ^ history.hashCode;

  @override
  String toString() {
    return "{stack: $stack, history: $history}";
  }
}
