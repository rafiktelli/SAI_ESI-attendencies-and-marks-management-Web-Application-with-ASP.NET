<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PageAbsenceAffichage.aspx.vb" Inherits="My1stWebApplication.PageAbsenceAffichage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
     <!--
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    -->


  
  <!-- plugins:css -->
  <script src="Scripts/jquery-3.3.1.min.js"></script>
  <link rel="Stylesheet" href="Content/css/jquery.dialog.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <script src="Content/js/jquery.dialog.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>
        <script type="text/javascript">
            alertX = $.dialog.alert;
            $('button').bind('click', function () {

                alertX("Alert", "I'm an alert window", function () {

                $.dialog.alert("Alert", "Closed");

              });

            });
       </script>


 <!-- Required meta tags -->
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <title>SAISIE</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="./Content/vendors/iconfonts/mdi/css/materialdesignicons.min.css"/>
  <link rel="stylesheet" href="./Content/vendors/css/vendor.bundle.base.css"/>
  <link rel="stylesheet" href="./Content/vendors/css/vendor.bundle.addons.css"/>
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="./Content/css/style.css"/>
  <!-- endinject -->
  <link rel="shortcut icon" href="./Content/images/favicon.png" />

    <style>

        
   #dialogoverlay{
	display: none;
	opacity: .8;
	position: fixed;
	top: 0px;
	left: 0px;
	background: #FFF;
	width: 100%;
	z-index: 10;
}
#dialogbox{
	display: none;
	position: fixed;
	background: #FF6969;
	border-radius:10px; 
	width:28%;
    transform:translate(23%,27%);
	z-index: 10;
}
#dialogbox > div{ background:#FFF; margin:8px; }
#dialogbox > div > #dialogboxhead{ background: #F0F0F0  ; font-size:22px; padding:10px; color:#000; }
#dialogbox > div > #dialogboxbody{ background:#fff; padding:20px; color:#000; }
#dialogbox > div > #dialogboxfoot{ background: #F0F0F0  ; padding:10px; text-align:right; }
#profileImage {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #512DA8;
  font-size: 15px;
  color: #fff;
  text-align: center;
  line-height: 150px;
  margin: 20px 0;
}

    .modalBackgroud
{
background-color:black;
filter:alpha(opacity=90) !important;
opacity:0.6 !important;
z-index:20;
}
.modalpopup
{
padding:20px 0px 24px 10px;
position:relative;
width:499px;
height:180px;
background-color:white;
border:1px solid black;
        top: 0px;
        left: 0px;
    }
element.style {
    display: inline-block;
    height: 30px;
    width: 100px;
    vertical-align:middle;
}
 span{
            vertical-align:middle;

        }
     .ErrorControl
    {
        background-color: #FBE3E4;
        border: solid 1px Red;
    }
        .table th, .table td {
    padding: 0px 0px;
    vertical-align: middle;
    border-top: 1px solid #f2f2f2;
    margin-top:5px;
    width:94px;
    height:4px;
}
         .tab
    {
        transform:translate(15%,0%);
         
        
       
    }
        .table-bordered td, .table-bordered th  {
    border: 1px solid #000000;
     border-radius: 4px;
           -moz-border-radius: 4px;
           -webkit-border-radius: 4px;
}
         .aussi2 {
    display: flex;
    flex-wrap: wrap;
   margin:auto;
}

       .aussi {
    display: flex;
    flex-wrap: wrap;
    margin-right: 0px;
    margin-left: 90px;
}
       .aussi3 {
           vertical-align:middle;
       }
        
    input[type="text"]
{   
        border: 1px solid #ccc;
    border-radius: 0px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px; 
}

    .custom-select-wrapper {
  position: relative;
  display: inline-block;
  user-select: none;
}
  .custom-select-wrapper select {
    display: none;
  }
  .custom-select {
    position: relative;
    display: inline-block;
  }
    .custom-select-trigger {
      position: relative;
      display: block;
      width: 130px;
      padding: 0 84px 0 22px;
      font-size: 22px;
      font-weight: 300;
      color: #fff;
      line-height: 60px;
      background: #5c9cd8;
      border-radius: 4px;
      cursor: pointer;
    }
      .custom-select-trigger:after {
        position: absolute;
        display: block;
        content: '';
        width: 10px; height: 10px;
        top: 50%; right: 25px;
        margin-top: -3px;
        border-bottom: 1px solid #fff;
        border-right: 1px solid #fff;
        transform: rotate(45deg) translateY(-50%);
        transition: all .4s ease-in-out;
        transform-origin: 50% 0;
      }
      .custom-select.opened .custom-select-trigger:after {
        margin-top: 3px;
        transform: rotate(-135deg) translateY(-50%);
      }
  .custom-options {
    position: absolute;
    display: block;
    top: 100%; left: 0; right: 0;
    min-width: 100%;
    margin: 15px 0;
    border: 1px solid #b5b5b5;
    border-radius: 4px;
    box-sizing: border-box;
    box-shadow: 0 2px 1px rgba(0,0,0,.07);
    background: #fff;
    transition: all .4s ease-in-out;
    
    opacity: 0;
    visibility: hidden;
    pointer-events: none;
    transform: translateY(-15px);
  }
  .custom-select.opened .custom-options {
    opacity: 1;
    visibility: visible;
    pointer-events: all;
    transform: translateY(0);
  }
    .custom-options:before {
      position: absolute;
      display: block;
      content: '';
      bottom: 100%; right: 25px;
      width: 7px; height: 7px;
      margin-bottom: -4px;
      border-top: 1px solid #b5b5b5;
      border-left: 1px solid #b5b5b5;
      background: #fff;
      transform: rotate(45deg);
      transition: all .4s ease-in-out;
    }
    .option-hover:before {
      background: #f9f9f9;
    }
    .custom-option {
      position: relative;
      display: block;
      padding: 0 22px;
      border-bottom: 1px solid #b5b5b5;
      font-size: 18px;
      font-weight: 600;
      color: #b5b5b5;
      line-height: 47px;
      cursor: pointer;
      transition: all .4s ease-in-out;
    }
    .custom-option:first-of-type {
      border-radius: 4px 4px 0 0;
    }
    .custom-option:last-of-type {
      border-bottom: 0;
      border-radius: 0 0 4px 4px;
    }
    .custom-option:hover,
    .custom-option.selection {
      background: #f9f9f9;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
            <ContentTemplate>
        <div id="dialogoverlay"></div>
<div id="dialogbox">
  <div>
    <div id="dialogboxhead"></div>
    <div id="dialogboxbody"></div>
    <div id="dialogboxfoot"></div>
  </div>
</div>
                </ContentTemplate>
            </asp:UpdatePanel>
        <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->

    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
        <asp:HyperLink class="navbar-brand brand-logo" id="HyperLink1" runat="server" NavigateUrl="~/PageChoixEtudiant.aspx">
          <img src="Content/images/SAIESI.svg" alt="logo" />
        </asp:HyperLink>
        <asp:HyperLink class="navbar-brand brand-logo-mini" id="lnk1" runat="server" NavigateUrl="~/PageChoixEtudiant.aspx">
          <img src="Content/images/logo-mini.svg" alt="logo" />
        </asp:HyperLink>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center">
        <ul class="navbar-nav navbar-nav-left header-links d-none d-md-flex">
          
          <!--li class="nav-item active">
            <a href="#" class="nav-link">
              <i class="mdi mdi-elevation-rise"></i>Reports</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="mdi mdi-bookmark-plus-outline"></i>Score</a>
          </li-->
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          
          <li class="nav-item dropdown d-none d-xl-inline-block">
            <a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
              <span style="" class="profile-text">Bonjour <asp:Label Font-Size="Small" ID="Label1" runat="server" Text="Label"></asp:Label></span>  
                <canvas class="user-icon" data-name="hello" width="40" height="40" style="width: 40px; height: 40px; border-radius:50px"></canvas>            
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
              <a class="dropdown-item p-0">
                <div class="d-flex border-bottom">
                  <div class="py-3 px-4 d-flex align-items-center justify-content-center">
                    <i class="mdi mdi-bookmark-plus-outline mr-0 text-gray"></i>
                  </div>
                  <div class="py-3 px-4 d-flex align-items-center justify-content-center border-left border-right">
                    <i class="mdi mdi-account-outline mr-0 text-gray"></i>
                  </div>
                  <div class="py-3 px-4 d-flex align-items-center justify-content-center">
                    <i class="mdi mdi-alarm-check mr-0 text-gray"></i>
                  </div>
                </div>
              </a>
              <a class="dropdown-item">
                  <asp:Button CssClass="btn btn-inverse-info" ID="Bt_changermdp" runat="server" Text="Changer le mot de passe" />
              </a>
              
              <a class="dropdown-item">
                <asp:Button class="btn btn-inverse-danger" ID="Buttonlogout" runat="server" Text="Se déconnecter" />
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_sidebar.html -->
      
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item nav-profile">
            <div class="nav-link">
              <div class="user-wrapper">
                <div class="profile-image">
                  <canvas class="user-icon" data-name="hello" width="40" height="40" style="width: 40px; height: 40px; border-radius:50px"></canvas>
                </div>
                <div class="text-wrapper">
                  <p class="profile-name"> <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></p>
                  <div>
                    <small class="designation text-muted">Etudiant</small>
                    <span class="status-indicator online"></span>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="menu-icon mdi mdi-content-copy"></i>
              <span class="menu-title">Promotion</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                
                <li class="nav-item">
                  <asp:Label runat="server" ID="PrmLabel" Text=""></asp:Label>
                </li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic">
              <i class="menu-icon mdi mdi-content-copy"></i>
              <span class="menu-title">Section</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic1">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item">
                  <asp:Label runat="server" ID="SecLabel" Text=""></asp:Label>
                </li>
                
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic">
              <i class="menu-icon mdi mdi-content-copy"></i>
              <span class="menu-title">Groupe</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic2">
                <ul class="nav flex-column sub-menu">
                <li class="nav-item">
                    <asp:Label runat="server" ID="GrpLabel" Text=""></asp:Label>  
                </li>
                    </ul>
             
            </div>
          </li>
            
         
          
        </ul>
      </nav>
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
        
        <div runat="server" class="scroll-container"  style="padding: 2px;margin-top:-10%; display: inline-block; width:100%; ">
            <h2 style="margin-top:20%;"><asp:Label runat="server" ID="LabelMsg" Text=""></asp:Label></h2> 
            <h4 ><asp:Label runat="server" ID="LabelMsg2" Text="Voici toutes vos absences justifiées et non justifiées dans tous les modules durant "></asp:Label></h4>
            <asp:GridView runat="server" ID="MatiereAbsGridView" AutoGenerateColumns="False" width="100%" Height="100%" CssClass=" scroll-container table-responsive  table table-hover text-center table-bordered "  BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0px" cellspacing="0" CellPadding="0" GridLines="Vertical" style="font-family: Calibri;font-size:14px;margin:auto;" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Matiere" HeaderText="Matiere" ItemStyle-Height="30px" ItemStyle-Width="200px" SortExpression="Matiere" >
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Jour" SortExpression="Jour">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" Width="250px" runat="server" Text='<%# Bind("Jour") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="JourLabel" Width="250px" runat="server" Text='<%# Bind("Jour") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="justifié" SortExpression="justifie">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" Width="250px" runat="server" Text='<%# Bind("justifie") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                             <asp:Label ID="JustifieLabel" Width="250px" runat="server" Text='<%# Bind("justifie") %>'></asp:Label>
                         </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                 <HeaderStyle BackColor="white" Height="25px" Font-Bold="True"  CssClass="text-center" BorderWidth="1px" BorderStyle="Solid" BorderColor="Black" ForeColor="Black" />
                <SelectedRowStyle BackColor="#CC3333" Height="40px" Font-Bold="True" ForeColor="Black" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:saisiedenotesConnectionStringGView %>" SelectCommand="SELECT [Matiere], [Jour], [justifie] FROM [ABSENCES] WHERE ([Matricule] = @Matricule)">
                <SelectParameters>
                    <asp:SessionParameter Name="Matricule" SessionField="Matricule" Type="String" />
                </SelectParameters>
             </asp:SqlDataSource>
            
            </div>
            


        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <footer class="footer">
          <div class="container-fluid clearfix">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2019
              <a href="http://www.bootstrapdash.com/" target="_blank">Groupe 25</a>. All rights reserved.</span>
            
            
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
        
    </form>
     <!-- plugins:js -->
  
    <!-- plugins:js -->
  <script src="Content/vendors/js/vendor.bundle.base.js"></script>
  <script src="Content/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="Content/js/off-canvas.js"></script>
  <script src="Content/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="Content/js/dashboard.js"></script>
  <!-- End custom js for this page-->
     <script type="text/javascript">
 function CustomAlert(){
    this.render = function(dialog){
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var dialogoverlay = document.getElementById('dialogoverlay');
        var dialogbox = document.getElementById('dialogbox');
        dialogoverlay.style.display = "block";
        dialogoverlay.style.height = winH+"px";
        dialogbox.style.left = (winW/2) - (550 * .5)+"px";
        dialogbox.style.top = "100px";
        dialogbox.style.display = "block";
        document.getElementById('dialogboxhead').innerHTML = "Alert !";
        document.getElementById('dialogboxbody').innerHTML = dialog;
        document.getElementById('dialogboxfoot').innerHTML = '<button class=" btn btn-outline-danger btn-fw" onclick="alertcancer()">OK</button>';
    }
	this.ok = function(){
		document.getElementById('dialogbox').style.display = "none";
		document.getElementById('dialogoverlay').style.display = "none";
	}
}

</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <script type="text/javascript">
            	 function alertcancer(){
		document.getElementById('dialogbox').style.display = "none";
		document.getElementById('dialogoverlay').style.display = "none";
	}
        </script>
  <script type="text/javascript">
            // "Hello, World" class
            function katweKibsAvatar() {
                this.selector = ".user-icon";
                this.dataChars = 1;
                this.width = 25;
                this.height = 25;

                this.colours = [
                    "#1abc9c", "#2ecc71", "#3498db", "#9b59b6", "#34495e",
                    "#16a085", "#27ae60", "#2980b9", "#8e44ad", "#2c3e50",
                    "#f1c40f", "#e67e22", "#e74c3c", "#95a5a6", "#f39c12",
                    "#d35400", "#c0392b", "#bdc3c7", "#7f8c8d"];


                this.init = function (obj) {
                    if (obj) {
                        if (obj.selector) {
                            this.selector = obj.selector;
                        }
                        if (obj.dataChars) {
                            this.dataChars = obj.dataChars;
                        }

                        if (obj.width) {
                            this.width = obj.width;
                        }
                        if (obj.height) {
                            this.height = obj.height;
                        }
                    }
                    this.setCanvases();
                    this.drawCanvas();
                };

                this.setCanvases = function () {
                    this.canvases = $(this.selector);
                };

                this.getInitials = function (name, numChars) {
                    var initials = name.charAt(0).toUpperCase()
                    if (name.indexOf(" ") > -1 && numChars > 1) {
                        var nameSplit = name.split(" ");
                        initials = nameSplit[0].charAt(0).toUpperCase() + nameSplit[1].charAt(0).toUpperCase();
                    }
                    return initials;
                };

                this.getIndex = function (name) {
                    var myindex = 0;
                    if (name.indexOf(" ") > -1) {
                        var nameSplit = name.split(" ");
                        myindex = nameSplit[0].toUpperCase().charCodeAt(0) + nameSplit[1].toUpperCase().charCodeAt(nameSplit[1].length - 1);
                    } else {
                        myindex = name.toUpperCase().charCodeAt(0) + name.toUpperCase().charCodeAt(name.length - 1);
                    }
                    myindex = myindex % 19;
                    return myindex;
                };

                this.getNumChars = function (numCharObj) {
                    var numChars = 1;
                    if (typeof numCharObj !== 'undefined' && Number.isInteger(parseInt(numCharObj))) {
                        numChars = numCharObj;
                    }
                    return numChars;
                };

                this.draw = function (ind, myobj) {
                    var canvas = $(myobj).get(0);
                    var name = document.getElementById('<%=Label1.ClientID%>').innerText;

                    if ($(canvas).attr("data-chars")) {
                        var numChars = katweKibsAvatar.getNumChars($(canvas).attr("data-chars"));
                    } else {
                        var numChars = katweKibsAvatar.dataChars;
                    }

                    var initials = katweKibsAvatar.getInitials(name, numChars);
                    var colourIndex = katweKibsAvatar.getIndex(name);
                    var context = canvas.getContext("2d");

                    if ($(canvas).attr("width")) {
                        var canvasWidth = $(canvas).attr("width");
                    } else {
                        var canvasWidth = katweKibsAvatar.width;
                    }

                    if ($(canvas).attr("height")) {
                        var canvasHeight = $(canvas).attr("height");
                    } else {
                        var canvasHeight = katweKibsAvatar.height;
                    }

                    var canvasCssWidth = canvasWidth;
                    var canvasCssHeight = canvasHeight;

                    if (window.devicePixelRatio) {
                        $(canvas).attr("width", canvasWidth * window.devicePixelRatio);
                        $(canvas).attr("height", canvasHeight * window.devicePixelRatio);
                        $(canvas).css("width", canvasCssWidth);
                        $(canvas).css("height", canvasCssHeight);
                        context.scale(window.devicePixelRatio, window.devicePixelRatio);
                    }

                    context.fillStyle = katweKibsAvatar.colours[colourIndex];
                    context.fillRect(0, 0, canvas.width, canvas.height);
                    context.font = (canvasWidth - canvasWidth * 45 / 100) + "px Arial ";
                    context.textAlign = "center";
                    context.fillStyle = "#FFF";
                    context.fillText(initials, canvasCssWidth / 2, canvasCssHeight / 1.4);
                };

                this.drawCanvas = function () {
                    if (this.canvases) {
                        this.canvases.each(this.draw);
                    }
                };
            }

            var katweKibsAvatar = new katweKibsAvatar();

            katweKibsAvatar.init({
                dataChars: 2,
                width:100,
                height:100
            });
        </script>

        <script type="text/javascript">
            function cellColor() {
                var table = document.getElementById("GridView1");
                var rows = table.rows;

                for (var i = 1; i < rows.length; i++)
                {


                    var inputs = table.rows[i].getElementsByTagName("input");
                    for (var j = 0; j < inputs.length; j++)

                    {
                        //get the textbox1
                            inputs[j].readOnly = "readonly";
                    }
                }
            }
        </script>
        <script type="text/javascript">
   
        function testcoef(source, args)
      {
       
            args.IsValid = true
            if (args.Value == "") { document.getElementById(source.controltovalidate).style.backgroundColor = "white"; }
            else
            {
                val = parseFloat(args.Value);

                if (isNaN(val)) {
                    
                    document.getElementById(source.controltovalidate).style.backgroundColor = "red";                   
                    
                    
                }

                else {
                      document.getElementById(source.controltovalidate).style.backgroundColor = "white";
                     }
                }
            }
    

     
  </script>
        <script src="Content/js/index.js"></script>
        <script type="text/javascript">
                function changecell()
      {
                    alert('saluut');
    
      }

     
  </script>
        <script type="text/javascript">
 function CustomAlert(){
    this.render = function(dialog){
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var dialogoverlay = document.getElementById('dialogoverlay');
        var dialogbox = document.getElementById('dialogbox');
        dialogoverlay.style.display = "block";
        dialogoverlay.style.height = winH+"px";
        dialogbox.style.left = (winW/2) - (550 * .5)+"px";
        dialogbox.style.top = "100px";
        dialogbox.style.display = "block";
        document.getElementById('dialogboxhead').innerHTML = "Alert !";
        document.getElementById('dialogboxbody').innerHTML = dialog;
        document.getElementById('dialogboxfoot').innerHTML = '<button class=" btn btn-outline-danger btn-fw" onclick="alertcancer()">OK</button>';
    }
	this.ok = function(){
		document.getElementById('dialogbox').style.display = "none";
		document.getElementById('dialogoverlay').style.display = "none";
	}
}

</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <script type="text/javascript">
            	 function alertcancer(){
		document.getElementById('dialogbox').style.display = "none";
		document.getElementById('dialogoverlay').style.display = "none";
	}
        </script>
        <script type="text/javascript">

    function ValidatePage() {

        if (typeof (Page_ClientValidate) == 'function') {
            Page_ClientValidate();
        }

        if (Page_IsValid) {
            // do something
            
            $find("mpe").show();
        }
        else {
            // do something else
             var Alert = new CustomAlert();
            Alert.render('Vérifier les cases invalides');
        }
        return false;
    }

</script>
        <script type="text/javascript">
        function testerreurs() {

        if (typeof (Page_ClientValidate) == 'function') {
            Page_ClientValidate();
        }

        if (Page_IsValid) {
            // do something
            
           
        }
        else {
            // do something else
             var Alert = new CustomAlert();
            Alert.render('Vérifier les cases invalides');
        }
        return false;
    }

</script>
         <script type="text/javascript">
              $(document).ready(function(){
                var profileImage = $('#profileImage').text("L");
             });
             </script>
          <script type="text/javascript">
              function alertx(string msg) {
                                var Alert = new CustomAlert();
                                 Alert.render(msg);
	            }
        </script>
  <!-- End custom js for this page-->
</body>
</html>