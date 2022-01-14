
class Quote {
  final int quoteId;
  final String text;
  final String author;

  Quote({
    required this.quoteId,
    required this.text,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quoteId: json['id'],
      text: json['text'],
      author: json['name'],
    );
  }
}

