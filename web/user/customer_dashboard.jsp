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
			<div class="get-icon">
				<h4>Get Taxi Now</h4>
				<div class="phone">011 10 21 010</div>
				<span class="fa fa-phone-square"></span>
			</div>
			<div id="large-image">
				<img src="assets/images/_car-big.png" class="car" alt="Taxi">
				<img src="assets/images/_car-splash.png" class="splash" alt="Taxi">
			</div>
		</div>
	</div>
        <br/><br/><br/><br/><br/><br/>
	<section >
		<div class="container">
			<h2 class="h1 text-center">Customer Dashboard</h2>
			<div class="row">
				<div class="col-md-3 col-sm-6 col-ms-6" >	
                                    <a href="#" class="btn btn-yellow btn-lg btn-white">Available <span id="selected_vehicle_category"></span></a> 
				</div>
				<div class="col-md-3 col-sm-6 col-ms-6  ">	
				    <a href="#" class="btn btn-yellow btn-lg btn-white">Trip History</a>
				</div>
			</div>
		</div>
	</section>		
       	<section id="car-block mt-0 ">
		<div class="container">
			<div class="row vehicle_category_container">
				
				
                                
			</div>
		</div>
	</section>			
        <br/><br/><br/><br/>
        <div id="homepage-banners">
		<div class="container">
			<div class="row">
				<a href="#" class="col-md-6 col-sm-6 col-ms-6"><img src="assets/images/_banner-1.png" class="full-width" alt="Banner"></a>
				<a href="#" class="col-md-6 col-sm-6 col-ms-6"><img src="assets/images/_banner-2.png" class="full-width" alt="Banner"></a>
			</div>
		</div>
	</div>

	<section id="partners">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-12">
					<h4 class="black margin-0">Our partners</h4>
					<h2 class="white margin-0">and clients</h2>
				</div>
				<div class="col-md-9 col-sm-12">
					<div class="row items">
					    <div class="col-md-5ths col-sm-3 col-ms-4 col-xs-6"><a href="#"><img src="assets/images/_partner-1.png" alt="Partner"></a></div>
					    <div class="col-md-5ths col-sm-3 col-ms-4 col-xs-6"><a href="#"><img src="assets/images/_partner-2.png" alt="Partner"></a></div>
					    <div class="col-md-5ths col-sm-3 col-ms-4 col-xs-6"><a href="#"><img src="assets/images/_partner-3.png" alt="Partner"></a></div>
					    <div class="col-md-5ths col-sm-3 col-ms-4 col-xs-6"><a href="#"><img src="assets/images/_partner-4.png" alt="Partner"></a></div>
					    <div class="col-md-5ths col-sm-3 col-ms-4 col-xs-6"><a href="#"><img src="assets/images/_partner-5.png" alt="Partner"></a></div>
					</div>				
				</div>				
			</div>
		</div>
	</section>

        <jsp:include page="footer.jsp"/>
        
	<script>var base_href = '/';</script>
	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>	

	<script type="text/javascript" src="assets/js/plugins.min.js"></script>		
	
        <script src="assets/js/map-style.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTRSHf8sjMCfK9PHPJxjJkwrCIo5asIzE"></script>	
	<script type="text/javascript" src="assets/js/scripts.js"></script>

        <script>
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const vcId = urlParams.get('id')
            document.getElementById("selected_vehicle_category").innerHTML = vcId;
            
            $.ajax({
            url: "../get_customer_driver_list",
            type: 'POST',
            data : {
                vcId : vcId
            },
            success: function(data) {
                var dataArr = data.split('!!!!');
                if(dataArr.length > 0){

                      var html = "";
                      for (let index = 0; index < dataArr.length; index++){
                          var dataArr2 = dataArr[index].split(',,');
                          
                                html += "<div class='col-sm-3' style='margin-top:1%; margin-right:1%; cursor: pointer; background-color: #E5E7E5;' >\n\
                                            <div class='item rounded ' >\n\
                                                <h4>"+dataArr2[2]+"</h4>\n\
                                                <p>Model : "+dataArr2[3]+"<br/>Vehicle Number : "+dataArr2[4]+"<br/><br/>\n\
                                                <span  onclick='booking("+dataArr2[0]+","+dataArr2[1]+",\`"+ dataArr2[4] + "\`,\`"+ dataArr2[3] + "\`,\`"+ dataArr2[2] + "\`)' class='text-end btn btn-black btn-sm text-capitalize'><i class='bi bi-person-plus-fill' style='font-size: 22px;'></i></span></p>\n\
                                            </div>\n\
                                        </div>";
                      }
                      $('.vehicle_category_container').empty().append(html);
                }
            }
        });
        
        function booking(Driver_Id , veicle_id, VehicleNumber , model, driver){
            location.href = 'booking_Confirm.jsp?Driver_Id='+Driver_Id+'&veicle_id='+veicle_id+'&VehicleNumber='+VehicleNumber+'&model='+model+'&driver='+driver+'&selectedVC='+vcId;    
        }
        
            
	</script>
        
</body>
</html>