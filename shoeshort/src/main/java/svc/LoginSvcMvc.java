package svc;

import vo.*;
import config.*;
import dao.*;

public class LoginSvcMvc {
	public MemberInfo getLoginInfo(String uid, String pwd) {
		MemberInfo mi = null;
		DbConfig dbConfig = new DbConfig();
		LoginDaoMvc loginDaoMvc = new LoginDaoMvc(dbConfig.dataSource());
		mi = loginDaoMvc.getLoginInfo(uid, pwd);
		
		return mi;
	}
	
}
