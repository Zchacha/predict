<%-- 
    Document   : index
    Created on : May 1, 2020, 11:22:06 PM
    Author     : chacha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>app-delivery-predict</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link href="https://fonts.googleapis.com/css2?family=Mitr:wght@500;700&display=swap" rel="stylesheet">
<style>
body,h1,h5 {font-family: 'Mitr', sans-serif;}
body, html {height: 100%}
.bgimg {
  background-image: url(delivery.png);
  min-height: 100%;
  background-position: center;
  background-size: cover;
}
</style>
<body>

<div class="bgimg w3-display-container w3-text-white">
  <div class="w3-display-middle w3-jumbo">
    <p style="text-align:center; color:#FFF8DC;">ทำนายการใช้บริการ Food Delivery สำหรับร้านค้า</p>
  </div>
  <div class="w3-display-topleft w3-container w3-xlarge">
    <p><button onclick="document.getElementById('menu').style.display='block'" class="w3-button w3-black">รายละเอียด</button></p>
    <p><button onclick="document.getElementById('predict').style.display='block'" class="w3-button w3-black">เริ่มทำนาย &#128302;</button></p>
  </div>
  <div class="w3-display-bottomleft w3-container">
    <p class="w3-large">เว็บไซต์สำหรับร้านขายอาหารใช้ในการทำนายการจัดส่งผ่านบริการ Food Delivery</p>
    <p>powered by COM-SCI KMITL</p>
  </div>
</div>

<!-- Menu Modal -->
<div id="menu" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black w3-display-container">
      <span onclick="document.getElementById('menu').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>รายละเอียด</h1>
    </div>
    <div class="w3-container">
      <h5>เว็บไซต์นี้จัดทำขึ้นเพื่อส่งเสริมการขายอาหารผ่านทางช่องทางออนไลน์ โดยจะทำการทำนายการใช้บริการ Food Delivery สำหรับร้านค้าขายอาหาร
      เพื่อให้สามารถเลือกใช้ Food Delivery ที่ตรงกับกลุ่มลูกค้าเป้าหมาย</h5>
    </div>
    <div class="w3-container w3-padding-16 w3-cell-middle ">
        <img src="delivery-foodpanda.png" style="width:860px;height:860px;">
    </div>
      <div class="w3-container w3-padding-16 w3-cell-middle ">
        <img src="delivery-get2.png" style="width:860px;height:860px;">
    </div>
    <div class="w3-container w3-padding-16 w3-cell-middle ">
        <img src="delivery-grab2.png" style="width:860px;height:860px;">
    </div>
      <div class="w3-container w3-padding-16 w3-cell-middle ">
        <img src="delivery-lineman2.png" style="width:860px;height:860px;">
    </div>
  </div>
</div>

<!-- Contact Modal -->
<div id="predict" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-black">
      <span onclick="document.getElementById('predict').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <h1>การทำนาย</h1>
    </div>
    <div class="w3-container">
     <form >
         <br>
  <label for="k">กรุณาเลือกเขต:</label>
  <select  name="k">
    <option value="ladkabang">ลาดกระบัง</option>
    <option value="nongjok">หนองจอก</option>
    <option value="kannayaw">คันนายาว</option>
    <option value="bengkum">บึงกุ่ม</option>
    <option value="kongsamwa">คลองสามวา</option>
    <option value="menbure">มีนบุรี</option>
    <option value="pawed">ประเวศ</option>
    <option value="bangkapi">บางกะปิ</option>
  </select><br>
  <br>
  
  <label for="b">กรุณาช่องทางการชำระเงิน:</label>
  <select  name="b">
    <option value="credit/debit">credit/debit</option>
    <option value="bath">เงินสด</option>
  </select><br>
  <br>
  
  
    <label for="sex">กรุณาเลือกเพศที่ต้องการเจาะกลุ่มตลาด:</label>
  <select  name="sex">
    <option value="female">หญิง</option>
    <option value="male">ชาย</option>
  </select><br>
  <br>
  
  <label for="old">กรุณาเลือกอายุที่ต้องการเจาะกลุ่มตลาด:</label>
  <select  name="old">
    <option value="<18">ต่ำกว่า18ปี</option>
    <option value="18-27">18-27ปี</option>
    <option value="28-36">28-36ปี</option>
    <option value="37-45">37-35ปี</option>
  </select><br>
  <br>
   <p><button onclick="document.getElementById('predict').style.display='block'" class="w3-button w3-black">เริ่มทำนาย &#128302;</button></p>
</form>
        
            <%-- start web service invocation --%><hr/>
    <%
    try {
	serverpack.ServerWebService_Service service = new serverpack.ServerWebService_Service();
	serverpack.ServerWebService port = service.getServerWebServicePort();
	 // TODO initialize WS operation arguments here
	java.lang.String k = request.getParameter("k");
	java.lang.String b = request.getParameter("b");
	java.lang.String sex = request.getParameter("sex");
	java.lang.String old = request.getParameter("old");
	// TODO process result here
	java.lang.String result = port.operation(k, b, sex, old);
	out.println("คุณควรใช้App : "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    <%
    try {
	serverpack.ServerWebService_Service service = new serverpack.ServerWebService_Service();
	serverpack.ServerWebService port = service.getServerWebServicePort();
	 // TODO initialize WS operation arguments here
	java.lang.String k = request.getParameter("k");
	java.lang.String b = request.getParameter("b");
	java.lang.String sex = request.getParameter("sex");
	java.lang.String old = request.getParameter("old");
	// TODO process result here
	java.lang.String result = port.operation(k, b, sex, old);
        out.println(k+" "+b+" "+sex+" "+old);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %><br>

    </div>
  </div>
</div>

</body>
</html>

