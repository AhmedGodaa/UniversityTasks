package com.example.guitask;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    public Connection dbLink;

    public Connection getConnection() {
        String databaseName = "task";
        String databaseUser = "root";
        String databasePassword = "root";
        String url = "jdbc:mysql://localhost/" + databaseName;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            dbLink = DriverManager.getConnection(url, databaseUser, databasePassword);

        } catch (Exception e) {



        }
        return dbLink;
    }

}

