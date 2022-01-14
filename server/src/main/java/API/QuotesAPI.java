package API;
import io.javalin.Javalin;

public class QuotesAPI {

    private final Javalin server;

    public QuotesAPI() {
        server = Javalin.create(config -> {
            config.defaultContentType = "application/json";
        });
        this.server.get("/", context -> context.result("Welcome to QuteQuotes"));
        this.server.get("/quotes", context -> QuoteApiHandler.getAll(context));
        this.server.get("/quote/{id}", context -> QuoteApiHandler.getOne(context));
//        this.server.delete("/delete/{id}", context -> QuoteApiHandler.remove(context));
        this.server.post("/quotes", context -> QuoteApiHandler.create(context));
    }

    public Javalin start(int port) {
        return this.server.start(port);
    }

    public Javalin stop() {
        return this.server.stop();
    }

    public static void main(String[] args) {
        QuotesAPI apiServer = new QuotesAPI();
        apiServer.start(5050);
    }
}
