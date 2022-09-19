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
	<div class="taxi-form-full">
		<div class="container">	
			<form class="form-validate">
                            <a href="#tariffs">
				<input type="button" value="Get Taxi" class="btn btn-lg btn-red aligncenter">
                            </a>
			</form>
		</div>
	</div>

		<section id="services">
		<div class="container">
			<h4 class="yellow">Welcome</h4>
			<h2 class="h1">Our Services</h2>
			<div class="row">
				<div class="col-md-3 col-sm-6 col-ms-6 matchHeight">	
					<div class="image"><img src="assets/images/_services-1.png" alt="Service"></div>
					<h5>Rapid city transfer</h5>
				</div>
				<div class="col-md-3 col-sm-6 col-ms-6 matchHeight">	
					<div class="image"><img src="assets/images/_services-2.png" alt="Service"></div>
					<h5>Scheduled Transport</h5>
				</div>
				<div class="col-md-3 col-sm-6 col-ms-6 matchHeight">	
					<div class="image"><img src="assets/images/_services-3.png" alt="Service"></div>
					<h5>Airport transfer</h5>
				</div>
				<div class="col-md-3 col-sm-6 col-ms-6 matchHeight">	
					<div class="image"><img src="assets/images/_services-4.png" alt="Service"></div>
					<h5>Baggage transport</h5>
				</div>
			</div>
		</div>
	</section>		
        <section id="tariffs">
		<div class="container">
			<h4 class="yellow">See Our</h4>
			<h2 class="h1">Our Vehicle Category</h2>
			<div class="row vehicle_category_container">
				
				
                                
			</div>
		</div>
	</section>		<section id="download" class="parallax" style="background-image: url(assets/images/_download-bg.jpg);">
		<div class="container">
			<h4 class="yellow">Get More Benefits</h4>
			<h2 class="h1">Download The App</h2>
			<div class="row">
				<div class="col-md-4 col-sm-12">
					<div class="items row">
						<div class="col-md-2 visible-md visible-lg"><span class="num">01.</span></div>
						<div class="col-md-10">
							<h5 class="yellow">Fast booking</h5>
							<p>GoCheeta will find you the nearest available driver.</p>
						</div>
						<div class="col-md-2 visible-md visible-lg"><span class="num">02.</span></div>
						<div class="col-md-10">
							<h5 class="yellow">Easy to use</h5>
							<p>Key in your pick-up and drop-off locations to get your estimated fare.</p>
						</div>						
					</div>
				</div>
				<div class="col-md-4 col-md-push-4 col-sm-12">
					<div class="items items-right row">
						<div class="col-md-10">
							<h5 class="yellow">GPS searching</h5>
							<p>Know your driver’s location and estimated time of arrival in real-time.</p>
						</div>
						<div class="col-md-2 visible-md visible-lg"><span class="num">03.</span></div>
						<div class="col-md-10">
							<h5 class="yellow">Bonuses for ride</h5>
							<p>We provide Cost-efficient highly convenient transportation solution.</p>
						</div>						
						<div class="col-md-2 visible-md visible-lg"><span class="num">04.</span></div>
					</div>				
				</div>				
				<div class="col-md-4 col-md-pull-4 col-sm-12">
					<div class="mob">
						<a href="#"><img src="assets/images/_app-google.png" alt="App"></a>
						<a href="#"><img src="assets/images/_app-apple.png" alt="App"></a>
					</div>
				</div>

			</div>
		</div>
	</section>			<section id="car-block">
	 	<div class="car-right animation-block"><img src="assets/images/_car-big-side.png" alt="Car"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h4 class="yellow">For Drivers</h4>
					<h2 class="h1">Do You Want To Earn With Us?</h2>
				</div>
				<div class="col-md-6">
					<p>You can drive and make as much as you want. And, the more you drive, the more you could make. Plus, your fares get automatically deposited weekly.</p>

					<ul class="check two-col strong">
						<li>Luxury cars</li>
						<li>No fee</li>
						<li>Weekly payment</li>
						<li>Fixed price</li>
						<li>Good application</li>
						<li>Stable orders</li>
					</ul>

					<a href="#" class="btn btn-yellow btn-lg btn-white">Become a Driver</a>
				</div>
			</div>
		</div>
	</section>			
		
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

	<section id="block-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 col-ms-6">
					<h4>About us</h4>
                                        <p>
                                            GoCheeta is the official brand of Digital Mobility Solutions Lanka (PVT) Ltd., a software service provider, founded in June 2015.The GoCheeta software is a platform that facilitates a real time connection between the taxi passenger and the taxi driver, enabling mutual engagement for the receipt and delivery of a seamless service.
                                        </p>

					<div class="social-small social-yellow">
						<a href="#" class="fa fa-twitter"></a>
						<a href="#" class="fa fa-facebook"></a>
						<a href="#" class="fa fa-instagram"></a>
						<a href="#" class="fa fa-google-plus"></a>
						<a href="#" class="fa fa-pinterest"></a>
					</div>					
				</div>
				<div class="col-lg-5 col-md-5 hidden-md hidden-sm hidden-xs hidden-ms">					
					<h4>Explore</h4>
					<div class="row">
						<div class="col-md-5">
							<ul class="nav navbar-nav">
								<li class="active"><a href="#">Get Taxi</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">Tariffs</a></li>
								<li><a href="#">Application</a></li>

							</ul>						
						</div>
						<div class="col-md-5">
							<ul class="nav navbar-nav">
								<li><a href="#">Become a driver</a></li>
								<li><a href="#">Testimonials</a></li>
								<li><a href="#">Contacts</a></li>
								<li><a href="#">Pages</a></li>
							</ul>						
						</div>						
					</div>

				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-ms-6">					
					<h4>Contact us</h4>
					<p><span class="yellow">Address:</span> 23/2, Galle Road, Dehiwala</p>

					<ul class="address">
						<li><span class="bi bi-phone"></span>011 10 21 010</li>
						<li><span class="bi bi-envelope"></span><a href="#">info.gocheeta@gmail.com</a></li>
						<li><span class="bi bi-skype"></span>gocheeta</li>
					</ul>					
				</div>		
			</div>
		</div>
	</section>

	<footer>
		<div class="container">
			<a href="http://like-themes.com">GoCheeta</a> 2022 © All Rights Reserved <a href="#">Terms of use</a>
			<a href="#" class="go-top hidden-xs hidden-ms"></a>
		</div>
	</footer>

	<script>var base_href = '/';</script>
	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>	

	<script type="text/javascript" src="assets/js/plugins.min.js"></script>		
	
    <script src="assets/js/map-style.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTRSHf8sjMCfK9PHPJxjJkwrCIo5asIzE"></script>	
	<script type="text/javascript" src="assets/js/scripts.js"></script>

        <script>
            
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
                          
                                html += "<div class='col-md-3 col-sm-6 ' style='margin-top:2%; cursor: pointer' onclick='loginPageRedirect(\""+dataArr2[1]+"\")'>\n\
                                            <div class='item matchHeight'>\n\
                                                <div class='image'>\n\
                                                        <img src='"+dataArr2[2]+"' class='full-width' alt='Tariff'>\n\
                                                </div>\n\
                                                <h4>"+dataArr2[1]+"</h4>\n\
                                                <p>Paymnt for first "+dataArr2[3]+" KM : RS."+dataArr2[4]+".00 </p>\n\
                                                <div class='price'>RS."+dataArr2[5]+"<span>/km</span></div>\n\
                                            </div>\n\
                                        </div>";
                      }
                      $('.vehicle_category_container').empty().append(html);
                }
            }
        });
        
        function loginPageRedirect(data){
            location.href = 'login.jsp?id='+data;
        }
	</script>
        
</body>
</html>