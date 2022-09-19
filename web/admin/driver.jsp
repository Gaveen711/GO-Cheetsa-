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
                  <h4 class="card-title">Driver Table</h4>
                  <p class="card-description">
                    Admin can view all driver' profile
                  </p>
                 
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered" id="driverTable">
                      <thead>
                        <tr class="bg-dark text-white">
                            <th class="text-center">Driver id</th>
                            <th class="text-center">Driver name</th>
                            <th class="text-center">Address</th>
                            <th class="text-center">Telephone Number</th>
                            <th class="text-center">Driver Email</th>
                            <th class="text-center">License Number</th>
                            <th class="text-center">Insurance Number</th>
                            <th class="text-center">Branch</th>
                            <th class="text-center">Action</th>
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
        url: "../get_driver",
        type: 'POST',
        success: function(data) {
                var dataArr = data.split('!!!!');
                var tableRef2 = document.getElementById('driverTable').getElementsByTagName('tbody')[0];

                for (let index = 0; index < dataArr.length; index++){
                    var dataArr2 = dataArr[index].split(',,');
                    //insert Row
                    tableRef2.insertRow().innerHTML = 
                    "<th class='text-center'>" + dataArr2[0]+ "</th>" + 
                    "<td class='text-center'>" + dataArr2[2]+ "</td>" + 
                    "<td class='text-center'>" + dataArr2[3]+ "</td>" + 
                    "<td>" +dataArr2[4]+ "</td>"+
                    "<td class='text-center'>" +dataArr2[5]+ "</td>"+
                    "<td class='text-center'>" +dataArr2[8]+ "</td>"+
                    "<td class='text-center'>" +dataArr2[9]+ "</td>"+
                    "<td class='text-center'>" +dataArr2[13]+ "</td>"+
                    "<td class='text-center'> <button type='button' name='delete'   onclick='updateDriver(" +dataArr2[0]+ ")' class='btn btn-warning btn-sm'><i class='bi bi-pen text-white' ></i></button></td>";
                }
        }
    });
    
     function deleteUser(id){
        $.ajax({
            url: "../deleteUser",
            type: 'POST',
            data : {
                id:id
            },
            success: function(data) {
                    if(parseInt(data) == 1){
                        alert("User Deleting Success");
                    }else{
                        alert("User Deleting Not Success");
                    }
                    location.reload();
            }
        });
    }
  </script>
</body>

</html>


