<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LoginOfficiel.aspx.vb" Inherits="My1stWebApplication.LoginOfficiel" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <title>SAI-ESI</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    
    
    <link rel="stylesheet" href="Content/fonts/icomoon/style.css"/>
    <link rel="stylesheet" href="Content/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="Content/css/jquery-ui.css"/>
    <link rel="stylesheet" href="Content/css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="Content/css/owl.theme.default.min.css"/>
    <link rel="stylesheet" href="Content/css/owl.theme.default.min.css"/>

    <link rel="stylesheet" href="Content/css/jquery.fancybox.min.css"/>

    <link rel="stylesheet" href="Content/css/bootstrap-datepicker.css"/>

    <link rel="stylesheet" href="Content/fonts/flaticon/font/flaticon.css"/>

    <link rel="stylesheet" href="Content/css/aos.css"/>

    <link rel="stylesheet" href="Content/css/style2.css"/>
<style type="text/css">

         
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

        .nouveauStyle1 {
            font-family: "times New Roman", Times, serif;
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
padding:20px 10px 24px 10px;
position:absolute;
width:40%;
height:350px;
background-color:white;
border-radius:20px;
border:1px solid black;
        top: 0px;
        left: 0px;
    }
        .auto-style1 {
            background-color: #FFFFFF;
        }
        .auto-style2 {
            margin-top: 0px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style4 {
            width: 1096px;
        }

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

body{
  height: 100vh;
}

  .slide-1:before {
    content: "";
    position: absolute;
    height: 100%;
    width: 100%;
    background: #343a40;
    opacity: .0;
    border-bottom-right-radius: 0px;
}
}
</style>  

  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
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
  <div class="site-wrap" style="height: 100vh;">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
    
    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
      
      <div class="container-fluid">
        <div class="d-flex align-items-center">
                      <img class="site-logo mr-auto w-25" src="Content/images/SAIESI.svg" alt="logo" />

          <!--div class="site-logo mr-auto w-25"><a href="index.html">SAI-ESI</a></!--div-->

          <div class="mx-auto text-center " style="padding-left:15%;color:black;">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mx-auto d-none d-lg-block  m-0 p-0">
                <li><a href="LoginOfficiel.aspx" class="nav-link">Home</a></li>
                <li><a href="Content/services.html" class="nav-link">Services</a></li>
                <li><a href="Content/team.html" class="nav-link">Team</a></li>
                <li><a href="Content/guide.html" class="nav-link">Guide</a></li>
              </ul>
            </nav>
          </div>

          <div class="ml-auto w-25">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu site-menu-dark js-clone-nav mr-auto d-none d-lg-block m-0 p-0">
                
              </ul>
            </nav>
            <a href="#" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black float-right"><span class="icon-menu h3"></span></a>
          </div>
        </div>
      </div>
      
    </header>

    <div class="intro-section"  >
      
      <div class="slide-1" style="background-image: url('Content/images/register.jpg');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center" style="transform: translate(0%,-10%);">
            <div class="col-12">
              <div class="row align-items-center">
                <div class="col-lg-6 mb-4" >
                  <h1  data-aos="fade-up" data-aos-delay="100" > Pour tout simplifier ! </h1>
                  <p class="mb-4"  data-aos="fade-up" data-aos-delay="200" > SAI-ESI est une plateforme conçue pour les enseignants et étudiants de l'ESI pour la saisie et la consultation des notes et des absences. </p>
                 

                </div>

                <div class="col-lg-5 ml-auto" data-aos="fade-up" data-aos-delay="500"  >
                  
                   
                <div class="form-group">
                  <label class="label" >Nom d'utilisateur</label>
                  <div class="input-group">
                  
                      <asp:TextBox ID="TextBox1"  runat="server"  class="form-control" placeholder="Username" ></asp:TextBox>
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="label" >Mot de passe</label>
                  <div class="input-group">
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" TextMode="Password" placeholder="*********"></asp:TextBox> 
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <asp:LinkButton ID="LinkButton1"  runat="server" class="text-small forgot-password  text-white" >Mot de passe oublié?</asp:LinkButton>
                  <asp:Button ID="Button1" runat="server" class="btn btn-block btn-outline-primary" Text="Se connecter" />
                </div>
                <div class="form-group d-flex justify-content-between">
                  <div class="form-check form-check-flat mt-0">
                  </div>
                 
                   
                </div>
                
             

                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>

    
    
  
    
  </div> <!-- .site-wrap -->

  <script src="Content/js/jquery-3.3.1.min.js"></script>
  <script src="Content/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="Content/js/jquery-ui.js"></script>
  <script src="Content/js/popper.min.js"></script>
  <script src="Content/js/bootstrap.min.js"></script>
  <script src="Content/js/owl.carousel.min.js"></script>
  <script src="Content/js/jquery.stellar.min.js"></script>
  <script src="Content/js/jquery.countdown.min.js"></script>
  <script src="Content/js/bootstrap-datepicker.min.js"></script>
  <script src="Content/js/jquery.easing.1.3.js"></script>
  <script src="Content/js/aos.js"></script>
  <script src="Content/js/jquery.fancybox.min.js"></script>
  <script src="Content/js/jquery.sticky.js"></script> 
          <script type="text/javascript">
              function alertx(msg) {
            var Alert = new CustomAlert();
            Alert.render(msg);
	
	}
        </script>
  <script src="Content/js/main.js"></script>
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
    </form>
  </body>
</html>

