
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoutes/model/quoteModel.dart';
import 'package:qoutes/view/quoteDetails.dart';

class QuotesController {
 
  void saveQuote(context) {
    QuotesProvider model = Provider.of<QuotesProvider>(context,listen: false);
    model.addQuote();
  }

  void removeQuote(context,String quote) {
    QuotesProvider model = Provider.of<QuotesProvider>(context,listen: false);
    model.removeQuote(quote);
    Navigator.pop(context);
  }

  void navigator(context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void viewQuoteDetails(context, String quote, String author) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => QuoteDetails(
                text: quote,
                author: author,
              )),
    );
  }
}
