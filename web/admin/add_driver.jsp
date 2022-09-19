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
                  <h4 class="card-title">Add Driver</h4>
                  <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                      <div class="card">
                        <div class="card-body">
                                <form class="forms-sample" action="../add_driver" method="post">
                                      <input type="hidden" class="form-control" id="vehicleID" name="vehicleID">
                                      <div class="form-group">
                                        <label >Driver's Name</label>
                                        <input type="text" class="form-control" id="driverName" name="driverName" placeholder="Driver's Name">
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's Address</label>
                                        <input type="text" class="form-control" id="address" name="address" placeholder="Driver's Address">
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's Telephone Number</label>
                                        <input type="tel" class="form-control" id="telephoneNumber" name="telephoneNumber" oninput="home_Number()" placeholder="Driver's Telephone Number">
                                        <small id="result_tel"></small>
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's Email</label>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Driver's Email"  oninput="email_Check()" >
                                        <small id="result_email"></small>
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's Password</label>
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Driver's Password"  ssss>
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's Birth Day</label>
                                        <input type="date" class="form-control" id="birthDay" name="birthDay" placeholder="Driver's Birth Day">
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's Age</label>
                                        <input type="number" class="form-control" id="age" name="age" placeholder="Driver's Age" oninput="age_Check()" />
                                        <small id="result_age"></small>
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's License Number</label>
                                        <input type="text" class="form-control" id="licenceNumber" name="licenceNumber" placeholder="Driver's License Number">
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's License Type</label>
                                        <select  class="form-control" id="licenceType" name="licenceType" >
                                            <option>Select License Type</option>
                                            <option value="Light Weight Vehicle">Light Weight Vehicle</option>
                                            <option value="Heavy Weight Vehicle">Heavy Weight Vehicle</option>
                                        </select>
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's Insurance Number</label>
                                        <input type="text" class="form-control" id="insuranceNumber" name="insuranceNumber" placeholder="Driver's Insurance Number">
                                      </div>
                                      <div class="form-group">
                                        <label >Driver's Blood Type</label>
                                        <select  class="form-control" id="bloodType" name="bloodType" >
                                            <option>Select Blood Type</option>
                                            <option value="A+">A+</option>
                                            <option value="A-">A-</option>
                                            <option value="B+">B+</option>
                                            <option value="B-">B-</option>
                                            <option value="AB+">AB+</option>
                                            <option value="AB-">AB-</option>
                                            <option value="O+">O+</option>
                                            <option value="O-">O-</option>
                                        </select>
                                      </div>
                                      <div class="form-group">
                                        <label >Branch</label>
                                        <select class="form-control branch_container" name="branch">
                                            
                                        </select>
                                      </div>
                                      <div class="form-group">
                                        <label >Description</label>
                                        <textarea rows="4" class="form-control" id="Description" name="Description" ></textarea >
                                      </div>
                                      <div class="form-check form-check-flat form-check-primary text-end">
                                        <button type="submit" class="btn btn-primary me-2">Submit</button>
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                                      </div>
                                </form>

                        </div>
                      </div>
                    </div>
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
      
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const vId = urlParams.get('vId')

            document.getElementById('vehicleID').value = vId;
            
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
            
            function email_Check()
            {
                  var emailAddress = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                  if($('#email').val().match(emailAddress))
                  {
                    document.getElementById("result_email").innerHTML = "Valid Email";
                    document.getElementById("result_email").style.color = "green";
                    emailIsEmpty = 1;
                  }else{
                    document.getElementById("result_email").innerHTML = "Invalid Email";
                    document.getElementById("result_email").style.color = "red";
                  }
            }
      
            function age_Check(){
                if($('#age').val() < 17){
                    document.getElementById("result_age").innerHTML = "Age must be grater than 18.";
                    document.getElementById("result_age").style.color = "red";
                }else{
                    document.getElementById("result_age").innerHTML = "Valid age.";
                    document.getElementById("result_age").style.color = "green";
                }
            }
            function home_Number(){
                var phoneno = /^\d{10}$/;
                if($('#telephoneNumber').val().match(phoneno))
                {
                  document.getElementById("result_tel").innerHTML = "Valid Phone Number";
                  document.getElementById("result_tel").style.color = "green";
                  homeAddressIsEmpty = 1;
                }else{
                  document.getElementById("resul_tel").innerHTML = "Invalid Phone Number";
                  document.getElementById("result_tel").style.color = "red";
                }
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

