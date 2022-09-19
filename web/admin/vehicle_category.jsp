<!DOCTYPE html>
<html lang="en">

 <jsp:include page="commo_part_head_link.jsp"/>


<body >
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
                  <h4 class="card-title">Add New Vehicle Category</h4>
                  <form class="forms-sample">
                    <div class="form-group">
                      <label for="exampleInputCity1">Category Name</label>
                      <input type="text" class="form-control" id="categoryName" placeholder="">
                      <input type="hidden" class="form-control" id="cID" placeholder="">
                    </div>
                    
                        <div class="row">
                            <div class="col">
                                <div class="form-groups">
                                    <label for="exampleInputCity1">Initial Payment Distance (KM)</label>
                                    <input type="number" class="form-control" id="InitialPayment" name="InitialPayment" placeholder="">
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-groups">
                                    <label for="exampleInputCity1">Initial Payment Price (RS)</label>
                                    <input type="number" class="form-control" id="InitialPrice" name="InitialPrice" placeholder="">
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-groups">
                                    <label for="exampleInputCity1">Price For Extra One KM</label>
                                    <input type="number" class="form-control" id="ExtraPrice" name="ExtraPrice" placeholder="">
                                </div>
                            </div>
                    </div>
                    <div class="form-group mt-3">
                      <label for="exampleInputCity1">Image URL</label>
                      <input type="url" class="form-control" id="imageURl" placeholder="">
                    </div>
                    
                    <button type="button" class="btn btn-primary mr-2" id="submitBtn" onclick="submitVehicleCategory()">Submit</button>
                    <button type="button" class="btn btn-success mr-2" id="updateBtn" onclick="updateVehicleCategory()">Update</button>
                    <button type="button" id="clearBtn" class="btn btn-light" onclick="clear()">Clear</button>
                  </form>
                  <hr/>
                  <div class="table-responsive">
                    <table class="table" id="VehicleCategoryTbl">
                      <thead>
                          <tr class="bg-dark">
                              <th class="text-white text-center">Vehicle Category</th>
                              <th class="text-white text-center">Image</th>
                              <th class="text-white text-center">Initial Payment Distance (KM)</th>
                              <th class="text-white text-center">Initial Payment Price (RS.)</th>
                              <th class="text-white text-center">Price For Extra One KM (RS.)</th>
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
        
        function updateVehicleCategory(){
             $.ajax({
                 url: "../update_vehice_Category",
                 type: 'POST',
                 data : {
                     id : document.getElementById('cID').value,
                     categoryName:document.getElementById('categoryName').value,
                     imageURl:document.getElementById('imageURl').value,
                     InitialPayment : document.getElementById('InitialPayment').value,
                     InitialPrice : document.getElementById('InitialPrice').value,
                     ExtraPrice : document.getElementById('ExtraPrice').value,
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
                     categoryName : document.getElementById('categoryName').value,
                     imageURl : document.getElementById('imageURl').value,
                     InitialPayment : document.getElementById('InitialPayment').value,
                     InitialPrice : document.getElementById('InitialPrice').value,
                     ExtraPrice : document.getElementById('ExtraPrice').value
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
                                    "<td  class='text-center'>View Image</td>"+
                                    "<td  class='text-center'>" +dataArr2[3]+ "</td>"+
                                    "<td  class='text-center'>" +dataArr2[4]+ "</td>"+
                                    "<td  class='text-center'>" +dataArr2[5]+ "</td>"+
                                    "<td class='text-center'>\n\
                                            <button  type='button' name='delete'  onclick='deleteVC(" +dataArr2[0]+ ")' id='btn_cancel' class='btn btn-danger btn-sm mr-2'>Delete</button><button  type='button' name='update'  onclick='updateVC("+dataArr2[0]+")' id='btn_update' class='btn btn-success btn-sm'>Update</button>\n\
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
                      //alert(data);
                      var dataArr2 = data.split(',,');
                      document.getElementById('cID').value = dataArr2[0];
                      document.getElementById('categoryName').value = dataArr2[1];
                      document.getElementById('imageURl').value = dataArr2[2];
                      document.getElementById('InitialPayment').value = dataArr2[3];
                      document.getElementById('InitialPrice').value = dataArr2[4];
                      document.getElementById('ExtraPrice').value = parseInt(dataArr2[5]);
                      
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

