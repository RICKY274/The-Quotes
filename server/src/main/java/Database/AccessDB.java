package Database;
import Domain.QuotesDomain;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AccessDB implements  QuotesDB{

    private Map<Integer, QuotesDomain> quotes;
    ExecuteDB exc = new ExecuteDB();
  
    public AccessDB() throws SQLException {
        quotes = new HashMap<>();
        exc.createTables();
    }

    @Override
    public QuotesDomain get(Integer id) {

        quotes.put(ExecuteDB.getQuoteById(id).getQuoteID(),
                QuotesDomain.create(
                    exc.getQuoteById(id).getQuoteID(),
                    exc.getQuoteById(id).getQuoteText(),
                    exc.getQuoteById(id).getQuoteName()
                )
        );
        return quotes.get(id);
    }

//    @Override
//    public void remove(Integer id) {
//        exc.removeQuote(id);
//    }

    @Override
    public List<QuotesDomain> all() {
        exc.getAllQuotes().forEach(quote -> {
            quotes.put(quote.getQuoteID(),QuotesDomain.create(quote.getQuoteID(),quote.getQuoteText(), quote.getQuoteName()));
        });
        return new ArrayList<>(quotes.values());
    }

    @Override
    public QuotesDomain add(QuotesDomain quote) {
        QuotesDO newQuote = new QuotesDO(quote.getText(),quote.getName());
        exc.saveQuote(newQuote);
        return quote;
    }
}
