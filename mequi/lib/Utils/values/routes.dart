import 'package:flutter/cupertino.dart';
import 'package:mequi/Transactions/pages/pages.dart';

Map<String, WidgetBuilder> routes = {
  "/": (_) => const HomePage(),
  "transaction_sent": (_) => const TransactionSentPage()
};
