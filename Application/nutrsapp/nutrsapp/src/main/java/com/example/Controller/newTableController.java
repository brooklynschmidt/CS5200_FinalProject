package com.example.Controller;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class newTableController {
    @FXML
    private Button confirm;

    @FXML
    private TextField cgmInput;
    @FXML
    private TextField gameInput;
    @FXML
    private TextField numPlayersInput;

    private int meetingID;

    public newTableController(int _meetingID) {
        this.meetingID = _meetingID;
    }

    @FXML
    public void initialize() {
        confirm.setOnMouseClicked(
                e -> createNewTable(meetingID, cgmInput.getText(), gameInput.getText(), numPlayersInput.getText()));
    }

    private void createNewTable(int meetingID, String cgm, String game, String numPlayers) {
        // TODO: Call stored procedure
        Stage stage = (Stage) confirm.getScene().getWindow();
        stage.close();
    }
}
