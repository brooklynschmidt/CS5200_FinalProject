import java.sql.*;
import java.util.ArrayList;

public class MySqlNutrsAPI implements nutrsAPI {

    private Connection con;

    /***
     * Runs the given UPDATE INSERT or DELETE statment
     * 
     * @param sql The sql statement to run
     */
    private void updateRecord(String sql) {

        System.out.println(sql);

        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }

    /***
     * Reads from the CGM using the given statement
     * 
     * @param sql The querie to fetch cgms with
     * @return a list of cgms according to the given query
     */
    private ArrayList<CGM> fetchCgms(String sql) {
        ArrayList<CGM> cgms = new ArrayList<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("cgm_id");
                String firstName = rs.getString("cgm_first_name");
                String lastName = rs.getString("cgm_last_name");
                String email = rs.getString("cgm_email");
                String discord = rs.getString("cgm_discord_username");
                int maxPlayers = rs.getInt("max_players");

                CGM cgm = new CGM(id, firstName, lastName, email, discord, maxPlayers);
                cgms.add(cgm);
            }

            rs.close();
            stmt.close();
            return cgms;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<CGM> getAllCgms() {
        return fetchCgms("SELECT * FROM CGM");
    }

    public void createMeeting(Meeting meeting) {
        String sql = "";

        if (meeting.getID() == -1) {
            sql = "INSERT INTO meeting (meeting_date, meeting_theme) VALUES ("
                    + "'" + meeting.getDateAsString() + "',"
                    + "'" + meeting.getTheme() + "')";
        } else {
            sql = "INSERT INTO meeting (meeting_id, meeting_date, meeting_theme) VALUES ("
                    + meeting.getID() + ","
                    + "'" + meeting.getDateAsString() + "',"
                    + "'" + meeting.getTheme() + "')";
        }

        this.updateRecord(sql);
    }

    public void connect(String url, String user, String pw) {
        if (con == null) {
            try {
                con = DriverManager.getConnection(url, user, pw);
            } catch (SQLException e) {
                System.err.println(e.getMessage());
                System.exit(1);
            }
        }

    }

    public void close() {
        try {
            con.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
    }
}