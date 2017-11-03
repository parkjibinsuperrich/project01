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
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String log;
	String code;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet LoginAction");
	}

	/** 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost LoginAction");
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw"); 
		
		System.out.println("id = " + id);
		System.out.println("pw = "+pw);
		
		MemberDAO mDao = new MemberDAO();
		MemberDTO mDto = mDao.ckLogin(id,pw);
		
		if(mDto == null){
			session.removeAttribute("id");
			session.setAttribute("code", "2");
			code="login.jsp";
		}else{
			//���� �ʱ�ȭ(Ȥ�ø� ���� �����ִ� �� ����)
			session.removeAttribute("id"); 
			session.removeAttribute("code"); 
			
			session.setAttribute("loginUser", mDto);//�����̸�
			code = "IndexAction";
			log=mDto.getShopid();
		}
		RequestDispatcher dis = request.getRequestDispatcher(code);
		dis.forward(request, response);
		
	}

}
