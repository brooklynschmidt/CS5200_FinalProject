package com.example.API;

import java.util.ArrayList;
import java.sql.*;

import com.example.Model.CGM;
import com.example.Model.Game;
import com.example.Model.Meeting;
import com.example.Model.Table;

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

    private ArrayList<Meeting> fetchMeetings(String sql) {
        ArrayList<Meeting> meetings = new ArrayList<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("meeting_id");
                Date date = rs.getDate("meeting_date");
                String theme = rs.getString("meeting_theme");

                Meeting cgm = new Meeting(id, date, theme);
                meetings.add(cgm);
            }

            rs.close();
            stmt.close();
            return meetings;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    private ArrayList<Game> fetchGames(String sql) {
        ArrayList<Game> games = new ArrayList<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("game_name");
                String publisher = rs.getString("publisher_name");
                String system = rs.getString("system_name");
                boolean physical = rs.getBoolean("physical_copy");
                boolean digital = rs.getBoolean("digital_copy");

                Game cgm = new Game(name, publisher, system, physical, digital);
                games.add(cgm);
            }

            rs.close();
            stmt.close();
            return games;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    private ArrayList<Table> fetchTables(String sql) {
        ArrayList<Table> tables = new ArrayList<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String gameName = rs.getString("game_name");
                String cgmName = rs.getString("cgm_first_name") + " " + rs.getString("cgm_last_name");
                int numPlayers = rs.getInt("num_players");
                int maxPlayers = rs.getInt("max_players");

                Table table = new Table(gameName, cgmName, numPlayers, maxPlayers);
                tables.add(table);
            }

            rs.close();
            stmt.close();
            return tables;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public int getPlayersInMeeting(Meeting m) {
        String sql = "select sum(num_players) from nutrs_table join meeting using (meeting_id) where meeting_id = " + m.getID() + " group by meeting_id";
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            rs.next();
            int numPlayers =  rs.getInt("sum(num_players)");

            rs.close();
            stmt.close();
            return numPlayers;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
            return -1;
        }
    }

    public ArrayList<Table> getTablesInMeeting(Meeting m) {
        return fetchTables(
                "select * from nutrs_table join game using (game_id) join cgm using (cgm_id) where meeting_id ="
                        + m.getID());
    }

    public ArrayList<CGM> getAllCgms() {
        return fetchCgms("SELECT * FROM CGM");
    }

    public ArrayList<Meeting> getAllMeetings() {
        return fetchMeetings("SELECT * FROM meeting");
    }

    public ArrayList<Game> getAllGames() {
        return fetchGames("select * from game join publisher using (publisher_id) join nutrs_system using (system_id)");
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
