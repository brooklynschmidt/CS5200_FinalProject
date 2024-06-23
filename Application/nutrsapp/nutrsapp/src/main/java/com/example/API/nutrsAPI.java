package com.example.API;

import java.util.ArrayList;

import com.example.Model.CGM;
import com.example.Model.Meeting;
import com.example.Model.Table;

public interface nutrsAPI {
    /**
     * Adds a new meeting to the database
     * 
     * @param meeting A Meeting object representing the meeting to be added
     **/
    public void createMeeting(Meeting meeting);

    /***
     * @return A list of all CGMs in the database
     */
    public ArrayList<CGM> getAllCgms();

    /***
     * @return A list of all Meetings in the database
     */
    public ArrayList<Meeting> getAllMeetings();

    /**
     * @param m the meeting to serach for tables in
     * @return A list of tables being run in the given meeting
     */
    public ArrayList<Table> getTablesInMeeting(Meeting m);

    void connect(String url, String user, String pw);

    void close();

}
