package com.example.Model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Represents a NUTRS meeting
 **/
public class Meeting {
    private int id;
    private Date date;
    private String theme;

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    public Meeting(Date _date, String _theme) {
        this.id = -1;
        this.date = _date;
        this.theme = _theme;
    }

    public Meeting(int _id, Date _date, String _theme) {
        this.id = _id;
        this.date = _date;
        this.theme = _theme;
    }

    public int getID() {
        return this.id;
    }

    public Date getDate() {
        return this.date;
    }

    /***
     * @return The date of this meeting formatted as a string MySql will accept
     */
    public String getDateAsString() {
        return this.sdf.format(this.date);
    }

    public String getTheme() {
        return this.theme;
    }

}