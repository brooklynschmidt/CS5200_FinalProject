package com.example.Controller;

import java.util.ArrayList;

import com.example.App;
import com.example.API.MySqlNutrsAPI;
import com.example.Model.CGM;
import com.example.Model.Game;
import com.example.Model.Meeting;
import com.example.Model.Table;
import com.example.View.CGMListItem;
import com.example.View.GameListItem;
import com.example.View.MeetingListItem;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class MainController {
    @FXML
    private VBox meetingList;

    @FXML
    private VBox cgmList;

    @FXML
    private VBox gameList;

    @FXML
    private Button newMeeting;

    @FXML
    private Button newCGM;

    @FXML
    private Button newGame;

    private MySqlNutrsAPI api;

    @FXML
    public void initialize() {
        api = new MySqlNutrsAPI();

        api.connect("jdbc:mysql://localhost:3306/NUTRS?serverTimezone=EST5EDT",
                "NUTRS", "NUTRS");

        updateUI();

        newMeeting.setOnMouseClicked(e -> newMeeting());
        newCGM.setOnMouseClicked(e -> newCGM());
        newGame.setOnMouseClicked(e -> newGame());
    }

    public void updateUI() {
        meetingList.getChildren().clear();
        cgmList.getChildren().clear();
        gameList.getChildren().clear();

        ArrayList<Meeting> meetings = api.getAllMeetings();

        for (Meeting m : meetings) {
            int numPlayers = api.getPlayersInMeeting(m);
            MeetingListItem mli = new MeetingListItem(m, numPlayers, this);
            meetingList.getChildren().add(mli);
        }

        ArrayList<CGM> CGMs = api.getAllCgms();

        for (CGM cgm : CGMs) {
            CGMListItem cli = new CGMListItem(cgm);
            cgmList.getChildren().add(cli);
        }

        ArrayList<Game> games = api.getAllGames();

        for (Game g : games) {
            GameListItem gli = new GameListItem(g);
            gameList.getChildren().add(gli);
        }
    }

    public void callStoredProcedure(String sql) {
        try {
            api.callStoredProcedure(sql);
        } catch (Exception ex) {

        }
    }

    public int getCGMID(String firstName, String lastName) {
        return api.getCGMID(firstName, lastName);
    }

    private void newMeeting() {
        try {
            newMeetingController controller = new newMeetingController(this);
            FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("newMeeting.fxml"));
            fxmlLoader.setController(controller);

            Scene scene = new Scene(fxmlLoader.load());
            Stage stage = new Stage();
            stage.setScene(scene);
            stage.setTitle("NUTRS Database Application");
            stage.show();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private void newCGM() {
        try {
            newCGMController controller = new newCGMController(this);
            FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("newCGM.fxml"));
            fxmlLoader.setController(controller);

            Scene scene = new Scene(fxmlLoader.load());
            Stage stage = new Stage();
            stage.setScene(scene);
            stage.setTitle("NUTRS Database Application");
            stage.show();
        } catch (Exception e) {

        }
    }

    private void newGame() {
        try {
            newGameController controller = new newGameController(this);
            FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("newGame.fxml"));
            fxmlLoader.setController(controller);

            Scene scene = new Scene(fxmlLoader.load());
            Stage stage = new Stage();
            stage.setScene(scene);
            stage.setTitle("NUTRS Database Application");
            stage.show();
        } catch (Exception e) {

        }
    }

    public ArrayList<Table> getTablesInMeeting(Meeting m) {
        return api.getTablesInMeeting(m);
    }

}
