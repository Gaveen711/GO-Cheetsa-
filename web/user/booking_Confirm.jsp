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
	<section>
		<div class="container">
			<h2 class="h1 text-center">Booking Confirm</h2>
		</div>
                <div class="container" >
                    <div class="row">
                        <div class="col-sm-6">
                            <div sytle="border:1px solid #E5E7E5; margin-left:25%;">
                                <center><h4><u>Driver Details</u></h4></center>
                                <h4 style="line-height:15px; padding: 0%;">Driver Name : <span id="driverName"></span></h4>
                                <h4 style="line-height:15px; margin-top: 3%; padding: 0%;">Driver ID : <span id="driverID"></span></h4>
                                <h4 style="line-height:15px; margin-top: 3%; padding: 0%;">Vehicle Type : <span id="vehicleType"></span></h4>
                                <h4 style="line-height:15px; margin-top: 3%; padding: 0%;">Model : <span id="Model"></span></h4>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <form action="../add_booking" method="post">
                                <center><h4><u>Submit Booking Details</u></h4></center>
                                <br/>
                                <label>Start From</label>
                                <div class="row g-3 mt-3">
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="startLocation" placeholder="Start Location" >
                                        <input type="hidden" name="vehicleTypeTXT" id="vehicleTypeTXT" />
                                        <input type="hidden" name="driverTXt" id="driverTXt" />
                                        <input type="hidden" name="vehicleNumTXT" id="vehicleNumTXT" />
                                    </div>
                                    <div class="col-sm-6">
                                        <select class="form-control branch_container" name="branch" id="branch">
                                            
                                        </select>
                                    </div>
                                </div>
                                <br/>
                                <label>End From</label>
                                <div class="row g-3 mt-3">
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="endLocation" placeholder="End Location" >
                                    </div>
                                    <div class="col-sm-6">
                                           <select id="end_near_city" name="end_near_city" class="form-control">
                                                <option value="">Select End Location Nearest City</option>
                                                <option value="Battaramulla South">Battaramulla South</option>
                                                <option value="Beruwala">Beruwala</option>
                                                <option value="Colombo">Colombo</option>
                                                <option value="Colombo District">Colombo District</option>
                                                <option value="Gampaha">Gampaha</option>
                                                <option value="Gampaha District">Gampaha District</option>
                                                <option value="Hanwella Ihala">Hanwella Ihala</option>
                                                <option value="Hendala">Hendala</option>
                                                <option value="Horana South">Horana South</option>
                                                <option value="Horawala Junction">Horawala Junction</option>
                                                <option value="Ja Ela">Ja Ela</option>
                                                <option value="Kalutara">Kalutara</option>
                                                <option value="Kandana">Kandana</option>
                                                <option value="Katunayaka">Katunayaka</option>
                                                <option value="Kelaniya">Kelaniya</option>
                                                <option value="Kotikawatta">Kotikawatta</option>
                                                <option value="Minuwangoda">Minuwangoda</option>
                                                <option value="Mulleriyawa">Mulleriyawa</option>
                                                <option value="Negombo">Negombo</option>
                                                <option value="Panadura">Panadura</option>
                                                <option value="Peliyagoda">Peliyagoda</option>
                                                <option value="Pita Kotte">Pita Kotte</option>
                                                <option value="Sri Jayewardenepura Kotte">Sri Jayewardenepura Kotte</option>
                                                <option value="Wattala">Wattala</option>
                                                <option value="Welisara">Welisara</option>
                                            </select>
                                    </div>
                                </div>
                                <br/>
                                <center class="mt-1">
                                    <button class="btn btn-warning" type="button" style="padding-top: 2%; padding-bottom: 2%;" onclick="priceCal()">Calculate Price</button>
                                </center>
                                <center><h4>Total Price : RS.00 </h4></center>
                                <center class="mt-1">
                                    <button class="btn btn-warning" style="padding-top: 2%; padding-bottom: 2%;" type="submit" disabled="true" id="BookedBtn">Submit Trip</button>
                                </center>
                            </form>
                            
                        </div>
                    </div>
                </div>
	</section>		
        <br/><br/><br/><br/><br/><br/>
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
            const driver = urlParams.get('driver');
            const VehicleNumber = urlParams.get('VehicleNumber');
            const Driver_Id = urlParams.get('Driver_Id');
            const model = urlParams.get('model');
            const selectedVC = urlParams.get('selectedVC');
            
            
            document.getElementById("driverName").innerHTML = driver;
            document.getElementById("vehicleType").innerHTML = VehicleNumber;
            document.getElementById("driverID").innerHTML = Driver_Id;
            document.getElementById("Model").innerHTML = model;
            document.getElementById("vehicleTypeTXT").value = selectedVC;
            document.getElementById("driverTXt").value = Driver_Id;
            document.getElementById("vehicleNumTXT").value = VehicleNumber;
            
        function priceCal(){
            
            var end_city_lat = "";
            var end_city_lon = "";
            
            var start_city_lat = "";
            var start_city_lon = "";
            
            document.getElementById("BookedBtn").disabled = false;
            
            $.ajax({
                url: 'http://api.positionstack.com/v1/forward',
                data: {
                  access_key: 'b29be0d9ba9bd5c4c87e31b637b1c1ad',
                  query: document.getElementById("end_near_city").value,
                  limit: 1
                }
            }).done(function(response) {
                start_city_lat = response.data[0].latitude;
                start_city_lon = response.data[0].longitude;
            });
            
            $.ajax({
                url: 'http://api.positionstack.com/v1/forward',
                data: {
                  access_key: 'b29be0d9ba9bd5c4c87e31b637b1c1ad',
                  query: document.getElementById("branch").value,
                  limit: 1
                }
            }).done(function(response) {
                end_city_lat = response.data[0].latitude;
                end_city_lon = response.data[0].longitude;
            });
            
            alert(calcCrow(start_city_lat,start_city_lon,end_city_lat,end_city_lon).toFixed(1));
        }
        
         function calcCrow(lat1, lon1, lat2, lon2) 
        {
          var R = 6371; // km
          var dLat = toRad(lat2-lat1);
          var dLon = toRad(lon2-lon1);
          var lat1 = toRad(lat1);
          var lat2 = toRad(lat2);

          var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
          var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
          var d = R * c;
          return d;
        }

        // Converts numeric degrees to radians
        function toRad(Value) 
        {
            return Value * Math.PI / 180;
        }
        
        $.ajax({
            url: "../get_all_branch",
            type: 'POST',
            success: function(data) {

                      var dataArr = data.split('!!!!');
                      if(dataArr.length > 0){
                            var html="";
                            html += '<option>Select Nearest Branch</option>';
                            for (let index = 0; index < dataArr.length; index++){
                                var dataArr2 = dataArr[index].split(',,');

                                    html += '<option value="'+dataArr2[1]+'">'+dataArr2[1]+'</option>';
                            }
                            $('.branch_container').empty().append(html);
                      }
            }
        });
            
	</script>
        
</body>
</html>