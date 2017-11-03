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

import dto.MemberDTO;
import dao.MemberDAO;

/** 
 * Servlet implementation class JoinUpdate
 */
@WebServlet("/JoinUpdate")
public class JoinUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */ 
    public JoinUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/** 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet JoinUpdate");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")!=null){
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("UTF-8"); 
			String id = LoginAction.log;
			
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			MemberDAO Dao = new MemberDAO();
			list = Dao.Search(id);
	  
			request.setAttribute("memberupdate", list);
	
			RequestDispatcher dis = request.getRequestDispatcher("memberupdate.jsp");
			dis.forward(request, response);

		}else{
			response.sendRedirect("login.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost JoinUpdate");

		
		
		request.setCharacterEncoding("UTF-8");
		
		String shopid = request.getParameter("shopid");
		String shopname = request.getParameter("shopname");
		String shopaddr = request.getParameter("member_addr");
		String shopaddr2 = request.getParameter("member_addr2");
		String shopaddr3 = request.getParameter("member_addr3");
		String shopphone = request.getParameter("shopphone");
		String shopemail = request.getParameter("shopemail");
		
		
		 

		MemberDTO mDto = new MemberDTO(shopid, shopname, shopaddr,shopaddr2,shopaddr3, shopphone, shopemail);
 
		MemberDAO mDao = new MemberDAO();
		mDao.Modify(mDto);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", mDto);
		
		RequestDispatcher dis = request.getRequestDispatcher("IndexAction");
		dis.forward(request, response);
		
	}

}
