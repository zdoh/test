package spring.service;

import spring.model.User;

import java.sql.SQLException;
import java.util.List;


public interface UserService {
    void addUser(User user) throws SQLException;
    void updateUser(User user) throws SQLException;
    List getAllUsers() throws SQLException;
    void deleteUser(int id) throws SQLException;
    User getUserById(int id) throws SQLException;
}
