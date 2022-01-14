import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoutes/controller/qoutesController.dart';
import 'package:qoutes/model/quoteModel.dart';


class AddQuote extends StatefulWidget {
  createState() => _AddQuote();
}

class _AddQuote extends State<AddQuote> {
  QuotesController quoteController = QuotesController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool isAdd = true;

  @override
  Widget build(BuildContext context) {
    QuotesProvider model = Provider.of<QuotesProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('Add Quote'), backgroundColor: Colors.blueGrey[800]),
      body: Container(
        color: Colors.blueGrey[900],
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 20),
                    child: TextFormField(
                      controller: model.authorController,
                      style:
                          TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.amberAccent, width: 0.0),
                        ),
                        border: OutlineInputBorder(),
                        labelText: "Add Author",
                        labelStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.amberAccent, width: 2.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Author field can't be empty.";
                        }
                        return null;
                      },
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                child: TextFormField(
                  controller: model.quoteController,
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
                  keyboardType: TextInputType.multiline,
                  minLines: 2,
                  maxLines: 6,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.amberAccent, width: 0.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Add Quote",
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold
                        ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.amberAccent, width: 2.0),
                    ),
                  ),
                    validator: (value) {
                        if (value!.isEmpty) {
                          return "Quote field can't be empty.";
                        }
                        return null;
                      },
                ),
              ),
                ],
              ),
            ),

            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 40.0, right: 30, left: 30),
                    child: Row(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 1.0, color: Colors.amberAccent),
                              primary: Colors.white,
                              backgroundColor: Colors.amberAccent,
                              minimumSize: Size(120, 40),
                              shape: StadiumBorder()),
                          child: isAdd
                              ? Text('Add')
                              : CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  backgroundColor: Colors.white,
                                ),
                          onPressed: () {
                            if (!_formkey.currentState!.validate()){
                              return;
                            }
                            quoteController.saveQuote(context);

                            quoteController.viewQuoteDetails(
                                context,
                                model.quoteController.text,
                                model.authorController.text);

                            model.clearController();
                          },
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 1.0, color: Colors.amberAccent),
                              primary: Colors.amberAccent,
                              minimumSize: Size(120, 40),
                              shape: StadiumBorder()),
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
