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
                  <h4 class="card-title">Add New Branch</h4>
                  <form class="forms-sample" action="../add_branch" method="post">
                    <div class="form-group">
                      <label for="exampleInputCity1">Branch Name</label>
                      <input type="text" class="form-control" id="branchName" name="branchName" placeholder="Branch Name">
                      <input type="hidden" class="form-control" id="bID" placeholder="">
                    </div>
                    <div class="form-group">
                        <label >Address</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Address">
                    </div>
                    <div class="form-group">
                        <label >Telephone Number</label>
                        <input type="tel" class="form-control" id="telephoneNumber" name="telephoneNumber" oninput="home_Number()" placeholder="Telephone Number">
                        <small id="result_tel"></small>
                    </div>
                    <div class="form-group">
                        <label >Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email"  oninput="email_Check()" >
                        <small id="result_email"></small>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">Image URL</label>
                      <input type="url" class="form-control" name="imageURl" id="imageURl" placeholder="Image Url">
                    </div>
                    <button type="submit" class="btn btn-primary mr-2" id="submitBtn" >Submit</button>
                    <button type="button" class="btn btn-success mr-2" id="updateBtn" onclick="updateBranch()">Update</button>
                    <button type="button" id="clearBtn" class="btn btn-light" onclick="clear()">Clear</button>
                  </form>
                  <hr/>
                  <div class="table-responsive">
                    <table class="table" id="BranchTbl">
                      <thead>
                          <tr class="bg-dark">
                              <th class="text-white text-center">Branch Name</th>
                              <th class="text-white text-center">Address</th>
                              <th class="text-white text-center">Telephone Number</th>
                              <th class="text-white text-center">Email</th>
                              <th class="text-white text-center">Image URL</th>
                              <th class="text-white text-center">Action</th>
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
        document.getElementById('updateBtn').style.display = "none";
                   
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
            
            function updateBranch(){
             $.ajax({
                 url: "../update_vehice_Category",
                 type: 'POST',
                 data : {
                     id : document.getElementById('bID').value,
                     address: document.getElementById('address').value,
                     telephoneNumber: document.getElementById('telephoneNumber').value,
                     email: document.getElementById('email').value,
                     imageURl:document.getElementById('imageURl').value,
                 },
                 success: function(data) {
                      
                         if(parseInt(data) == 1){
                             alert("Vehicle Category Updating Success");
                             document.getElementById('branchName').disabled= false;
                         }else{
                             alert("Vehicle Category Updating Not Success");
                         }
                         location.reload();
                 }
             });
        }

        function clear(){
            document.getElementById('branchName').value = "";
            document.getElementById('address').value = "";
            document.getElementById('telephoneNumber').value = "";
            document.getElementById('email').value = "";
            document.getElementById('imageURl').value = "";
            
            document.getElementById('submitBtn').style.display = "inline";
            document.getElementById('updateBtn').style.display = "none";
        }
        
        $.ajax({
            url: "../get_all_branch",
            type: 'POST',
            success: function(data) {
              
                      var dataArr = data.split('!!!!');
                      if(dataArr.length > 0){
                      //get table body:
                      var tableRef = document.getElementById('BranchTbl').getElementsByTagName('tbody')[0];
                      
                            for (let index = 0; index < dataArr.length; index++){
                                var dataArr2 = dataArr[index].split(',,');
                                    tableRef.insertRow().innerHTML = 
                                    "<th class='text-center'>" + dataArr2[1]+ "</th>" + 
                                    "<td  class='text-center'>" +dataArr2[3]+ "</td>"+
                                     "<td  class='text-center'>" +dataArr2[4]+ "</td>"+
                                      "<td  class='text-center'>" +dataArr2[5]+ "</td>"+
                                       "<td  class='text-center'>Click Me For View Image</td>"+
                                    "<td class='text-center'>\n\
                                            <button  type='button' name='delete'  onclick='deleteBranch(" +dataArr2[0]+ ")' id='btn_cancel' class='btn btn-danger btn-sm mr-2'>Delete</button><button  type='button' name='update'  onclick='updateBranch("+dataArr2[0]+")' id='btn_update' class='btn btn-success btn-sm'>Update</button>\n\
                                    </td>";
                            }
                      }
            }
        });
        
        function updateBranch(id){
            
             $.ajax({
                    url: "../get_one_branch",
                    type: 'POST',
                    data : {
                      id : id  
                    },
                    success: function(data) {
                      var dataArr2 = data.split(',,');
                      document.getElementById('bID').value = dataArr2[0];
                      document.getElementById('branchName').value = dataArr2[1];
                      document.getElementById('address').value = dataArr2[3];
                      document.getElementById('telephoneNumber').value = dataArr2[4];
                      document.getElementById('email').value = dataArr2[5];
                      document.getElementById('imageURl').value = dataArr2[2];
                      document.getElementById('branchName').disabled= true;
                      document.getElementById('submitBtn').style.display = "none";
                      document.getElementById('updateBtn').style.display = "inline";
                }
              });
        }
        
        function deleteBranch(id){
            $.ajax({
                url: "../delete_branch",
                type: 'POST',
                data : {
                    id:id
                },
                success: function(data) {
                    if(parseInt(data) == 1){
                        alert("Branch Deleted");
                    }else{
                        alert("Branch Not Deleteds");
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

