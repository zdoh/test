package spring.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.doa.UserDAO;
import spring.model.User;

import java.sql.SQLException;
import java.util.List;


@Service
public class UserServiceImpl implements UserService {
    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Transactional
    public void addUser(User user) throws SQLException {
        userDAO.addUser(user);
    }

    @Transactional
    public void updateUser(User user) throws SQLException {
        userDAO.updateUser(user);
    }

    @Transactional
    public List<User> getAllUsers() throws SQLException {
        return userDAO.getAllUsers();
    }

    @Transactional
    public User getUserById(int id) throws SQLException {
        return userDAO.getUserById(id);
    }

    @Transactional
    public void deleteUser(int id) throws SQLException {
        userDAO.deleteUser(id);
    }
}
