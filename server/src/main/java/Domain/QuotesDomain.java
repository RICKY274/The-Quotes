package Domain;

public class QuotesDomain {

        private Integer id;
        private String text;
        private String name;

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }

        public String getText() {
            return text;
        }

        public void setText(String text) {
            this.text = text;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        /**
         * Use this convenient factory method to create a new quote.
         * Warning the ID will be null!
         * @param text the text of the quote
         * @param name the name of the person that said the text
         * @return a Quote object
         */
        public static QuotesDomain create(int id,String text, String name) {
            QuotesDomain quote = new QuotesDomain();
            quote.setId(id);
            quote.setText(text);
            quote.setName(name);
            return quote;
        }

}
