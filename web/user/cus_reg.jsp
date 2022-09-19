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
                    <form action="../add_customer" method="post">
                        <h2 class="text-center" style="color: white;">Registration Form</h2>
                        <div class="form-group">
                          <input type="text" class="form-control form-control-lg" name="name" placeholder="Full Name" style="padding:  6% 0% 6% 2%; color:white;  background-color:  #353F3C; border: none;">
                        </div>
                        <div class="form-group">
                          <input type="tel" class="form-control form-control-lg" name="telephoneNumber" placeholder="Telepone Number" style="padding:  6% 0% 6% 2%; color:white;  background-color:  #353F3C; border: none;">
                        </div>
                        <div class="form-group">
                          <input type="email" class="form-control form-control-lg" name="email" placeholder="Email" style="padding:  6% 0% 6% 2%; color:white;  background-color:  #353F3C; border: none;">
                        </div>
                        <div class="form-group">
                          <input type="password" class="form-control form-control-lg" name="password" placeholder="Password"  style="padding:  6% 0% 6% 2%;  color:white; background-color:  #353F3C; border: none;">
                        </div>
                        <div class="mt-3">
                            <input type="submit" value="Registration" class="btn btn-block btn-warning border-0" style="border-radius: 0%; padding: 10px; font-size:15px;" />
                        </div>
                        <div class="my-2 d-flex justify-content-between align-items-center">
                            <a href="login.jsp" class="auth-link text-black">I Have A Account</a>
                        </div>
                      </form>
                </div>
                <div class="col-sm-4"></div>
               
            </div>
            
	</div>
       
	<script>var base_href = '/';</script>
	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>	

	<script type="text/javascript" src="assets/js/plugins.min.js"></script>		
	
        <script src="assets/js/map-style.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTRSHf8sjMCfK9PHPJxjJkwrCIo5asIzE"></script>	
	<script type="text/javascript" src="assets/js/scripts.js"></script>

        <script>
            function signIn(){
                const queryString = window.location.search;
                const urlParams = new URLSearchParams(queryString);
                const vcId = urlParams.get('id')
                location.href = 'customer_dashboard.jsp?id='+vcId;
            }
            
            $.ajax({
                url: "../get_all_vehicle_category",
                type: 'POST',
                success: function(data) {

                          var dataArr = data.split('!!!!');
                          if(dataArr.length > 0){
                                var html="";
                               
                                for (let index = 0; index < dataArr.length; index++){
                                    var dataArr2 = dataArr[index].split(',,');
                                       
                                        html += '<a href="#" class="active m-0 p-0" style="font-size:18px; ">'+dataArr2[1]+'</a>';
                                }
                                $('.vehicle_category').empty().append(html);
                          }
                }
            });
            
            $.ajax({
            url: "../get_all_vehicle_category",
            type: 'POST',
            success: function(data) {
              
                var dataArr = data.split('!!!!');
                if(dataArr.length > 0){

                      var html = "";
                      for (let index = 0; index < dataArr.length; index++){
                          var dataArr2 = dataArr[index].split(',,');
                          
                                html += "<div class='col-md-3 col-sm-6 ' style='margin-top:2%; cursor: pointer'>\n\
                                            <div class='item matchHeight'>\n\
                                                <div class='image'>\n\
                                                        <img src='"+dataArr2[2]+"' class='full-width' alt='Tariff'>\n\
                                                </div>\n\
                                                <h4>"+dataArr2[1]+"</h4>\n\
                                                <p>Paymnt for first "+dataArr2[3]+" KM : RS."+dataArr2[4]+".00 </p>\n\
                                                <div class='price'>$"+dataArr2[5]+"<span>/km</span></div>\n\
                                            </div>\n\
                                        </div>";
                      }
                      $('.vehicle_category_container').empty().append(html);
                }
            }
        });
	</script>

</body>
</html>