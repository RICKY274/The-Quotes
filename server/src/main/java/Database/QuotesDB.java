package Database;

import Domain.QuotesDomain;
import java.util.List;

public interface QuotesDB {
    /**
     * Get a single quote by id.
     * @param id the Id of the quote
     * @return a Quote
     */
    QuotesDomain get(Integer id);

    /**
     * Get a single quote by id.
     * @param id the Id of the quote
     * @return a Quote
     */
//    void remove(Integer id);

    /**
     * Get all quotes in the database
     * @return A list of quotes
     */
    List<QuotesDomain> all();

    /**
     * Add a single quote to the database.
     * @param quote the quote to add
     * @return the newly added Quote
     */
    QuotesDomain add(QuotesDomain quote);
}
