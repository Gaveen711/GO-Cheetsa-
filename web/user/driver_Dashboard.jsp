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
			<h2 class="h1 text-center">Driver Dashboard</h2>
		</div>
	</section>		
       	<section id="car-block mt-0 ">
		<div class="container">
			<table class="table mt-3" id="bookingHistroryTbl">
                            <thead>
                                <tr class="bg-dark">
                                    <th  class="text-white">Trip Id</th>
                                    <th  class="text-white">Start Location</th>
                                    <th  class="text-white">End Location</th>
                                    <th  class="text-white">Price (RS)</th>
                                    <th  class="text-white">Vehicle</th>
                                    <th  class="text-white">Date</th>
                                    <th  class="text-white">Branch</th>
                                    <th  class="text-white">Status</th>
                                    <th  class="text-white text-center">Action</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>

                              </tr>

                            </tbody>
                        </table>
		</div>
	</section>			
        <br/><br/><br/><br/>


        <jsp:include page="footer.jsp"/>
        
	<script>var base_href = '/';</script>
	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>	

	<script type="text/javascript" src="assets/js/plugins.min.js"></script>		
	
        <script src="assets/js/map-style.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTRSHf8sjMCfK9PHPJxjJkwrCIo5asIzE"></script>	
	<script type="text/javascript" src="assets/js/scripts.js"></script>

        <script>
         $.ajax({
            url: "../get_all_booking_for_driver",
            type: 'POST',
            success: function(data) {
              
                      var dataArr = data.split('!!!!');
                      if(dataArr.length > 0){
                      //get table body:
                      var tableRef = document.getElementById('bookingHistroryTbl').getElementsByTagName('tbody')[0];
                      
                            for (let index = 0; index < dataArr.length; index++){
                                var dataArr2 = dataArr[index].split(',,');
                                    if(dataArr2[8] == "Canceled"){
                                            tableRef.insertRow().innerHTML = 
                                            "<th class='text-center'>" + dataArr2[0]+ "</th>" + 
                                            "<td>" +dataArr2[4]+ "</td>"+
                                            "<td>" +dataArr2[5]+ "</td>"+
                                            "<td>" +dataArr2[9]+ "</td>"+
                                            "<td>" +dataArr2[2]+ "</td>"+
                                            "<td>" +dataArr2[6]+ "</td>"+
                                            "<td>" +dataArr2[11]+ "</td>"+
                                            "<td>" +dataArr2[8]+ "</td>"+
                                            "<td class='text-center'><button  type='button' name='accept'  disabled id='btn_cancel' class='btn btn-danger btn-sm ml-5'>Canceled</button></td>";
                                    }else if(dataArr2[8] == "Booked"){
                                          tableRef.insertRow().innerHTML = 
                                            "<th class='text-center'>" + dataArr2[0]+ "</th>" + 
                                            "<td>" +dataArr2[4]+ "</td>"+
                                            "<td>" +dataArr2[5]+ "</td>"+
                                            "<td>" +dataArr2[9]+ "</td>"+
                                            "<td>" +dataArr2[2]+ "</td>"+
                                            "<td>" +dataArr2[6]+ "</td>"+
                                            "<td>" +dataArr2[11]+ "</td>"+
                                            "<td>" +dataArr2[8]+ "</td>"+
                                            "<td class='text-center'><button  type='button' name='accept'  onclick='acceptTrip(" +dataArr2[0]+ ")' id='btn_cancel' class='btn btn-success btn-sm ml-5'>Accepts</button><button  type='button' name='accept'  onclick='rejectTrip(" +dataArr2[0]+ ")' id='btn_cancel' class='btn btn-danger btn-sm ml-5'>Reject</button></td>";
                                    }else if(dataArr2[8] == "Accept"){
                                          tableRef.insertRow().innerHTML = 
                                            "<th class='text-center'>" + dataArr2[0]+ "</th>" + 
                                            "<td>" +dataArr2[4]+ "</td>"+
                                            "<td>" +dataArr2[5]+ "</td>"+
                                            "<td>" +dataArr2[9]+ "</td>"+
                                            "<td>" +dataArr2[2]+ "</td>"+
                                            "<td>" +dataArr2[6]+ "</td>"+
                                            "<td>" +dataArr2[11]+ "</td>"+
                                            "<td>" +dataArr2[8]+ "</td>"+
                                            "<td class='text-center'><button  type='button' name='accept'  onclick='complete(" +dataArr2[0]+ ")' id='btn_cancel' class='btn btn-warning btn-sm ml-5'>Complete</button></td>";
                                    }else if(dataArr2[8] == "Completed"){
                                          tableRef.insertRow().innerHTML = 
                                            "<th class='text-center'>" + dataArr2[0]+ "</th>" + 
                                            "<td>" +dataArr2[4]+ "</td>"+
                                            "<td>" +dataArr2[5]+ "</td>"+
                                            "<td>" +dataArr2[9]+ "</td>"+
                                            "<td>" +dataArr2[2]+ "</td>"+
                                            "<td>" +dataArr2[6]+ "</td>"+
                                            "<td>" +dataArr2[11]+ "</td>"+
                                            "<td>" +dataArr2[8]+ "</td>"+
                                            "<td class='text-center'><button  type='button' name='accept'   disabled id='btn_cancel' class='btn btn-primary btn-sm ml-5'>Completed</button></td>";
                                    }else if(dataArr2[8] == "Reject"){
                                          tableRef.insertRow().innerHTML = 
                                            "<th class='text-center'>" + dataArr2[0]+ "</th>" + 
                                            "<td>" +dataArr2[4]+ "</td>"+
                                            "<td>" +dataArr2[5]+ "</td>"+
                                            "<td>" +dataArr2[9]+ "</td>"+
                                            "<td>" +dataArr2[2]+ "</td>"+
                                            "<td>" +dataArr2[6]+ "</td>"+
                                            "<td>" +dataArr2[11]+ "</td>"+
                                            "<td>" +dataArr2[8]+ "</td>"+
                                            "<td class='text-center'><button  type='button' name='accept'   disabled id='btn_cancel' class='btn btn-danger btn-sm ml-5'>Reject</button></td>";
                                    }
                                  
                                    
                            }
                      }
            }
        });
        
        function acceptTrip(id){
          $.ajax({
            url: "../driver_staus_update_booking",
            type: 'POST',
            data : {
                id:id,
                status : 'Accept'
            },
            success: function(data) {
                    if(parseInt(data) == 1){
                        alert("Booking Accepted");
                    }else{
                        alert("Booking Not Accepted");
                    }
                    location.reload();
            }
          });
        }
        
        function rejectTrip(id){
           $.ajax({
            url: "../driver_staus_update_booking",
            type: 'POST',
            data : {
                id:id,
                status : 'Reject'
            },
            success: function(data) {
                    if(parseInt(data) == 1){
                        alert("Booking Rejected");
                    }else{
                        alert("Booking Not Rejected");
                    }
                    location.reload();
            }
          });  
        }
        
                
        function complete(id){
          $.ajax({
            url: "../driver_staus_update_booking",
            type: 'POST',
            data : {
                id:id,
                status : 'Completed'
            },
            success: function(data) {
                    if(parseInt(data) == 1){
                        alert("Booking Accepted");
                    }else{
                        alert("Booking Not Accepted");
                    }
                    location.reload();
            }
          });
        }
  </script>
        
</body>
</html>