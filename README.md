# Projekt_webbshopp_Systemintegration

_Beskrivning_
Detta projekt är en Java-applikation som används för att utföra olika SQL-frågor mot en databas som innehåller information om en webbshop. Applikationen använder JDBC (Java Database Connectivity) för att ansluta till databasen och utföra SQL-frågorna.

_Användning
Följ dessa steg för att använda och köra projektet:

Skapa en MySQL-databas: Innan du kör projektet måste du ha en MySQL-databas som innehåller tabeller för en webbshop. Du kan importera en fördefinierad databas eller skapa dina egna tabeller.
Se till att din databas är tillgänglig och att du har rätt behörighet att ansluta till den.

Ändra anslutningsinformation: Öppna filen WebbshopQueries.java och ändra följande rader med information som passar din databasanslutning:

java
Copy code
String url = "jdbc:mysql://localhost:3306/webbshop?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
String användarnamn = "root";
String lösenord = "DittLösenord";
Ersätt url, användarnamn och lösenord med rätt information för din MySQL-databas.

Kör applikationen: Kompilera och kör WebbshopQueries.java för att exekvera SQL-frågorna mot din databas.

Resultat: Projektet kommer att skriva ut resultaten av varje SQL-fråga i en tydlig tabellformat.
Du kommer att se kolumnnamnen och resultaten för varje fråga.

SQL-frågor:
Projektet inkluderar följande SQL-frågor som utförs mot databasen:

-Vilka kunder har köpt svarta byxor i storlek 38 av märket SweetPants?
-Lista antalet produkter per kategori.
-Skapa en kundlista med den totala summan pengar som varje kund har handlat för.
-Skriv ut en lista på det totala beställningsvärdet per ort där beställningsvärdet är större än 1000 kr.
-Skapa en topp-5 lista av de mest sålda produkterna.
-Vilken månad hade den största försäljningen?
-Ändra SQL-frågorna i WebbshopQueries.java om du vill utföra andra frågor mot din databas.

_Teknologi
Java
JDBC (Java Database Connectivity)
MySQL
Författare
Denna Java-applikation och README har skapats av Rana Alwan.

