package servlet;

import java.io.IOException;

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
 * Servlet implementation class InsertAction
 */
@WebServlet("/InsertAction")
public class InsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet InsertAction");
		
		

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost InsertAction");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		
		String shopid = request.getParameter("member_id");
		String shoppw = request.getParameter("member_pw");
		String shopname = request.getParameter("member_name");
		String shopaddr = request.getParameter("member_addr");
		String shopaddr2 = request.getParameter("member_addr2");
		String shopaddr3 = request.getParameter("member_addr3");
		String shopphone = request.getParameter("member_phone");
		String shopemail = request.getParameter("member_email");
		
		request.setAttribute("welcome", shopname);
		
		MemberDTO mDto = new MemberDTO(shopid, shoppw, shopname, shopaddr,shopaddr2,shopaddr3, shopphone, shopemail);
		MemberDAO mDao = new MemberDAO();
		int value = mDao.Insert(mDto);
		
		String code = null;
		
		HttpSession session = request.getSession();
		
		if(value==10){
			code="welcome.jsp";
		}else{
			code="index.jsp";
			session.setAttribute("code","2");
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(code);
		dis.forward(request, response);
		
		
		session.removeAttribute("code");
	}

}
