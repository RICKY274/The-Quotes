package Database;

import net.lemnik.eodsql.ResultColumn;

public class QuotesDO {

    @ResultColumn( value = "id" )
    public Integer id;
    @ResultColumn( value = "text" )
    public String text;
    @ResultColumn( value = "name" )
    public String name;

    public QuotesDO(){}

    public QuotesDO(String text,String name){
        this.name = name;
        this.text = text;
    }

    public QuotesDO(Integer id,String text,String name){
        this.id=id;
        this.name = name;
        this.text = text;
    }

    public String getQuoteName(){
        return this.name;
    }

    public String getQuoteText(){
        return this.text;
    }
    
    public Integer getQuoteID(){
        return this.id;
    }
}
