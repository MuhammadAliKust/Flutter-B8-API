void main() {
  int sum = 0;
  for(int i = 1; i<=10; i++){
    sum = sum + i;
    print(sum);
  }
  print(sum);
  ///1+2+3+4+5+6+7+8+9+10
  ///
  ///
  /// Sum = 0; i = 1
  /// sum = 0 + 1 => 1
  ///
  /// Sum = 1; i = 2
  /// sum = 1 + 2 => 3
  ///
  /// Sum = 3; i = 3
  /// sum = 3 + 3 => 6
  ///
  /// Sum = 6; i = 4
  /// sum = 6 + 4 => 10
  ///
  /// Sum = 10; i = 5
  /// sum = 10 + 5 => 15
  ///
  /// Sum = 15; i = 6
  /// sum = 15 + 6 => 21
  ///
  /// Sum = 21; i = 7
  /// sum = 21 + 7 => 28
  ///
  /// Sum = 28; i = 8
  /// sum = 28 + 8 => 36
  ///
  /// Sum = 36; i = 9
  /// sum = 36 + 9 => 45
  ///
  /// Sum = 45; i = 10
  /// sum = 45 + 10 => 55
}
