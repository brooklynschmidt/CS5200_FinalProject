package com.example.Controller;

import com.example.API.MySqlNutrsAPI;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class newTableController {
    @FXML
    private Button confirm;

    @FXML
    private TextField cgmFirstNameInput;
    @FXML
    private TextField cgmLastNameInput;
    @FXML
    private TextField gameInput;
    @FXML
    private TextField numPlayersInput;

    private int meetingID;

    private MainController controller;

    public newTableController(int _meetingID, MainController _controller) {
        this.meetingID = _meetingID;
        this.controller = _controller;
    }

    @FXML
    public void initialize() {
        confirm.setOnMouseClicked(
                e -> createNewTable(meetingID,
                        cgmFirstNameInput.getText(),
                        cgmLastNameInput.getText(), gameInput.getText(), numPlayersInput.getText()));
    }

    private void createNewTable(int meetingID, String firstName, String lastName, String game, String numPlayers) {

        int cgmId = controller.getCGMID(firstName, lastName);

        if (cgmId != -1) {
            controller.callStoredProcedure(
                    "CALL add_table_to_meeting(" + meetingID + ", " + cgmId + ", '" + game + "', " + numPlayers + ")");
        }

        Stage stage = (Stage) confirm.getScene().getWindow();
        stage.close();
    }
}
