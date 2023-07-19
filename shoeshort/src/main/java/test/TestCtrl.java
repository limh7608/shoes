package test;

import javax.servlet.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class TestCtrl {
	@GetMapping("/test")
	// Get ������� test�� ��û�� ��� ó���� �޼ҵ带 ����
	// post����� ��û�� @PostMapping �ֳ����̼� ���
	// ".test" ��η� ���� ��û�� ó���� �޼ҵ�� test()�޼ҵ带 ����
	// get �� post�� �� �ٸ� �����Ϸ��� @RequestMapping("���")�� ���
	// @RequestMapping[("���", method=RequestMethod.GET or RequestMethod.POST)]
	public String test(Model model, @RequestParam(value="name", defaultValue="aaa", required=false) String name) {
	// Model : ��Ʈ�ѷ��� ó�� ����� model�� ��Ƽ� �信 ����
	// @RequestParam : ��ûURL��  �Ķ������ ���� �޼ҵ��� �Ķ���ͷ� ������
	// defaultValue : ��������. name�Ű������� ���� ���� ��� �� �⺻�� ������ null�� �� 
	// required : ��������. �ʼ� ���η� true�� ��� name�Ķ���Ͱ� ������ 400�� �����߻��ϸ� �⺻����false
		
		model.addAttribute("greeting", "�ȳ��ϼ���, " + name);	
		return "test"; //dispatcher������� ���� �⺻�� redirect����
		// ��Ʈ�ѷ��� ó������� ������ �� �̸����� "test"�� ����ϰڴٴ� �ǹ� = test.jsp
	}
	
	@GetMapping("/test2")
	public String test2(String name, HttpServletRequest request) {
	//������� ��û�� �޴� ��Ʈ�ѷ��̹Ƿ� HttpServletRequest ��ü�� �޾ƿ� �� ����
		request.setAttribute("greeting", "�ȳ��ϼ���2, " + name);	
		return "test";
	}
}
