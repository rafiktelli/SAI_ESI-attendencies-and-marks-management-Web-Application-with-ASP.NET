<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PageNotesAffichage.aspx.vb" Inherits="My1stWebApplication.PageNotesAffichage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Notes Affichage</title>
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
    <!-- partial:./Content/partials/_navbar.html -->
    
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
              <span class="profile-text">Bonjour <asp:Label Font-Size="Small" ID="Label1" runat="server" Text="Label"></asp:Label></span>  
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
    <div class="container-fluid page-body-wrapper">
      <!-- partial:./Content/partials/_sidebar.html -->
      
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item nav-profile">
            <div class="nav-link">
              <div class="user-wrapper">
                <div class="profile-image">
                    <canvas class="user-icon" data-name="hello" width="40" height="40" style="width: 40px; height: 40px; border-radius:50px"></canvas>
                </div>
                <div class="text-wrapper">
                  <p class="profile-name">
                      <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                  </p>
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
                </nav>
       

      <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
              <div class="row purchace-popup">
            <div class="col-12" style="height:70px;">
              <span class="d-block d-md-flex align-items-center" style="height:70px;" >
               
              </span>
            </div>
          </div>
             <div  class="scroll-container" style="padding: 2px; display: inline-block; ">
         <!-- hna yet7at le tableau-->    

      
           
                 <h4><asp:Label runat="server" ID="LabelMsg2" Text=" Voici vos notes de toutes les épreuves dans tous les modules durant "></asp:Label></h4>
            
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" width="90%" Height="80%" CssClass="scroll-container table-responsive  table table-hover text-center table-bordered "  BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="0px" cellspacing="0" CellPadding="0" GridLines="Vertical" style="font-family: Calibri;font-size:14px;margin:auto;">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Code_Mat" HeaderText="Matière" ControlStyle-Font-Size="Small" ItemStyle-Height="30px" ItemStyle-Width="300px" SortExpression="Code_Mat" />
                            <asp:BoundField DataField="CcNote" HeaderText="CC" ControlStyle-Font-Size="Medium" ItemStyle-Height="30px" ItemStyle-Width="200px" SortExpression="CcNote" />
                            <asp:BoundField DataField="TpNote" HeaderText="TP" SortExpression="TpNote" ControlStyle-Font-Size="Medium" ItemStyle-Height="30px" ItemStyle-Width="200px" />
                            <asp:BoundField DataField="CiNote" HeaderText="CI" SortExpression="CiNote" ControlStyle-Font-Size="Medium" ItemStyle-Height="30px" ItemStyle-Width="200px"/>
                            <asp:BoundField DataField="CfNote" HeaderText="CF" SortExpression="CfNote" ControlStyle-Font-Size="Medium" ItemStyle-Height="30px" ItemStyle-Width="200px"/>
                            <asp:BoundField DataField="MoyMod" HeaderText="Moyenne" SortExpression="MoyMod" ControlStyle-Font-Size="Medium" ItemStyle-Height="30px" ItemStyle-Width="200px"/>
                            <asp:ButtonField CommandName="Cancel" ShowHeader="True" Text="Réclamer" ControlStyle-Font-Size="Medium" ItemStyle-Height="30px" ItemStyle-Width="100px "/>

                        </Columns>
                        <HeaderStyle BackColor="white" Height="25px" Font-Bold="True"  CssClass="text-center" BorderWidth="1px" BorderStyle="Solid" BorderColor="Black" ForeColor="Black" />
                <SelectedRowStyle BackColor="#CC3333" Height="40px" Font-Bold="True" ForeColor="Black" />
                    </asp:GridView>
                 <div style="padding:5px;"></div>
                 <h5><asp:Label runat="server" ID="Label3" Text=" Si vous remarquez qu'il y a eu une erreur dans une note, vous pouvez envoyer un mail à votre enseignant en cliquant sur 'Réclamer'. "></asp:Label></h5>
                  
                 <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
            
            <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
           
            <asp:Panel ID="Panel2" runat="server"  Height="176px" Width="540px" CssClass="modalpopup">
                <div style="height:18px;"></div>
                <div class="auto-form-wrapper" style="margin-left:10%;" >
                <span>Votre adresse Email : </span> &nbsp&nbsp&nbsp
                    <span style="width:12px;"></span>
                <span style="right:40px;"> <asp:TextBox ID="TextBox5" Width="260px" runat="server" ReadOnly="False" CssClass="mdi-textbox"></asp:TextBox> </span>
                </div>
                <div style="height:7px;"></div>
                <div class="auto-form-wrapper" style="margin-left:10%;" >
                <span>Votre Mot de Passe : </span>&nbsp&nbsp&nbsp&nbsp
                    <span style="width:10px;"> </span>
                <span style="right:40px;"> <asp:TextBox ID="TextBox4" Width="260px" runat="server" TextMode="Password" CssClass="mdi-textbox-password"></asp:TextBox></span>
                </div>
                <div style="height:7px;"></div>
                
                <div style="height:7px;"></div>
                <div class="auto-form-wrapper" style="margin-left:40%;">
                  <asp:Button ID="Button5" runat="server" Text="Suivant" CssClass="btn btn-inverse-dark"  />
                  <span style="width:5px;"></span>
                  <asp:Button ID="Button6" runat="server"  Text="Annuler" CssClass="btn btn-outline-danger" />

                </div>

            </asp:Panel>
            <cc1:ModalPopupExtender ID="Panel2_ModalPopupExtender" runat="server" TargetControlID="LinkButton2" PopupControlID="Panel2" CancelControlID="Button6" BackgroundCssClass="modalBackgroud">
            </cc1:ModalPopupExtender>
            
            
            <asp:Panel ID="Panel1" runat="server"  Height="345px" Width="752px" CssClass="modalpopup"   >
                <span style="margin-left:90%;"><asp:Button ID="Button3" runat="server" CssClass=" btn btn-inverse-danger" Font-Bold="True"  Text="x" /></span>
                <div style="height:7px;"></div>
                <div class="auto-form-wrapper" style="margin-left:10%;" >
                <span>Destinataire : </span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <span style="width:10px;"></span>
                <span style="right:40px;"> <asp:TextBox ID="TextBox6" runat="server" Width="414px" CssClass="mdi-textbox" ></asp:TextBox> </span>
                </div>
                <div style="height:7px;"></div>
                <div class="auto-form-wrapper" style="margin-left:10%;" >
                <span>Sujet : </span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <span style="width:10px;"> </span>
                <span style="right:40px;"> <asp:TextBox ID="TextBox1" runat="server"  Width="414px" CssClass="mdi-textbox"></asp:TextBox></span>
                </div>
                <div style="height:7px;"></div>
                <div class="auto-form-wrapper" style="margin-left:10%;">
                <span>Corps : </span><br />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <span style="right:40px;"> <asp:TextBox ID="TextBox2" runat="server" Height="135px" Width="414px" TextMode="MultiLine" CssClass="mdi-textbox"></asp:TextBox></span>
                </div>
                <div style="height:7px;"></div>
                <div class="auto-form-wrapper" style="margin-left:50%;">
                <asp:Button ID="Button4" runat="server"   Text="Envoyer" CssClass="btn btn-inverse-primary" />
                    <span style="width:5px;"></span>
                <asp:Button ID="Button7" runat="server"   Text="Précédent"  CssClass="btn btn-outline-danger" />
                </div>
            </asp:Panel>
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="LinkButton1" PopupControlID="Panel1" CancelControlID="Button3" BackgroundCssClass="modalBackgroud"></cc1:ModalPopupExtender>
      
                
            
                          
      
  
            </div>
     
                                
        

             </div>
             <footer class="footer">
          <div class="container-fluid clearfix">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2019
              <a href="http://www.bootstrapdash.com/" target="_blank">Groupe 25</a>. All rights reserved.</span>
            
            
          </div>
        </footer>
    
            </div>
          </div>
           
        </div>




        





         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SaisieNotesConnectionString %>" SelectCommand="SELECT DISTINCT [Code_Mat], [CcNote], [TpNote], [CiNote], [CfNote], [MoyMod] FROM [INSCRITMODULE] WHERE (([Sem] = @Sem) AND ([Matricule] = @Matricule))">
                <SelectParameters>
                    <asp:SessionParameter Name="Sem" SessionField="semestre" Type="String" />
                    <asp:SessionParameter Name="Matricule" SessionField="MATRICULE" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
     





      <!-- main-panel ends -->
    
      
    <!-- page-body-wrapper ends -->
  
  <!-- container-scroller -->
          <!-- plugins:js -->
        
  <script src="./Content/vendors/js/vendor.bundle.base.js"></script>
  <script src="./Content/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="./Content/js/off-canvas.js"></script>
  <script src="./Content/js/misc.js"></script>



  <script type="text/javascript">
   
        function test(source, args)
      {
       
            args.IsValid = true
            
            if (args.Value == "") { document.getElementById(source.controltovalidate).style.backgroundColor = "white"; }
            else
            {
                val = parseFloat(args.Value);

                if (isNaN(val)) {
                    args.IsValid = false;
                    document.getElementById(source.controltovalidate).style.backgroundColor = "red";
                    //alert("Entrée non valide");
                    args.Value = "La note doit etre entre 0 et 20";
                    document.getElementById(source.controltovalidate).value = "";
                        document.getElementById(source.controltovalidate).placeholder = "Entrée invalide"                    
                }
                else {
                    if ((val > 20) || (val < 0)) {
                        
                        document.getElementById(source.controltovalidate).style.backgroundColor = "red";
                        document.getElementById(source.controltovalidate).value = "";
                        document.getElementById(source.controltovalidate).placeholder = "Note entre 0 et 20"
                        //alert("La note doit etre entre 0 et 20");
                        //alertX("Alert", "La note doit etre entre 0 et 20");

                        args.IsValid = false;
                    }
                    else {
                        document.getElementById(source.controltovalidate).style.backgroundColor = "white";
                        document.getElementById(source.controltovalidate).placeholder = ""
                        args.IsValid = true;
                    }
                }
            }
            return true;
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
              function alertx(msg) {
            var Alert = new CustomAlert();
            Alert.render(msg);
	
	}
        </script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
   
 

     

        
         
     
    </form>
</body>
</html>
