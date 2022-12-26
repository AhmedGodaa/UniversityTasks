package com.example.guitask;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;

public class HelloController {


    @FXML
    public TextField productNameFiled;
    @FXML
    public TextField productPriceFiled;
    @FXML
    public TextField inputDeleteProduct;
    @FXML
    public TextField productQuantityFiled;


    DatabaseConnection connection = new DatabaseConnection();
    Connection connectDB = connection.getConnection();


    public void addProductButton(ActionEvent event) throws IOException {

        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("create-product.fxml"));
        Stage stage = new Stage();
        stage.setTitle("Add Product");
        stage.setScene(new Scene(fxmlLoader.load()));
        stage.show();

    }


    public void deleteProductButton() throws IOException {

        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("delete-product.fxml"));
        Stage stage = new Stage();
        stage.setTitle("Delete Product");
        stage.setScene(new Scene(fxmlLoader.load()));
        stage.show();


    }

    public void searchProductButton() throws IOException, SQLException {

        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("search-product.fxml"));
        Stage stage = new Stage();

        stage.setTitle("Search Product");
        stage.setScene(new Scene(fxmlLoader.load()));
        stage.show();


    }


    public void addProduct() throws SQLException {
        String productName = productNameFiled.getText();
        String productPrice = productPriceFiled.getText();
        String productQuantity = productQuantityFiled.getText();
        PreparedStatement statement = connectDB.prepareStatement("INSERT INTO task.products ( `name`, `price`, `quantity`) VALUES ( ? , ? ,  ?) ");
        statement.setString(1, productName);
        statement.setString(2, productPrice);
        statement.setString(3, productQuantity);
        statement.execute();
        Stage stage = (Stage) productPriceFiled.getScene().getWindow();
        stage.close();


    }

    public void deleteProduct() throws SQLException {

        PreparedStatement statement = connectDB.prepareStatement("DELETE FROM task.products WHERE (`id` = ?)");
        statement.setString(1, inputDeleteProduct.getText());
        statement.execute();
        Stage stage = (Stage) inputDeleteProduct.getScene().getWindow();
        stage.close();


    }





}