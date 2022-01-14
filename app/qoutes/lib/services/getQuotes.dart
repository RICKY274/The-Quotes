import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qoutes/model/quotes.dart';
import 'dart:async';

import 'package:qoutes/utilities/constant.dart';

class QuoteServices {
  
  Future<List<Quote>> fetchQuotes() async {
    final response = await http.get(Uri.parse(quotesURL + "quotes"));

    if (response.statusCode == 200) {
      return parseQuotes(response.body);
    } else {
      throw Exception('Failed to load Quotes');
    }
  }

  List<Quote> parseQuotes(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Quote>((json) => Quote.fromJson(json)).toList();
  }

  Future<int> addQuotes(Quote quote) async {
    
    Map data = {"text": quote.text, "name": quote.author};

    final response = await http.post(Uri.parse(quotesURL + "quotes"),
        body: json.encode(data));


    return response.statusCode;
  }
}
