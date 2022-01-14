package Database;

import net.lemnik.eodsql.BaseQuery;
import net.lemnik.eodsql.Select;
import net.lemnik.eodsql.Update;

import java.util.List;

public interface QuotesDAI extends BaseQuery {
    /** Create new Quote... */
    @Update(
            "INSERT INTO Quotes "+
                    " (text, name) " +
                    "VALUES (?{1.text}, ?{1.name})"
    )
    void addQuote( QuotesDO quotes);

    /** Get all quotes... */
    @Select(
            "SELECT id,text, name "+
                    " From Quotes"
    )
    List<QuotesDO> getAllQuotes();

    /** Get quote by id */
    @Select(
            "SELECT text, name"+
                    " From Quotes q" +
                    " WHERE  q.id= ?{1}"
    )
    QuotesDO getQuote(int id );

//    @Select(
//            "DELETE from Quotes q"+
//            "WHERE  q.id= ?{1}"
//    )
//    void  removeQuote(int id );

}
