package com.example.Model;

public class Game {
    private String name;
    private String publisher;
    private String system;
    private boolean physicalCopy;
    private boolean digitalCopy;

    public Game(String _name, String _publisher, String _system, boolean _physicalCopy, boolean _digitalCopy) {
        this.name = _name;
        this.publisher = _publisher;
        this.system = _system;
        this.physicalCopy = _physicalCopy;
        this.digitalCopy = _digitalCopy;
    }

    public String getName() {
        return name;
    }

    public String getPublisher() {
        return publisher;
    }

    public String getSystem() {
        return system;
    }

    public boolean getPhysical() {
        return physicalCopy;
    }

    public boolean getDigital() {
        return digitalCopy;
    }
}
