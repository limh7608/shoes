<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.* " %>
<%
LocalDate today = LocalDate.now();
int cyear = today.getYear();
int cmonth = today.getMonthValue();
int cday = today.getDayOfMonth();
int last = today.lengthOfMonth();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#agreement { width:500px; height:100px; overflow:auto;}
.pLine {width:500px; }
#fontBlue { font-weight:bold; color:blue; }
#fontRed { font-weight:bold; color:red; }
</style>
<script src="${pageContext.request.contextPath}/resources/js/date_change.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>
$(document).ready(function(){
	$("#e2").change(function(){
		if($(this).val() == ""){
			$("#e3").val("");
		} else if($(this).val() == "direct"){
			$("#e3").val("");	$("#e3").focus();
		} else{
			$("#e3").val($(this).val());
		}
	});
});

function chkDupId(uid){
	if(uid.length >= 4){
		$.ajax({
			type: "POST", url : "./dupId", data : {"uid":uid},
			success: function(chkRs){
				var msg = "";
				if(chkRs == 0){
					msg ="<span id='fontBlue'>사용하실 수 있는 ID입니다.</span>";
					$("#idChk").val("y");
				} else{
					msg ="<span id='fontRed'>이미 사용중인 ID입니다.</span>";
					$("#idChk").val("n");
				}
				$("#idMsg").html(msg);
			}
		});
	} else {
		$("#idMsg").text("아이디는 4~20자로 입력하세요.");
		$("#idChk").val("n");
	}
}
</script>
</head>
<body>
<h2>회원 가입 폼</h2>
<div id="agreement">
약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 <br />
약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 <br />
약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 <br />
약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 <br />
약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 약관 내용 <br />
</div>
<form name="frmJoin" action="memberJoin" method="post">
<input type="hidden" name="idChk" id="idChk" value="n" />
<p class="pLine" align="center">
   <input type="radio" name="agreement" value="y" id="agreeY" />
   <label for="agreeY">동의함</label>&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="radio" name="agreement" value="n" id="agreeN" />
   <label for="agreeN">동의안함</label>
</p>
<hr class="pLine" align="left" />
<p class="pLine">아이디 : 
	<input type="text" name="mi_id" onkeyup="chkDupId(this.value);"/>
	<span id="idMsg" style="font-size:0.8em;">아이디는 4~20자로 입력하세요.</span>
</p>
<p class="pLine">비밀번호 : <input type="password" name="mi_pw" /></p>
<p class="pLine">비밀번호 확인 : <input type="password" name="mi_pw2" /></p>
<p class="pLine">이름 : <input type="text" name="mi_name" /></p>
<p class="pLine">성별 : 
   <input type="radio" name="mi_gender" value="남" id="male" checked="checked"/>
   <label for="male">남</label>&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="radio" name="mi_gender" value="여" id="female" />
   <label for="female">여</label>
</p>
<p class="pLine">생년월일 : 
   <select name="year" onchange="resetday(this.value, from.month.value, this.form.day);">
<% for (int i = 1950; i <= cyear; i++) { %>
      <option <% if (i == cyear)  { %> selected="selected" <% } %>><%=i %></option>
<%} %>
   </select>년
   <select name="month" onchange="resetday(this.form.year.value, this.value, this.form.day);">
<% for (int i = 1; i <= 12; i++) { 
   String tmp = (i < 10 ? "0" + i: i + "");
   String slt = (i == cmonth ? " selected='selected'" : "");
%>
      <option <%=slt %>><%=tmp %></option>
<%} %>
   </select>월
   <select name="day">
<% for (int i = 1; i <= last; i++) {  
   String tmp = (i < 10 ? "0" + i: i + "");
   String slt = (i == cday ? " selected='selected'" : "");
%>
      <option <%=slt %>><%=tmp %></option>
<%} %>
   </select>일
</p>
<p class="pLine">휴대폰 : 010 -
   <input type="text" name="p2" size="4" maxlength="4" /> - 
   <input type="text" name="p3" size="4" maxlength="4" />
</p>
<p class="pLine">이메일 : 
   <input type="text" name="e1" id="e1" size="10" /> @ 
   <select name="e2" id="e2">
      <option value="">도메인 선택</option>
      <option value="naver.com">네이버</option>
      <option value="nate.com">네이트</option>
      <option value="gmail.com">지메일</option>
      <option value="direct">직접입력</option>
   </select>
   <input type="text" name="e3" id="e3" size="10" />
</p>
<p class="pLine">광고 수신 : 
   <input type="radio" name="mi_isad" value="y" id="adY" checked="checked"/>
   <label for="adY">받음</label>&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="radio" name="mi_isad" value="n" id="adN" />
   <label for="adN">안받음</label>
</p>
<p class="pLine" align="center">
   <input type="submit" value="회원 가입" />
</p>
</form>
</body>
</html>