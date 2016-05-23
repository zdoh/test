package spring;

import org.hibernate.ObjectNotFoundException;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.web.bind.annotation.*;
import spring.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import spring.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zdoh on 17.05.16.
 */
@Controller
public class UserController {
    private UserService userService;

    @Autowired(required=true)
    @Qualifier(value="userService")
    public void setUserService(UserService us){
        this.userService = us;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String getAllUsers(@RequestParam(required = false) Integer page, @RequestParam(required = false) Integer id, Model model) {
        if(null != id) {
            User u = null;
            try {
                u = this.userService.getUserById(id);
                model.addAttribute("user", u);
                List<User> uu = new ArrayList<User>();
                uu.add(u);
                model.addAttribute("getAllUsers", uu);
            } catch (SQLException e) {}
        } else {
            model.addAttribute("user", new User());
            getModel(model, page);
        }

        return "user";
    }

    //For add and update person both
    @RequestMapping(value= {"/user/add"}, method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User p, HttpServletRequest request){
        String referer = request.getHeader("Referer");
        if (p.getId() == 0) {
            //new user, add it
            try {
                this.userService.addUser(p);
            } catch (SQLException e) {}
        } else {
            //existing user, call update
            try {
                this.userService.updateUser(p);
            } catch (SQLException e) {}
        }
        return "redirect:" + referer;
    }

    @RequestMapping("/remove/{id}")
    public String deleteUser(@PathVariable("id") int id, HttpServletRequest request){
        String referer = request.getHeader("Referer");
        try {
            this.userService.deleteUser(id);
        } catch (SQLException e) {}
        return "redirect:" + referer;
    }


    @RequestMapping(value = {"/edit/{id}"}, method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") int id, Model model, @RequestParam(required = false) Integer page){
        try {
            model.addAttribute("user", this.userService.getUserById(id));
        } catch (SQLException e) {}
        getModel(model, page);
        return "user";
    }

    private Model getModel(Model model, Integer page) {
        List<User> users = null;
        try {
            users = this.userService.getAllUsers();
        } catch (SQLException e) {}
        PagedListHolder<User> pagedListHolder = new PagedListHolder(users);
        pagedListHolder.setPageSize(10);

        model.addAttribute("maxPages", pagedListHolder.getPageCount());

        if( page==null || page < 1 || page > pagedListHolder.getPageCount()) page=1;
        model.addAttribute("page", page);

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            model.addAttribute("getAllUsers", pagedListHolder.getPageList());
        } else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            model.addAttribute("getAllUsers", pagedListHolder.getPageList());
        }

        return model;
    }
}
