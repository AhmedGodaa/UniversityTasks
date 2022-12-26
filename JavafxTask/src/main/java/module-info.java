module com.example.guitask {
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.graphics;
    requires java.sql;
    requires mysql.connector.j;


    opens com.example.guitask to javafx.fxml;
    exports com.example.guitask;
}