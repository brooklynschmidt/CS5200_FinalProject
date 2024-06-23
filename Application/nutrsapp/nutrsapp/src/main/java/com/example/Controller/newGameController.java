package com.example.Controller;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class newGameController {
    @FXML
    private TextField nameInput;
    @FXML
    private TextField publisherInput;
    @FXML
    private TextField systemInput;

    @FXML
    private CheckBox physicalBox;
    @FXML
    private CheckBox digitalBox;

    @FXML
    private Button confirm;

    @FXML
    public void initialize() {
        confirm.setOnMouseClicked(e -> createNewGame(nameInput.getText(), publisherInput.getText(),
                systemInput.getText(), physicalBox.isSelected(), digitalBox.isSelected()));
    }

    private void createNewGame(String name, String publisher, String system, boolean physical, boolean digital) {
        // TODO: Call stored procedure
        Stage stage = (Stage) confirm.getScene().getWindow();
        stage.close();
    }
}
