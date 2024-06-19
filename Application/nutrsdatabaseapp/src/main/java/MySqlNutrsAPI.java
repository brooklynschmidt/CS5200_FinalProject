import java.sql.*;

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