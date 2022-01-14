import 'package:flutter/cupertino.dart';
import 'package:qoutes/model/quotes.dart';
import 'package:qoutes/services/getQuotes.dart';

enum HomeState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class QuotesProvider with ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  List<Quote> items = [];

  QuoteServices quoteServices = QuoteServices();

  TextEditingController quoteController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  HomeState get homeState => _homeState;

  QuotesProvider() {
    getQuotes(); // load quotes
  }

  void addQuote() {

    items.add(Quote(
        author: authorController.text,
        quoteId: items.length + 1,
        text: quoteController.text)
        );

   notifyListeners();
    quoteServices.addQuotes(Quote(
        author: authorController.text,
        quoteId: items.length + 1,
        text: quoteController.text));
    getQuotes(); // reload quotes again
    notifyListeners();
  }

  void removeQuote(String _qoute) {
    items.removeWhere((quote) => quote.text == _qoute);
    notifyListeners();
  }

  void clearController() {
    authorController.text = '';
    quoteController.text = '';
  }

  Future<void> getQuotes() async {
    _homeState = HomeState.Loading;
    try {
      final apiQuotes = await quoteServices.fetchQuotes();
      items = apiQuotes;
      _homeState = HomeState.Loaded;
    } catch (e) {
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }
}
