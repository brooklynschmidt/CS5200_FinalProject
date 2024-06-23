package com.example.Model;

public class Table {
    private String gameName;
    private String cgmName;
    private int numPlayers;
    private int maxPlayers;

    public Table(String _gameName, String _cgmName, int _numPlayers, int _maxPlayers) {
        this.gameName = _gameName;
        this.cgmName = _cgmName;
        this.numPlayers = _numPlayers;
        this.maxPlayers = _maxPlayers;
    }

    public String getGameName() {
        return gameName;
    }

    public String getCgmName() {
        return cgmName;
    }

    public int getNumPlayers() {
        return numPlayers;
    }

    public int getMaxPlaers() {
        return maxPlayers;
    }

    @Override
    public String toString() {
        return gameName + " run by " + cgmName + " with " + numPlayers + "/" + maxPlayers + " players";
    }
}
