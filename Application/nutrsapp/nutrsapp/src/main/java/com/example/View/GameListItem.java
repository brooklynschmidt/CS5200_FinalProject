package com.example.View;

import com.example.Model.Game;

import javafx.geometry.Insets;
import javafx.scene.control.Label;
import javafx.scene.layout.HBox;

public class GameListItem extends HBox {
    public GameListItem(Game game) {
        Label name = new Label(game.getName());
        Label publisher = new Label(game.getPublisher());
        Label system = new Label(game.getSystem());
        Label own;

        boolean physical = game.getPhysical();
        boolean digital = game.getDigital();

        if (physical && digital) {
            own = new Label("Club owns digitally and physically");
        } else if (physical && !digital) {
            own = new Label("Club owns physically");
        } else if (digital && !physical) {
            own = new Label("Club own digitally");
        } else {
            own = new Label("Club does not own");
        }

        publisher.setPadding(new Insets(0, 0, 5, 10));
        system.setPadding(new Insets(0, 0, 5, 10));
        own.setPadding(new Insets(0, 0, 5, 10));

        getChildren().add(name);
        getChildren().add(publisher);
        getChildren().add(system);
        getChildren().add(own);
    }
}
