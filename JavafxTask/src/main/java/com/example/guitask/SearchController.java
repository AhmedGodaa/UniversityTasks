package com.example.guitask;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

public class SearchController implements Initializable {


    @FXML
    public Button buttonTest;
    @FXML
    private Label textText;

    @FXML
    private TextField searchBar;
    @FXML
    private ListView<String> listView;
    List<Product> products = new ArrayList<>();


    DatabaseConnection connection = new DatabaseConnection();
    Connection connectDB = connection.getConnection();

    public void search() {
        listView.getItems().clear();
        searchList(searchBar.getText(), products).forEach(product ->

                listView.getItems().add("Name: " + product.name + " Price: " + product.price + " Quantity: " + product.quantity)
        );


    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        try {
            searchProduct();
            search();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }


    private List<Product> searchList(String searchWords, List<Product> listOfProducts) {

        List<String> searchWordsArray = Arrays.asList(searchWords.trim().split(" "));

        return listOfProducts.stream().filter(product -> {
            return searchWordsArray.stream().allMatch(word ->
                    product.name.toLowerCase().contains(word.toLowerCase()));
        }).collect(Collectors.toList());
    }


    public void searchProduct() throws SQLException {
        PreparedStatement statement = connectDB.prepareStatement("SELECT name,price,quantity FROM task.products");
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Product product = new Product();
            product.setName(resultSet.getString("name"));
            product.setPrice(resultSet.getString("price"));
            product.setQuantity(resultSet.getString("quantity"));
            products.add(product);
            textText.setText(String.valueOf(products.size()));

        }


    }
}
