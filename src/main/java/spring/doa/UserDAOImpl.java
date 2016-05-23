package spring.doa;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import spring.model.User;


@Repository
public class UserDAOImpl implements UserDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) throws SQLException {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.persist(user);
        tx.commit();
    }

    public void updateUser(User user) throws SQLException {
        Session session = this.sessionFactory.openSession();
        session.beginTransaction();
        session.update(user);
        session.getTransaction().commit();
        session.close();
    }

    public List<User> getAllUsers() throws SQLException {
        Session session = this.sessionFactory.openSession();
        List<User> users = session.createQuery("from User").list();
        return users;
    }

    public User getUserById(int id) throws SQLException {
        Session session = this.sessionFactory.openSession();
        User u = (User) session.load(User.class, id);
        return u;
    }

    public void deleteUser(int id) throws SQLException {
        Session session = this.sessionFactory.openSession();
        /*User u = (User) session.load(User.class, id);
        //if(null != u) {
            session.delete(u);
        //} */

        Query query = session.createQuery("delete User where id = :idd");
        query.setParameter("idd", id);
        query.executeUpdate();
    }
}
