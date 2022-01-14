import 'package:flutter/material.dart';
import 'package:qoutes/controller/qoutesController.dart';


class QuoteDetails extends StatefulWidget {
  final String text;
  final String author;
  QuoteDetails({required this.text, required this.author});
  createState() => _QuoteDetails();
}

class _QuoteDetails extends State<QuoteDetails> {
  QuotesController quoteController = QuotesController();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
          title: Text('Quote Details'), backgroundColor: Colors.blueGrey[800]),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey[900],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin:
                  EdgeInsets.only(bottom: 15, top: 100, left: 15, right: 15),
              padding:
                  EdgeInsets.only(bottom: 30, top: 30, left: 15, right: 15),
              color: Colors.blueGrey[800],
              alignment: Alignment.center,
              child: ListTile(
                title: RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 30,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\"",
                        style: TextStyle(color: Colors.grey, fontSize: 40),
                      ),
                      TextSpan(
                        text: widget.text,
                      ),
                      TextSpan(
                        text: "\"",
                        style: TextStyle(color: Colors.grey, fontSize: 40),
                      ),
                    ],
                  ),
                ),
                subtitle: Text("- " + widget.author,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.center),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 40.0, left: 30),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.amberAccent,
                              minimumSize: Size(120, 40),
                              shape: StadiumBorder()),
                          child: Text('Back'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 40.0, left: 80),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 1.0, color: Colors.amberAccent),
                              primary: Colors.amberAccent,
                              minimumSize: Size(120, 40),
                              shape: StadiumBorder()),
                          child: Text('Remove'),
                          onPressed: () {
                            quoteController.removeQuote(context, widget.text);
                         
                          },
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
