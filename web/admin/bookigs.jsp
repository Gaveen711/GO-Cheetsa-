<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
   <jsp:include page="commo_part_head.jsp"/>
<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <jsp:include page="commo_part_head_link.jsp"/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
   
      <jsp:include page="commo_part_slide.jsp"/>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                  <h3 class="font-weight-bold">Welcome Admin</h3>
                  <h6 class="font-weight-normal mb-0">Manage Largest Taxi Service In Sri Lanka</h6>
                </div>
                <div class="col-12 col-xl-4">
                 
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Booking Table</h4>
                  <p class="card-description">
                    Admin can view all booking' details
                  </p>
                 
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered" id="bookingHistroryTbl">
                      <thead>
                        <tr class="bg-dark text-white">
                            <th  class="text-white">Trip Id</th>
                            <th  class="text-white">Start Location</th>
                            <th  class="text-white">End Location</th>
                            <th  class="text-white">Price (RS)</th>
                            <th  class="text-white">Vehicle</th>
                            <th  class="text-white">Date</th>
                            <th  class="text-white">Branch</th>
                            <th  class="text-white">Status</th>
                        </tr>
                      </thead>
                      <tbody >
                         
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="vendors/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/jquery.cookie.js" type="text/javascript"></script>
  <script src="js/dashboard.js"></script>
  <script src="js/Chart.roundedBarCharts.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>

            $.ajax({
            url: "../get_All_bookings",
            type: 'POST',
            success: function(data) {
              
                      var dataArr = data.split('!!!!');
                      if(dataArr.length > 0){
                      //get table body:
                      var tableRef = document.getElementById('bookingHistroryTbl').getElementsByTagName('tbody')[0];
                      
                            for (let index = 0; index < dataArr.length; index++){
                                var dataArr2 = dataArr[index].split(',,');
                                    
                                            tableRef.insertRow().innerHTML = 
                                            "<th class='text-center'>" + dataArr2[0]+ "</th>" + 
                                            "<td>" +dataArr2[4]+ "</td>"+
                                            "<td>" +dataArr2[5]+ "</td>"+
                                            "<td>" +dataArr2[9]+ "</td>"+
                                            "<td>" +dataArr2[2]+ "</td>"+
                                            "<td>" +dataArr2[6]+ "</td>"+
                                            "<td>" +dataArr2[11]+ "</td>"+
                                            "<td>" +dataArr2[8]+ "</td>";
                            }
                      }
            }
        });
  </script>
</body>

</html>


