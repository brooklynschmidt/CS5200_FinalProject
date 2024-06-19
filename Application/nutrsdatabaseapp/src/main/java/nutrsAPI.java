public interface nutrsAPI {
    /**
    * Adds a new meeting to the database
    * @param meeting A Meeting object representing the meeting to be added
    **/
    public void createMeeting(Meeting meeting);

    void connect(String url, String user, String pw);
    void close();

}