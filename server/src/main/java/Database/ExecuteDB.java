package Database;

import net.lemnik.eodsql.QueryTool;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class ExecuteDB {

    public static final String DISK_DB_URL = "jdbc:sqlite:";
    static File file = new File("Quotes.db");
    static String dbUrl = DISK_DB_URL + file ;
    static Connection connection = null;


    public ExecuteDB() throws SQLException {
            try {
                connection = DriverManager.getConnection(dbUrl);
            } catch (SQLException e) {
                e.printStackTrace();
            }
    }

    public static void createTables()  {

       
            try( final Statement stmt = connection.createStatement() ) {

                System.out.println("Creating Table...");
                String QuotesTable = "CREATE TABLE IF NOT EXISTS Quotes " +
                        "(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, " +
                        " text VARCHAR(255) NOT NULL, " +
                        " name VARCHAR(255) NOT NULL)";

                stmt.executeUpdate(QuotesTable);
                System.out.println("Table have been created successfully.");

            }catch(SQLException e ){
                System.err.println(e.getMessage());
            }
        
    }

    public static void  saveQuote(QuotesDO newQuote){
        final QuotesDAI quotesQuery = QueryTool.getQuery( connection, QuotesDAI.class );
        quotesQuery.addQuote(newQuote);
    }

//    public static void  removeQuote(int id){
//        final QuotesDAI quotesQuery = QueryTool.getQuery( connection, QuotesDAI.class );
//        quotesQuery.removeQuote(id);
//    }

    public static List<QuotesDO> getAllQuotes(){
        final QuotesDAI quotesQuery = QueryTool.getQuery( connection, QuotesDAI.class );
        return quotesQuery.getAllQuotes();
    }

    public static QuotesDO getQuoteById(int id){
        final QuotesDAI quotesQuery = QueryTool.getQuery( connection, QuotesDAI.class );
        return quotesQuery.getQuote(id);
    }

}
