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

    private MainController controller;

    public newGameController(MainController _controller) {
        this.controller = _controller;
    }

    @FXML
    public void initialize() {
        confirm.setOnMouseClicked(e -> createNewGame(nameInput.getText(), publisherInput.getText(),
                systemInput.getText(), physicalBox.isSelected(), digitalBox.isSelected()));
    }

    private void createNewGame(String name, String publisher, String system, boolean physical, boolean digital) {
        controller.callStoredProcedure("CALL add_game('" + name + "', '" + publisher + "', '" + system + "', "
                + physical + ", " + digital + ");");
        controller.updateUI();
        Stage stage = (Stage) confirm.getScene().getWindow();
        stage.close();
    }
}
