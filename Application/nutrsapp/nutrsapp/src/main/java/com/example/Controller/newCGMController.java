package com.example.Controller;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class newCGMController {
    @FXML
    private TextField firstNameInput;

    @FXML
    private TextField lastNameInput;

    @FXML
    private TextField emailInput;

    @FXML
    private TextField discordInput;

    @FXML
    private TextField maxPlayersInput;

    @FXML
    private Button confirm;

    public MainController controller;

    public newCGMController(MainController _controller) {
        this.controller = _controller;
    }

    @FXML
    public void initialize() {
        confirm.setOnMouseClicked(e -> createNewCGM(firstNameInput.getText(), lastNameInput.getText(),
                emailInput.getText(), discordInput.getText(), maxPlayersInput.getText()));
    }

    private void createNewCGM(String firstName, String lastName, String email, String discord, String maxPlayers) {
        controller.callStoredProcedure("CALL add_cgm('" + firstName + "', '" + lastName + "', '" + email + "', '"
                + discord + "', " + maxPlayers + ")");
        controller.updateUI();
        Stage stage = (Stage) confirm.getScene().getWindow();
        stage.close();
    }
}
