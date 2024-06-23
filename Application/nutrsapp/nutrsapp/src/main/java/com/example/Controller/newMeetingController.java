package com.example.Controller;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class newMeetingController {
    @FXML
    private TextField dateInput;

    @FXML
    private TextField themeInput;

    @FXML
    private Button confirm;

    private MainController controller;

    public newMeetingController(MainController _controller) {
        this.controller = _controller;
    }

    @FXML
    public void initialize() {
        confirm.setOnMouseClicked(e -> createNewMeeting(dateInput.getText(), themeInput.getText()));
    }

    private void createNewMeeting(String date, String theme) {
        controller.callStoredProcedure("CALL create_meeting('" + date + "', '" + theme + "');");
        controller.updateUI();
        Stage stage = (Stage) confirm.getScene().getWindow();
        stage.close();
    }
}
