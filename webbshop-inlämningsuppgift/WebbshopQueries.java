import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class WebbshopQueries {
    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/webbshop?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true",
                "root",
                "Ranaalwan2201")) {

            // 1. Vilka kunder har köpt svarta byxor i storlek 38 av märket SweetPants?
            executeQuery(connection,
                    "SELECT  kunder.namn " +
                            "FROM beställningar " +
                            "INNER JOIN kunder ON kunder.id = beställningar.kundid " +
                            "INNER JOIN orderdetaljer ON beställningar.id = orderdetaljer.beställningid " +
                            "INNER JOIN produkter ON orderdetaljer.produktid = produkter.id " +
                            "WHERE (produkter.färg = 'svart' and produkter.Storlek = 38 AND produkter.Märke = 'SweetPants')");

            // 2. Lista antalet produkter per kategori.
            executeQuery(connection,
                    "SELECT kategorier.Namn AS Kategori, COUNT(produkter.id) AS Antal_Produkter " +
                            "FROM kategorier " +
                            "LEFT JOIN producktkategorier ON kategorier.id = producktkategorier.kategoriid " +
                            "LEFT JOIN produkter ON producktkategorier.produktid = produkter.id " +
                            "GROUP BY Kategori");

            // 3. Skapa en kundlista med den totala summan pengar som varje kund har handlat för.
            executeQuery(connection,
                    "SELECT kunder.namn AS Kundens_Namn, SUM(produkter.pris * orderdetaljer.antal) AS Totalt_Värde " +
                            "FROM kunder " +
                            "LEFT JOIN beställningar ON kunder.id = beställningar.kundid " +
                            "LEFT JOIN orderdetaljer ON beställningar.id = orderdetaljer.beställningid " +
                            "LEFT JOIN produkter ON orderdetaljer.produktid = produkter.id " +
                            "GROUP BY Kundens_Namn");

            // 4. Skriv ut en lista på det totala beställningsvärdet per ort där beställningsvärdet är större än 1000 kr.
            executeQuery(connection,
                    "SELECT kunder.addres AS Ort, SUM(produkter.pris * orderdetaljer.antal) AS Totalt_Värde " +
                            "FROM kunder " +
                            "LEFT JOIN beställningar ON kunder.id = beställningar.kundid " +
                            "LEFT JOIN orderdetaljer ON beställningar.id = orderdetaljer.beställningid " +
                            "LEFT JOIN produkter ON orderdetaljer.produktid = produkter.id " +
                            "GROUP BY Ort " +
                            "HAVING Totalt_Värde > 1000");

            // 5. Skapa en topp-5 lista av de mest sålda produkterna.
            executeQuery(connection,
                    "SELECT produkter.namn AS Produkt_Namn, SUM(orderdetaljer.antal) AS Totalt_Antal_Sålda " +
                            "FROM produkter " +
                            "INNER JOIN orderdetaljer ON produkter.id = orderdetaljer.produktid " +
                            "GROUP BY Produkt_Namn " +
                            "ORDER BY Totalt_Antal_Sålda DESC " +
                            "LIMIT 5");

            // 6. Vilken månad hade den största försäljningen?
            executeQuery(connection,
                    "SELECT MONTH(datum) AS Månad, SUM(produkter.pris * orderdetaljer.antal) AS Totalt_Försäljningsvärde " +
                            "FROM beställningar " +
                            "INNER JOIN kunder ON kunder.id = beställningar.kundid " +
                            "INNER JOIN orderdetaljer ON orderdetaljer.beställningid = beställningar.id " +
                            "INNER JOIN produkter ON orderdetaljer.produktid = produkter.id " +
                            "GROUP BY Månad " +
                            "ORDER BY Totalt_Försäljningsvärde DESC " +
                            "LIMIT 1");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Metod för att exekvera en SQL-fråga och skriva ut resultatet ..
    private static void executeQuery(Connection connection, String query) throws SQLException {
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();

            System.out.println("Resultat för fråga:");
            //System.out.println(query);
            System.out.println("----------------------------------------------------------");

            // Skriv ut kolumnnamnen
            for (int i = 1 ; i <= columnCount; i++) {
                System.out.print( metaData.getColumnLabel(i)+  "    " + "  \t");
            }
            System.out.println();


            while (resultSet.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    System.out.print(resultSet.getString(i)+ "         "   + "\t");
                }
                System.out.println();
            }

            System.out.println();
        }
    }
}
