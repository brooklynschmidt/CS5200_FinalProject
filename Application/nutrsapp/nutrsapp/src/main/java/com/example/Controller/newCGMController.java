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

    @FXML
    public void initialize() {
        confirm.setOnMouseClicked(e -> createNewCGM(firstNameInput.getText(), lastNameInput.getText(),
                emailInput.getText(), discordInput.getText(), maxPlayersInput.getText()));
    }

    private void createNewCGM(String firstName, String lastName, String email, String discord, String maxPlayers) {
        // TODO: Call stored procedure
        Stage stage = (Stage) confirm.getScene().getWindow();
        stage.close();
    }
}
