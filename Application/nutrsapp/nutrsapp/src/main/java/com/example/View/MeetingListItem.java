package com.example.View;

import java.util.ArrayList;

import com.example.App;
import com.example.Controller.MainController;
import com.example.Controller.newCGMController;
import com.example.Controller.newTableController;
import com.example.Model.Meeting;
import com.example.Model.Table;

import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.scene.Cursor;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class MeetingListItem extends HBox {
    MainController controller;
    Meeting meeting;

    public MeetingListItem(Meeting meeting, int numPlayers, MainController _controller) {
        this.meeting = meeting;
        this.controller = _controller;

        Label date = new Label(meeting.getDateAsString());
        Label theme = new Label(meeting.getTheme());
        Label playerLabel = new Label(numPlayers + " Players");

        theme.setPadding(new Insets(0, 0, 5, 10));
        playerLabel.setPadding(new Insets(0, 0, 5, 10));

        getChildren().add(date);
        getChildren().add(theme);
        getChildren().add(playerLabel);

        setOnMouseClicked((e) -> loadTablesView());
        setOnMouseEntered(e -> getScene().setCursor(Cursor.HAND));
        setOnMouseExited(e -> getScene().setCursor(Cursor.DEFAULT));
    }

    private void loadTablesView() {
        Stage stage = new Stage();
        VBox parent = new VBox();

        Button newTable = new Button("New Table");
        newTable.setOnMouseClicked(e -> newTable());
        AnchorPane.setLeftAnchor(newTable, 6.0);
        AnchorPane.setTopAnchor(newTable, 6.0);

        parent.getChildren().add(newTable);

        ArrayList<Table> tables = controller.getTablesInMeeting(meeting);

        for (Table t : tables) {
            Label tl = new Label(t.toString());
            tl.setPadding(new Insets(6, 6, 6, 10));
            parent.getChildren().add(tl);
        }

        stage.setScene(new Scene(parent));
        stage.setTitle("Tables for meeting on " + meeting.getDateAsString());
        stage.show();
    }

    private void newTable() {
        try {
            newTableController Tcontroller = new newTableController(meeting.getID(), controller);
            FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("newTable.fxml"));
            fxmlLoader.setController(Tcontroller);

            Scene scene = new Scene(fxmlLoader.load());
            Stage stage = new Stage();
            stage.setScene(scene);
            stage.setTitle("NUTRS Database Application");
            stage.show();
        } catch (Exception e) {

        }
    }
}
