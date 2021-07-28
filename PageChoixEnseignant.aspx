<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PageChoixEnseignant.aspx.vb" Inherits="My1stWebApplication.PageChoixEnseignant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <!--
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    -->


  
  <!-- plugins:css -->
  <link rel="stylesheet" href="Content/vendors/iconfonts/mdi/css/materialdesignicons.min.css"/>
  <link rel="stylesheet" href="Content/vendors/css/vendor.bundle.base.css"/>
  <link rel="stylesheet" href="Content/vendors/css/vendor.bundle.addons.css"/>
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="Content/css/style.css"/>
  <!-- endinject -->
  <link rel="shortcut icon" href="Content/images/favicon.png" />

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

    body {
        margin: 0;
        padding: 0;
        font-family:"Poppin",sans-serif;
    }

     section {
        position: relative;
        height:85vh;
        display: flex;
        margin-top:30px;
    }

    section .screen {
        position: relative;
        flex-grow: 1;
        transition: 1s;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
    }

    section .screen:hover {
        flex-grow: 5;
        border-bottom: solid 3px;
        border-top: solid 3px;
        border-color: bisque;


    }

    section .screen .cardo .imgbox {
        opacity:1;    
    
    }


    section .screen:nth-child(1) {
        background-image:url(./image/imagesaisie.jpg);
        background-position: center;
        background-size: cover;
        border-right: solid 2px white;

    }

    section .screen:nth-child(2) {
        background-image:url(./image/auditorium-benches-board-207691.jpg);
        background-position: center;
        background-size: cover;
        border-left: solid 2px white;
    }

    section .screen .cardo {
        max-width: 300px;
        text-align: center;
        transition: 0.5s;
    }
     

     .bouton {
        width: 300px;
        height: 300px;
        border-radius: 50%;
        border: 2px solid aqua;
        background: none;
        padding: 10px 20px;
        cursor: pointer;
        margin: 10px;
        overflow: hidden;
        margin: 0 auto;
        font-family: "Poppins",sans-serif;
        letter-spacing: 2px;
        transition: 0.8s;
        font-size: 20px;
        align-items:center;
      }

     

    .bouton::before{
        content: "";
        left: 0;
        width: 100%;
        height: 0%;
        background: aqua;
        position: absolute;
        z-index: -1;
        transition: 0.8s;
    }
     .sousb{
        
        margin-top:40%;
        
    }
      #lnk1, #lnk2{
         text-decoration:double;
     }

     .sousb:hover{
         text-decoration-style:double;
     }

    .b1 {
        color: aqua;
        border-color: bisque;
    }
    .b1::before {
        top: 0;
        border-radius: 0 0 50% 50%;
    }
    .b1:hover::before {
        height: 180%;
    }

    .b1:hover {
        color:bisque;
        top: 0;
        border-radius: 10% 10% 50% 50%;
        background-color: aqua;
    }
    .b2::before {
        bottom: 0;
        border-radius:50% 50% 0 0;
    }
    .b1:hover::before {
        height: 0%;
    }

    .b2 {
        color: bisque;
    }

    .b2:hover {
        color:aqua;
        bottom: 0;
        border-radius:50% 50% 10% 10%;
        background-color: bisque
    }



    .entete , .basdepage {

        position: relative;
        justify-content: center;


        text-align: center;
        background-color: darkslategray;
        font-family: 'Calibri' ,sans-serif;
        color: bisque;

    }

    .entete .dots ul {
        position: absolute ;
        top: 25%;
        left: 8%;
        transform: translate(-50%,-50%);
        margin: 0;
        padding: 0;
        display: flex;
    }
    .entete .contenaire {
        position: absolute ;
        top: 70%;
        left: 50%;
        transform: translate(-50%,-50%);
        height: 40%;
        margin: 0;
        padding: 0;
        display: flex;



    }
    .entete .contenaire li {
        list-style: none;
    }

    .entete .contenaire li a{

        font-family: Source sans pro;
        text-decoration: none;
        font-weight: lighter;
        padding: 0 20px;
        font-size: 20px;
        font-family: 'Calibri' ,sans-serif;
        color: bisque;
        font-weight: lighter;
        position: relative;
        display: block;
        text-align: center;
        text-transform: uppercase;
        text-decoration: none;
        transition: 0.5s;
    }

    .menulink:before{
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 2px;
        background:bisque;
        transition: width .3s;
        overflow: hidden;
        z-index: -1;
        transform: scaleX(0);
        transform-origin: right;
        transition: 1.5s;
    }
    .menulink:hover:before{
        transform: scaleX(1);
        transform-origin: left;
    }

    .menulink:after{
        content: '';
        position: absolute;
        bottom: 0;
        right: 0;
        width: 100%;
        height: 2px;
        background:bisque;
        transition: width .3s;
        overflow: hidden;
        z-index: -1;
        transform: scaleX(0);
        transform-origin: left;
        transition: 1.5s;
    }
    .menulink:hover:after{
        transform: scaleX(1);
        transform-origin: right;
    }




    .entete .dots ul li {
        list-style: none;
        width: 30px;
        height: 30px;
        background: #fff;
        border-radius: 50%;
        animation: animate 1.6s ease-in-out infinite;

    }

    @keyframes animate{
        0%,  100%
        {transform: scale(0.2);}
        40%,60%
        {transform: scale(0.4)}
        20%, 80%
        {transform: scale(0.8)}
    }

    .entete .dots ul li:nth-child(1){
        animation-delay: -1.4s;
        background-color:whitesmoke;
        box-shadow: 0 0 50px whitesmoke;
    }
    .entete .dots ul li:nth-child(2){
        animation-delay: -1.2s;
        background-color:whitesmoke;
        box-shadow: 0 0 50px whitesmoke;
    }
    .entete .dots ul li:nth-child(3){
        animation-delay: -1s;
        background-color:whitesmoke;
        box-shadow: 0 0 50px whitesmoke;
    }
    .entete .dots ul li:nth-child(4){
        animation-delay: -0.8s;
        background-color:whitesmoke;
        box-shadow: 0 0 50px whitesmoke;
    }
    .entete .dots ul li:nth-child(5){
        animation-delay: -0.6s;
        background-color:whitesmoke;
        box-shadow: 0 0 50px whitesmoke;
    }


    .loginbox{
        position: absolute;
        transform: translate(-50%,-50%);
        top: 50%;
        left: 50%;
        width: 50%;
        padding: 40px;
        box-sizing: border-box;
        box-shadow: 0 15px 25px darkslategray;
        background-color: darkslategray;
        opacity: 0.8;
        font-family: 'Calibri' ,sans-serif;
        color: bisque;
        border-radius: 10px;
        display: none;
    }
    .lb1{
        left: 25%;
    }
    .lb2{
        left: 75%;
    }
    .loginbox h2{
        margin: 0 0 30px;
        padding: 0;
        text-align: center;
    }
    .loginbox .inputbox{
        position: relative;
        text-align:center;
        left: 5%;   
     
    }
    .loginbox .inputbox .input {
        width: 50%;
        left:50%;
        text-align:center;
        align-items:center;
        padding: 10px 0;
        font-size: 16px;
        margin-bottom: 30px;
        border: none;
        letter-spacing: 1px;
        color: bisque;
        border-bottom: 1px solid bisque;
        outline: none;
        background: transparent;
    }
    .loginbox .inputbox p label{
        position: absolute;
        padding: 10px 0;
        font-size: 16px;
        color: bisque;
        pointer-events: none;
        transition: 0.5s;
        top: 0;
        left: 0;
    }

    .loginbox .inputbox .input:focus ~ .labels,
    .loginbox .inputbox .input:valid ~ .labels {

        font-size: 12px;
        top: -18px;
        left: 0;
        color: aqua;
        visibility: hidden;
        opacity: 1;
    }
    .loginbox .input2{
        background: transparent;
        border: none;
        outline: none;
        color: bisque;
        background: aqua;
        padding: 10px 20px;
        border-radius:5px;
        position:absolute;
        left:75%;
    }
    .menulink:hover ~ .loginbox{
        opacity: 1;
        visibility: visible;
        display: block;
    }

    
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->

    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
        <asp:HyperLink class="navbar-brand brand-logo" id="HyperLink1" runat="server" NavigateUrl="~/PageChoixEnseignant.aspx">
          <img src="Content/images/SAIESI.svg" alt="logo" />
        </asp:HyperLink>
        <asp:HyperLink class="navbar-brand brand-logo-mini" id="HyperLink2" runat="server" NavigateUrl="~/PageChoixEnseignant.aspx">
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
          
          <li class="nav-item dropdown d-none d-xl-inline-flex">
            <a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
              <span class="profile-text">Bonjour <asp:Label Font-Size="Small" ID="Label1" runat="server" Text="Label"></asp:Label> </span>  
                <span> <canvas class="user-icon" data-name="hello" width="40" height="40" style="width: 40px; height: 40px; border-radius:50px"></canvas>            
            </span></a>
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
    
      
      <!-- partial -->
      <div style="margin-top:65px;">

            <section class="split">
        <div class="screen">
            
            <div class="cardo">
                <div id="imgbx1" class="imgbox">
                    <asp:HyperLink id="lnk1" runat="server" NavigateUrl="~/PageNotesSaisie.aspx">
                    <div class="bouton b1" ><div class="sousb"><h3>Saisie des</h3> <h1>Notes</h1></div></div>
                    </asp:HyperLink>
                </div>
            </div>
        </div>
        <div class="screen">
            <div class="cardo">
                <div id="imgbx2" class="imgbox">
                    <asp:HyperLink ID="lnk2" runat="server" NavigateUrl="~/PageAbscenceSaisie.aspx">
                    <div class="bouton b2"  ><div class="sousb"><h3>Saisie des</h3> <h1>Abscences</h1></div></div>
                    </asp:HyperLink>
                </div>
            </div>
        </div>
    </section>

        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
         <footer class="footer" style="padding-top:5px;padding-bottom:5px;">
          <div class="container-fluid clearfix">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2019
              <a href="http://www.bootstrapdash.com/" target="_blank">Groupe 25</a>. All rights reserved.</span>
            
            
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
   
    <!-- page-body-wrapper ends -->
 
        
    </form>
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
</body>
</html>
