package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

            switch (action) {
                case "/new":
               
                    showNewForm(request, response);
                	
                    break;
                case "/insert":
                	try {
                    insertUser(request, response);
                	}  catch (Exception e) {
						// TODO: handle exception
                		e.printStackTrace();
					}
                    break;
                case "/delete":
                	try {
                    deleteUser(request, response);
                	} catch (Exception e) {
						// TODO: handle exception
                		e.printStackTrace();
					}
                    break;
                case "/edit":
                	try {
                    showEditForm(request, response);
                	}catch (Exception e) {
						// TODO: handle exception
                		e.printStackTrace();
					}
                    break;
                case "/update":
                	try {
                    updateUser(request, response);
                	}catch (Exception e) {
						// TODO: handle exception
                		e.printStackTrace();
					}
                    break;
                default:
                	try {
                    listUser(request, response);
                	}catch (Exception e) {
						// TODO: handle exception
                		e.printStackTrace();
					}
                    break;
            
         }
        
        }
    private void listUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List < User > listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int userid = Integer.parseInt(request.getParameter("userid"));
        User existingUser = userDAO.selectUser(userid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(fname, lname, email, country);
        userDAO.insertUser(newUser);
        response.sendRedirect("list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int userid = Integer.parseInt(request.getParameter("userid"));
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User book = new User(userid, fname, lname, email, country);
        userDAO.updateUser(book);
        response.sendRedirect("list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int userid = Integer.parseInt(request.getParameter("userid"));
        userDAO.deleteUser(userid);
        response.sendRedirect("list");

    }
}