package ctrl;

import javax.servlet.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class OrderCtrl {
	@RequestMapping("/order")
	public String order(HttpSession session) {
		session.invalidate();
		
		return "order/order_form";
	}
}
