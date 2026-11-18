// Student: Mohamed Hamedalnel
// Reg no: 26857
const String regNo = '26857';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by MH
int countVowels(String text) {
  // by MH
  String lowerText = text.toLowerCase();

  int count = 0;
  int i = 0;

  while (i < lowerText.length) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
    i++;
  }

  return count;
}

String initials(String fullName) {
  // by MH

  String cleanedName = fullName.trim();

  if (cleanedName.isEmpty) {
    return '';
  }

  List<String> names = cleanedName.split(RegExp(r'\s+'));

  String result = '';

  for (String name in names) {
    result += '${name[0].toUpperCase()}.';
  }

  return result;
}

void drawTriangle(int height) {
  // by MH
  if (height <= 0) {
    return;
  }

  int row = 1;

  while (row <= height) {
    String symbol = row.isEven ? '#' : '*';

    String spaces = ' ' * (height - row);
    String characters = symbol * row;

    print(spaces + characters);

    row++;
  }
}

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

String maskPhone(String phone) {
  // by MH

  if (phone.length != 10) {
    return 'INVALID';
  }

  String masked = phone.substring(0, 3);

  int i = 0;

  while (i < phone.length - 5) {
    masked += '*';
    i++;
  }

  masked += phone.substring(phone.length - 2);

  return masked;
}

void main() {
  // by MH
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'Mohamed Hamedalnel';

  int result = countVowels(fullName);

  print('$fullName has $result vowels');
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));
  drawTriangle(d + 3);

  drawTriangle(0);
  drawTriangle(-2);

  int i = 1;
  int totalFees = 0;
  String phone = '0788123456';

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;

    int fee = momoFee(amount);

    totalFees += fee;

    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');

    i++;
  }

  print('Total fees: $totalFees RWF');
}
