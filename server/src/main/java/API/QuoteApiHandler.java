package API;

import Database.AccessDB;
import Database.QuotesDB;
import Domain.QuotesDomain;
import io.javalin.http.Context;
import io.javalin.http.HttpCode;
import io.javalin.http.NotFoundResponse;

import java.sql.SQLException;


public class QuoteApiHandler {
    private static QuotesDB database = null;

    static {
        try {
            database = new AccessDB();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Get all quotes
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public static void getAll(Context context) {
        context.json(database.all());
    }

    /**
     * Get one quote
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public static void getOne(Context context) {
        Integer id = context.pathParamAsClass("id", Integer.class).get();
        QuotesDomain quote = database.get(id);
        if (quote == null) {
            throw new NotFoundResponse("Quote not found: " + id);
        }
        context.json(quote);
    }

    /**
     * Delete one quote
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
//    public static void remove(Context context) {
//        Integer id = context.pathParamAsClass("id", Integer.class).get();
//       database.remove(id);
//        context.json(id);
//    }

    /**
     * Create a new quote
     *
     * @param context The Javalin Context for the HTTP POST Request
     */
    public static void create(Context context) {
        QuotesDomain quote = context.bodyAsClass(QuotesDomain.class);
        QuotesDomain newQuote = database.add(quote);
        context.header("Location", "/quote/" + newQuote.getId());
        context.status(HttpCode.CREATED);
        context.json(newQuote);
    }
}
