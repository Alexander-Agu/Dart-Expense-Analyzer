import 'dart:io';

void main(List<String> args) {
  print("Please enter your daily expenses: like so ~ 50, 60, 1, 70...");

  List<int>? captured_Expenses = GetInput();

  if (captured_Expenses == null) {
    print("Please enter valid numbers / expenses");
  } else if (captured_Expenses.length <= 0) {
    print("Please input at least 1 expense");
  } else {
    int totalSpent = TotalExpense(captured_Expenses);
    int highestEx = GetHighestExpense(captured_Expenses);
    int avarage = CalcAvarage(captured_Expenses);

    print("Total spent: R$totalSpent");
    print("Highest expense: R$highestEx");
    print("Average expense: R$avarage");
    print("");

    DisplayExpenses(captured_Expenses, avarage);
  }
}

List<int>? GetInput() {
  String expense = stdin.readLineSync()!;
  List<int>? expenses = [];

  try {
    for (String num in expense.split(",")) {
      expenses.add(int.parse(num.trim()));
    }
  } catch (e) {
    expenses = null;
  }
  return expenses;
}

int TotalExpense(List<int> expenses) {
  int num = 0;
  for (int n in expenses) {
    num += n;
  }

  return num;
}

int GetHighestExpense(List<int> expenses) {
  List<int>? expensess = [...expenses];
  expensess.sort();

  return expensess.last;
}

int CalcAvarage(List<int> expenses) {
  int total = 0;

  for (int n in expenses) {
    total += n;
  }

  return total ~/ expenses.length;
}

DisplayExpenses(List<int> expenses, int average) {
  int count = 1;
  for (int n in expenses) {
    if (n > average) {
      print("Day $count: R$n - ABOVE average");
    } else {
      print("Day $count: R$n - BELOW average");
    }

    ++count;
  }
}
