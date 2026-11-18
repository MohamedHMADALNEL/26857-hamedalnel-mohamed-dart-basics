// Student: Mohamed Hamedalnel
// Reg no: 26857
const String regNo = '26857';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by MH
int momoFee(int amount) {
  // by MH
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String formatRwf(int amount) {
  // by MH

  bool isNegative = amount < 0;

  String digits = amount.abs().toString();

  String result = '';
  int i = 0;

  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      result += ',';
    }

    result += digits[i];
    i++;
  }

  if (isNegative) {
    result = '-$result';
  }

  return '$result RWF';
}

bool isValidPin(String pin) {
  // by MH

  if (pin.length != 5) {
    return false;
  }

  if (!RegExp(r'^[0-9]{5}$').hasMatch(pin)) {
    return false;
  }

  if (pin == '12345') {
    return false;
  }

  int i = 1;

  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      return true;
    }

    i++;
  }

  return false;
}

int sendMoney(int balance, int amount) {
  // by MH

  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by MH

  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime purchased: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

void main() {
  // by MH

  print('Reg no: $regNo | D = $d | T = $t');

  // Test PIN values
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  // Starting balance
  int balance = 20000 + t * 500;

  print(formatRwf(balance));

  // Send money three times
  int i = 1;

  while (i <= 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    i++;
  }

  // Buy airtime
  balance = buyAirtime(balance, 1000);

  // Invalid transaction
  balance = sendMoney(balance, 0);

  // Large transaction
  balance = sendMoney(balance, 200000);

  // Final balance
  print('Final balance: ${formatRwf(balance)}');

  // Additional tests
  print(formatRwf(1234567)); // Expected: 1,234,567 RWF
  print(formatRwf(-500000)); // Expected: -500,000 RWF
  print(formatRwf(1000000000)); // Expected: 1,000,000,000 RWF
  print(isValidPin('00001')); // Expected: true
  print(isValidPin('00000')); // Expected: false
  print(isValidPin('12 45')); // Expected: false
}
