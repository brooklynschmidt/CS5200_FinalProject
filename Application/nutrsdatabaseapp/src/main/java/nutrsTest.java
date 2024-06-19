import java.time.Instant;
import java.util.Date;

public class nutrsTest {
    public static void main(String[] args) {
        MySqlNutrsAPI api = new MySqlNutrsAPI();
        api.connect("jdbc:mysql://localhost:3306/NUTRS?serverTimezone=EST5EDT",
                "NUTRS", "NUTRS");

        Meeting m = new Meeting(Date.from(Instant.now()), "Test stuff");

        api.createMeeting(m);
    }
}