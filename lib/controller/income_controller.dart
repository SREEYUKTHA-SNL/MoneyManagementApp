double  totalIncome  = 0;
double  totalBalance = 0;
double  totalExpense = 0;

Map<String, dynamic>? data;
List<Map<String, dynamic>> transactionlist = [];


void addincome({required Map<String, dynamic> income}) {
  transactionlist.add(income);
  totalIncome = totalIncome + income['amount'];
  totalBalance = totalBalance + income['amount'];
  print(transactionlist);
}
void addexpense({required Map<String, dynamic> expense}) {
  transactionlist.add(expense);
  totalBalance = totalBalance - expense['amount'];

  print(totalBalance);
  totalExpense = totalExpense + expense['amount'];
}
