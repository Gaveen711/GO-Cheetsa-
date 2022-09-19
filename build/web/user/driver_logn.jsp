<%-- 
    Document   : index
    Created on : Sep 8, 2022, 2:35:16 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <jsp:include page="head_link.jsp"/>
<body>

        <div id="homepage-block-1" class="bgMove" style="background-image: url(assets/images/_homepage-1-bg.jpg);">
            <div class="nav-wrapper" id="nav-wrapper">
                       <jsp:include page="nav.jsp"/>
            </div>
            <div class="container content">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                      <form class="pt-3" action="../login_driver" method="post">
                          <h2 class="text-center" style="color: white;">Login Form</h2>
                        <div class="form-group">
                          <input type="hidden" class="form-control form-control-lg" id="vehicleCategory" name="vehicleCategory"  style="padding:  6% 0% 6% 2%; color:white;  background-color:  #353F3C; border: none;">
                          <input type="email" class="form-control form-control-lg" name="email" placeholder="Email" style="padding:  6% 0% 6% 2%; color:white;  background-color:  #353F3C; border: none;">
                        </div>
                        <div class="form-group">
                          <input type="password" class="form-control form-control-lg" name="password" placeholder="Password"  style="padding:  6% 0% 6% 2%;  color:white; background-color:  #353F3C; border: none;">
                        </div>
                        <div class="mt-3">
                            <input type="submit" class="btn btn-block btn-warning border-0" style="border-radius: 0%; padding: 10px; font-size:15px;" value="Login">
                        </div>
                        <div class="my-2 d-flex justify-content-between align-items-center">
                          <a href="cus_reg.jsp" class="auth-link text-black">I Don't Have Account</a>
                        </div>
                      </form>
                </div>
                <div class="col-sm-4"></div>
                 
            </div>
	</div>
        <jsp:include page="footer.jsp"/>
	<script>var base_href = '/';</script>
	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>	

	<script type="text/javascript" src="assets/js/plugins.min.js"></script>		
	
        <script src="assets/js/map-style.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTRSHf8sjMCfK9PHPJxjJkwrCIo5asIzE"></script>	
	<script type="text/javascript" src="assets/js/scripts.js"></script>

</body>
</html>