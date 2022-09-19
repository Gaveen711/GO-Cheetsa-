<!DOCTYPE html>
<html lang="en">

 <jsp:include page="commo_part_head_link.jsp"/>


<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <jsp:include page="commo_part_head.jsp"/>
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

         
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Vehicle List</h4>
                  <div class="text-right">
                        <button type="button" class="btn btn-dark btn-sm btn-icon-text" onclick="addVehicleModel()">
                          <i class="ti-file btn-icon-prepend"></i> 
                          Add Vehicle
                        </button>
                  </div>
                  <div class="modal fade" id="vehicleModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                      <div class="modal-content ">
                        <div class="modal-header bg-dark">
                          <h4 class="modal-title text-white">Add New Vehicle</h4>
                          <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="forms-sample" action="../add_vehicle" method="post">
                              <div class="form-group">
                                <label >Vehicle Types</label>
                                <select class="form-control vehicle_category_container" name="vehicleType">
                                   
                                </select>
                              </div>
                              <div class="form-group">
                                <label >Model</label>
                                <input type="text" class="form-control" id="Model" name="Model" placeholder="Model">
                              </div>
                              <div class="form-group">
                                <label >Vehicle Number</label>
                                <input type="text" class="form-control" id="VehicleNumber" name="VehicleNumber" placeholder="Vehicle Number">
                              </div>
                              <div class="form-group">
                                <label >Insurance Number</label>
                                <input type="text" class="form-control" id="InsuranceNumber" name="InsuranceNumber" placeholder="Insurance Number">
                              </div>
                              <div class="form-group">
                                <label >Chassis Number</label>
                                <input type="text" class="form-control" id="ChassisNumber" name="ChassisNumber" placeholder="Chassis Number">
                              </div>
                              <div class="form-group">
                                <label >Book Owner</label>
                                <input type="text" class="form-control" id="BookOwner" name="BookOwner" placeholder="Book Owner">
                              </div>
                              <div class="form-group">
                                <label >Book Owner Tel</label>
                                <input type="text" class="form-control" id="BookOwnerTel" name="BookOwnerTel" oninput="homeNumber()" placeholder="Book Owner Tel">
                                <small id="result_home_tel"></small>
                              </div>
                              <div class="form-group">
                                <label >Branch</label>
                                <select class="form-control branch_container" name="branch">
                                </select>
                              </div>
                              <div class="form-check form-check-flat form-check-primary text-end">
                                <button type="submit" class="btn btn-primary me-2">Submit</button>
                                <button type="button" class="btn btn-light" onclick="closeModel()">Cancel</button>
                              </div>
                            </form>
                        </div>
                       
                      </div>
                    </div>
                  </div>
                  <div class="modal fade" id="viewDriver" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header bg-dark">
                          <h4 class="modal-title text-white">View Driver</h4>
                          <button type="button" class="btn-close " onclick="close_driver_profile()"></button>
                        </div>
                        <div class="modal-body">
                            <p>Name : <span id="nametxt"></span></p>
                            <p>Address : <span id="addresstxt"></span></p>
                            <p>Telephone Number : <span id="teltxt"></span></p>
                            <p>Email : <span id="emailtxt"></span></p>
                            <p>Birthday : <span  id="bdaytxt"></span></p>
                            <p>Age : <span  id="agetxt"></span></p>
                            <p>License Number : <span id="Licensetxt"></span></p>
                            <p>License Type : <span id="LicensTypeetxt"></span></p>
                            <p>Insurance Number : <span id="Insurancetxt"></span></p>
                            <p>Blood Type : <span id="Bloodtxt"></span></p>
                        </div>
                        <div class="modal-footer border-0">
                          <button type="button" class="btn btn-secondary" onclick="close_driver_profile()">Close</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="table-responsive mt-3">
                    <table class="table" id="VehicleTbl">
                      <thead>
                          <tr class="bg-dark">
                                <th class="text-center text-white">Vehicle id</th>
                                <th class="text-center text-white">Vehicle Number</th>
                                <th class="text-center text-white">Type</th>
                                <th class="text-center text-white">Model</th>
                                <th class="text-center text-white">Chassis Number</th>
                                <th class="text-center text-white">Insurance Number</th>
                                <th class="text-center text-white">Owner</th>
                                <th class="text-center text-white">Owner Tel</th>
                                <th class="text-center text-white">Branch</th>
                                <th class="text-center text-white">Action</th>
                        </tr>
                      </thead>
                      <tbody class="bg-light">
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                  <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © <script>document.write(new Date().getFullYear())</script>. All rights reserved.</span>
                </div>
            </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
            $.ajax({
                url: "../get_all_vehicle_category",
                type: 'POST',
                success: function(data) {

                          var dataArr = data.split('!!!!');
                          if(dataArr.length > 0){
                                var html="";
                                html += '<option>Select Vehicle Category</option>';
                                for (let index = 0; index < dataArr.length; index++){
                                    var dataArr2 = dataArr[index].split(',,');
                                       
                                        html += '<option value="'+dataArr2[1]+'">'+dataArr2[1]+'</option>';
                                }
                                $('.vehicle_category_container').empty().append(html);
                          }
                }
            });
            
            $.ajax({
                url: "../get_all_branch",
                type: 'POST',
                success: function(data) {

                          var dataArr = data.split('!!!!');
                          if(dataArr.length > 0){
                                var html="";
                                html += '<option>Select Branch</option>';
                                for (let index = 0; index < dataArr.length; index++){
                                    var dataArr2 = dataArr[index].split(',,');
                                       
                                        html += '<option value="'+dataArr2[1]+'">'+dataArr2[1]+'</option>';
                                }
                                $('.branch_container').empty().append(html);
                          }
                }
            });
        
            function homeNumber(){
                var phoneno = /^\d{10}$/;
                if($('#BookOwnerTel').val().match(phoneno))
                {
                  document.getElementById("result_home_tel").innerHTML = "Valid Phone Number";
                  document.getElementById("result_home_tel").style.color = "green";
                  homeAddressIsEmpty = 1;
                }else{
                  document.getElementById("result_home_tel").innerHTML = "Invalid Phone Number";
                  document.getElementById("result_home_tel").style.color = "red";
                }
            }
            $.ajax({
              url: "../get_vehicle",
              type: 'POST',
              success: function(data) {
                      var dataArr = data.split('!!!!');
                      if (dataArr && dataArr.length) {
                      
                            var tableRef = document.getElementById('VehicleTbl').getElementsByTagName('tbody')[0];
                            
                            for (let index = 0; index < dataArr.length; index++){
                                var dataArr2 = dataArr[index].split(',,');
                                if((dataArr[index] != "") || (dataArr[index] == undefined)){
                                //insert Row
                                tableRef.insertRow().innerHTML = 
                                "<th class='text-center'>" + dataArr2[0]+ "</th>" + 
                                "<td>" +dataArr2[1]+ "</td>"+
                                "<td class='text-center'>" +dataArr2[2]+ "</td>"+
                                "<td class='text-center'>" +dataArr2[3]+ "</td>"+
                                "<td class='text-center'>" +dataArr2[4]+ "</td>"+
                                "<td class='text-center'>" +dataArr2[5]+ "</td>"+
                                "<td class='text-center'>" +dataArr2[6]+ "</td>"+
                                "<td class='text-center'>" +dataArr2[7]+ "</td>"+
                                "<td class='text-center'>" +dataArr2[8]+ "</td>"+
                                "<td > <button type='button' name='delete'  onclick='deleteVehicle(" +dataArr2[0]+ ")' class='btn btn-danger btn-sm '><i class='bi bi-trash-fill'></i></button>\n\
                                      &nbsp;&nbsp;&nbsp;<button type='button' name='delete'   onclick='updateProduct(" +dataArr2[0]+ ")' class='btn btn-warning btn-sm '><i class='bi bi-pencil-square'></i></button>\n\
                                      &nbsp;&nbsp;&nbsp;<button type='button' name='addDricer'   onclick='driverProfile(" +dataArr2[0]+ ")' class='btn btn-success btn-sm '><i class='bi bi-person-circle'></i></button></td>";
                            }
                        }
                      }
                }
            });
      
            function deleteVehicle(id){
                $.ajax({
                    url: "../delete_vehicle",
                    type: 'POST',
                    data : {
                        id:id
                    },
                    success: function(data) {
                            if(parseInt(data) == 1){
                                alert("Vehicle Deleting Success");
                            }else{
                                alert("Vehicle Deleting Not Success");
                            }
                            location.reload();
                    }
                });
            }
            
            function driverProfile(id){
               
               $.ajax({
                    url: "../get_oneDriver",
                    type: 'POST',
                    data : {
                      id : id  
                    },
                    success: function(data) {
                      var dataArr = data.split('!!!!');
                      var dataArr2 = dataArr[0].split(',,');
                      document.getElementById('nametxt').innerHTML = dataArr2[0];
                      document.getElementById('addresstxt').innerHTML = dataArr2[1];
                      document.getElementById('nametxt').innerHTML = dataArr2[2];
                      document.getElementById('addresstxt').innerHTML = dataArr2[3];
                      document.getElementById('teltxt').innerHTML = dataArr2[4];
                      document.getElementById('emailtxt').innerHTML = dataArr2[5];
                      document.getElementById('bdaytxt').innerHTML = dataArr2[6];
                      document.getElementById('agetxt').innerHTML = dataArr2[7];
                      document.getElementById('Bloodtxt').innerHTML = dataArr2[10];
                      document.getElementById('Licensetxt').innerHTML = dataArr2[8];
                      document.getElementById('Insurancetxt').innerHTML = dataArr2[9];
                      document.getElementById('LicensTypeetxt').innerHTML = dataArr2[11];
                }
              });
              $('#viewDriver').modal('show');
            }
            
            function close_driver_profile(){
               $('#viewDriver').modal('hide'); 
            }
            
            document.getElementById('updateBtn').style.display = "none";
            function addVehicleModel(){
                $('#vehicleModal').modal('show');
            }
        
            function closeModel(){
                $('#vehicleModal').modal('hide');
            }
            
            function updateVehicleCategory(){
                 $.ajax({
                     url: "../update_vehice_Category",
                     type: 'POST',
                     data : {
                         id : document.getElementById('cID').value,
                         categoryName:document.getElementById('categoryName').value,
                         imageURl:document.getElementById('imageURl').value
                     },
                     success: function(data) {

                             if(parseInt(data) == 1){
                                 alert("Vehicle Category Updating Success");
                             }else{
                                 alert("Vehicle Category Updating Not Success");
                             }
                             location.reload();
                     }
                 });
            }
        
            function submitVehicleCategory(id){
                 $.ajax({
                     url: "../add_vehicle_category",
                     type: 'POST',
                     data : {
                         categoryName:document.getElementById('categoryName').value,
                         imageURl:document.getElementById('imageURl').value
                     },
                     success: function(data) {
                             if(parseInt(data) == 1){
                                 alert("Vehicle Category Adding Success");
                             }else{
                                 alert("Vehicle Category Adding Not Success");
                             }
                             location.reload();
                     }
                 });
             }
             
            function clear(){
                document.getElementById('categoryName').value = "";
                document.getElementById('imageURl').value = "";
                document.getElementById('submitBtn').style.display = "inline";
                document.getElementById('updateBtn').style.display = "none";
            }
        
            $.ajax({
                url: "../get_all_vehicle_category",
                type: 'POST',
                success: function(data) {

                          var dataArr = data.split('!!!!');
                          if(dataArr.length > 0){
                          //get table body:
                          var tableRef = document.getElementById('VehicleCategoryTbl').getElementsByTagName('tbody')[0];

                                for (let index = 0; index < dataArr.length; index++){
                                    var dataArr2 = dataArr[index].split(',,');
                                        tableRef.insertRow().innerHTML = 
                                        "<th class='text-center'>" + dataArr2[1]+ "</th>" + 
                                        "<td  class='text-center'>" +dataArr2[2]+ "</td>"+
                                        "<td class='text-center'>\n\
                                                <button  type='button' name='delete'  onclick='deleteVC(" +dataArr2[0]+ ")' id='btn_cancel' class='btn btn-danger btn-sm ml-5'>Cancel</button><button  type='button' name='update'  onclick='updateVC("+dataArr2[0]+")' id='btn_update' class='btn btn-success btn-sm ml-5'>Update</button>\n\
                                        </td>";
                                }
                          }
                }
            });
            
            function updateVC(id){

                 $.ajax({
                        url: "../getVehicleCategoryOne",
                        type: 'POST',
                        data : {
                          id : id  
                        },
                        success: function(data) {
                          var dataArr2 = data.split(',,');
                          document.getElementById('cID').value = dataArr2[0];
                          document.getElementById('categoryName').value = dataArr2[1];
                          document.getElementById('imageURl').value = dataArr2[2];
                          document.getElementById('submitBtn').style.display = "none";
                          document.getElementById('updateBtn').style.display = "inline";
                    }
                  });
            }
            
            function deleteVC(id){
                $.ajax({
                    url: "../delete_vehicle_category",
                    type: 'POST',
                    data : {
                        id:id
                    },
                    success: function(data) {
                        if(parseInt(data) == 1){
                            alert("Vehicle Category Deleted");
                        }else{
                            alert("Vehicle Category Not Deleteds");
                        }
                        location.reload();
                    }
                });
            }

  </script>
  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="js/dataTables.select.min.js"></script>

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
</body>


<!-- Mirrored from bootstrapdash.com/demo/skydash-free/template/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 08 Sep 2022 12:54:17 GMT -->
</html>

