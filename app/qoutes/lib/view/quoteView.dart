import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoutes/model/quoteModel.dart';
import 'package:qoutes/controller/qoutesController.dart';
import 'package:qoutes/view/addQuote.dart';
import 'package:qoutes/view/quoteDetails.dart';

class QuoteView extends StatefulWidget {
  const QuoteView({Key? key}) : super(key: key);
  createState() => _QuoteView();
}

class _QuoteView extends State<QuoteView> {
  QuotesController quoteController = QuotesController();
  @override
  Widget build(BuildContext context) {
    QuotesProvider model = Provider.of<QuotesProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('QuteQuotes'), backgroundColor: Colors.blueGrey.shade800),
      body: Builder(builder: (context) {
        if (model.homeState == HomeState.Loading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Loading Quotes ....")
              ],
            ),
          );
        } else if (model.homeState == HomeState.Error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Opps! Error loading quotes"),
                SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.amberAccent),
                      primary: Colors.amberAccent,
                      minimumSize: Size(120, 40),
                      shape: StadiumBorder()),
                  child: Text('Reload'),
                  onPressed: () async {
                    model.getQuotes();
                  },
                )
              ],
            ),
          );
        }

        final quotes = model.items;

        return Scaffold(
          body: ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (BuildContext context, index) {
              final quote = quotes[index];
              return Container(
                margin: const EdgeInsets.all(10),
                color: Colors.blueGrey,
                child: ListTile(
                  tileColor: Colors.white12,
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(quote.text),
                  onTap: () {
                    quoteController.navigator(
                        context,
                        QuoteDetails(
                          text: quote.text,
                          author: quote.author,
                        ));
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                quoteController.navigator(context, AddQuote());
              },
              label: const Text('Add Quote',
                  style: TextStyle(color: Colors.white)),
              icon: const Icon(Icons.add, color: Colors.white),
              backgroundColor: Colors.amberAccent),
        );
      }),
    );
  }
}
