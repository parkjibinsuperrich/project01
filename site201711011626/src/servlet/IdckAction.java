package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

/**
 * Servlet implementation class IdckAction
 */
@WebServlet("/IdckAction")
public class IdckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdckAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet IdckAction");

		HttpSession session = request.getSession();
		
		
		String ckid = request.getParameter("ckid");
		System.out.println("ID°ª = "+ckid);
		
		
		MemberDAO Dao = new MemberDAO();
		int result = Dao.Search1(ckid);
	  
		System.out.println("result : "+result);
		
		request.setAttribute("idCount",result);
		request.setAttribute("message",ckid);
		
		RequestDispatcher dis = request.getRequestDispatcher("idck.jsp");
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost IdckAction");
		
		
		String ck_id = request.getParameter("ck_id");
		
		request.setAttribute("ck_ck",ck_id);
		
		
		
		
		
		
		
		
	}

}
