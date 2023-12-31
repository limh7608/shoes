package ctrl;

import java.io.*;
import javax.servlet.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import svc.*;
import vo.*;

@Controller
@RequestMapping("/loginSpr")
public class LoginCtrlSpr {	
	private LoginSvcSpr loginSvcSpr;
	
	public void setLoginSvcSpr(LoginSvcSpr loginSvcSpr) {
		this.loginSvcSpr = loginSvcSpr;
	}
	@GetMapping	// 요청(loginSpr)을 get방식으로 받았을 경우
	public String loginForm() {
		return "loginFormSpr";
	}
	
	@PostMapping
	public String loginProc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("uid").trim().toLowerCase();
		String pwd = request.getParameter("pwd").trim();
		MemberInfo loginInfo = loginSvcSpr.getLoginInfo(uid, pwd);
		
		if (loginInfo == null) {	
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디와 암호를 확인하세요.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginInfo", loginInfo);
		}
		
		return "redirect:/";
	}
}
