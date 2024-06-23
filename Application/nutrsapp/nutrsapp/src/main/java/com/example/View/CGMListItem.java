package com.example.View;

import com.example.Model.CGM;

import javafx.geometry.Insets;
import javafx.scene.control.Label;
import javafx.scene.layout.HBox;

public class CGMListItem extends HBox {
    public CGMListItem(CGM cgm) {
        Label name = new Label("Name: " + cgm.getName() + ",");
        Label email = new Label("Email: " + cgm.getEmail() + ",");
        Label discord = new Label("Discord: " + cgm.getDiscord() + ",");
        Label maxPlayers = new Label("Max Players: " + cgm.getMaxPlayers() + ",");

        email.setPadding(new Insets(0, 0, 5, 10));
        discord.setPadding(new Insets(0, 0, 5, 10));
        maxPlayers.setPadding(new Insets(0, 0, 5, 10));

        getChildren().add(name);
        getChildren().add(email);
        getChildren().add(discord);
        getChildren().add(maxPlayers);
    }
}
