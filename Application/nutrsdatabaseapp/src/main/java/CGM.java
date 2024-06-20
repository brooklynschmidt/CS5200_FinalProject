public class CGM {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String discord;
    private int maxPlayers;

    public CGM(int _id, String _firstname, String _lastName, String _email, String _discord, int _maxPlayers) {
        this.id = _id; 
        this.firstName = _firstname;
        this.lastName = _lastName;
        this.email = _email;
        this.discord = _discord;
        this.maxPlayers = _maxPlayers;
    }

    @Override
    public String toString() {
        return this.firstName + " " + this.lastName;
    }
}
