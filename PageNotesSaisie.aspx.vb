Imports System.Data.SqlClient
Imports System.Configuration
Public Class PageNotesSaisie
    Inherits System.Web.UI.Page

    Dim Re As Integer
    Dim DeadLine As Date '= #06/07/2025#
    Dim cnx1 As SqlConnection
    Dim cnx2 As SqlConnection
    Dim cnx3 As SqlConnection
    Dim cnx4 As SqlConnection
    Dim cnx5 As SqlConnection
    Dim edit As Integer = 0
    Dim cmd1 As SqlCommand
    Dim cmd2 As SqlCommand
    Dim cmd3 As SqlCommand
    Dim cmd4 As SqlCommand
    Dim cmd5 As SqlCommand
    Dim dr1 As SqlDataReader
    Dim dr2 As SqlDataReader
    Dim test As String
    Dim selecs As String = "select Delai from Delai where ID=0"
    Dim drs As SqlDataReader
    Dim cmds As SqlCommand
    Public change As Integer
    Dim moduleetude2 As String
    Dim moduleetude1 As String
    Dim moduleetude As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cnx1 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")

        cnx1.Open()
        cmds = New SqlCommand(selecs, cnx1)
        drs = cmds.ExecuteReader
        drs.Read()
        DeadLine = drs.GetDateTime(0)
        'Response.Write(DeadLine.ToString)
        cnx1.Close()

        If Not (IsPostBack) Then

            Dim cp As Integer = 0
            If (Session("user") = Nothing) Then
                Response.Redirect("LoginOfficiel.aspx")
            End If
            Label1.Text = Session("name")
            test = Session("name")
            Label2.Text = Label1.Text
        End If
        LabelMdl.Text = DDCodeMat.SelectedValue
        LabelGrp.Text = DDGr.SelectedValue

        If Not (Session("CodeMat") Like Nothing) Then
            moduleetude2 = Session("CodeMat")
        Else
            moduleetude2 = DDCodeMat.SelectedValue
        End If
        moduleetude = DDCodeMat.SelectedValue
        Session("CodeMat") = moduleetude
        Session("Gr") = DDGr.SelectedValue
        If (Session("unefois2") Like True) Then
            Session("CodeMat") = DDCodeMat.SelectedValue
            Session("Gr") = DDGr.SelectedValue
        Else
            'divEGV.Visible = False
            cnx1.Open()
            cmd1 = New SqlCommand(" SELECT [Promo] FROM [INSCRITMODULE] WHERE ([Code_Mat] ='" + DDCodeMat.SelectedValue.ToString + "' )", cnx1)
            dr1 = cmd1.ExecuteReader
            If (dr1.Read) Then
                Session("promocode") = dr1(0).ToString
            End If
            cnx1.Close()
        End If
        divEGV.Visible = True
    End Sub

    Protected Sub Changement(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender


        LabelPrm.Text = Session("promocode")
        Session("CodeMat") = DDCodeMat.SelectedValue
        Session("Gr") = DDGr.SelectedValue
        'GridView1.DataBind()
    End Sub

    Dim deleaidepasse As Boolean = False
    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        'LblDate.Text = Date.Now.ToString("ddddd dd  MMM  yyy  HH:mm:ss")
        Dele.Text = " Délai : " + DeadLine.ToString("dddd dd MMM yyy")
        Re = DateDiff(DateInterval.Day, Now, DeadLine)
        rest.Text = " Il vous reste " + Re.ToString + " jours "
        Dim cp As Integer
        cp = 0

        If (Re < 7) Then
            rest.Visible = True
            If (Re = 1) Then
                rest.Text = " Attention C'est le dernier jours pour remettre les liverables"
            Else
                If (Re <= 0) Then
                    rest.Text = " Délai dépassé "
                    deleaidepasse = True
                    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "cellColor();", True)
                End If
            End If


        End If
    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
    End Sub



    Protected Sub bt_enr_sais_Click(sender As Object, e As EventArgs) Handles bt_enr_sais.Click
        Dim cp As Integer = 0
        Dim CC As String
        Dim TP As String
        Dim CI As String
        Dim CF As String
        Dim MOYMOD As String
        Dim matr As String
        cnx1 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")
        cnx2 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")
        cnx3 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")
        cnx4 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")
        cnx5 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")




        If Not (Session("msgboxacces")) Then
            moduleetude1 = moduleetude
        Else
            moduleetude1 = moduleetude2

        End If



        While (cp < GridView1.Rows.Count)
            CC = CType(GridView1.Rows(cp).FindControl("CcNote"), TextBox).Text
            CF = CType(GridView1.Rows(cp).FindControl("CfNote"), TextBox).Text
            CI = CType(GridView1.Rows(cp).FindControl("CiNote"), TextBox).Text
            TP = CType(GridView1.Rows(cp).FindControl("TpNote"), TextBox).Text
            MOYMOD = CType(GridView1.Rows(cp).FindControl("MoyMod"), TextBox).Text



            CC = CC.Replace(",", ".")
            CF = CF.Replace(",", ".")
            CI = CI.Replace(",", ".")
            TP = TP.Replace(",", ".")
            MOYMOD = MOYMOD.Replace(",", ".")
            matr = GridView1.Rows(cp).Cells(0).Text



            If CC IsNot "" Then
                cnx1.Open()
                cmd1 = New SqlCommand("UPDATE INSCRITMODULE SET CcNote ='" + CC + "' WHERE Matricule ='" + matr + "'and Code_Mat ='" + moduleetude1 + "'", cnx1)
                cmd1.ExecuteNonQuery()
                cmd1.Dispose()
                cnx1.Close()
            End If

            If CF IsNot "" Then
                cnx2.Open()
                cmd2 = New SqlCommand("UPDATE INSCRITMODULE SET CfNote ='" + CF + "' WHERE Matricule ='" + matr + "'and Code_Mat ='" + moduleetude1 + "'", cnx2)
                cmd2.ExecuteNonQuery()
                cmd2.Dispose()
                cnx2.Close()
            End If
            If CI IsNot "" Then
                cnx3.Open()
                cmd3 = New SqlCommand("UPDATE INSCRITMODULE SET CiNote ='" + CI + "' WHERE Matricule ='" + matr + "'and Code_Mat ='" + moduleetude1 + "'", cnx3)
                cmd3.ExecuteNonQuery()
                cmd3.Dispose()
                cnx3.Close()
            End If
            If TP IsNot "" Then
                cnx4.Open()
                cmd4 = New SqlCommand("UPDATE INSCRITMODULE SET TpNote ='" + TP + "' WHERE Matricule ='" + matr + "'and Code_Mat ='" + moduleetude1 + "'", cnx4)
                cmd4.ExecuteNonQuery()
                cmd4.Dispose()
                cnx4.Close()
            End If
            If MOYMOD IsNot "" Then
                cnx5.Open()
                cmd5 = New SqlCommand("UPDATE INSCRITMODULE SET MoyMod ='" + MOYMOD + "' WHERE Matricule ='" + matr + "'and Code_Mat ='" + moduleetude1 + "'", cnx5)
                cmd5.ExecuteNonQuery()
                cmd5.Dispose()
                cnx5.Close()
            End If



            cp = cp + 1

        End While


    End Sub

    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs)
        Dim value As Double
        Dim cv As CustomValidator = CType(source, CustomValidator)
        Dim gvr As GridViewRow = cv.NamingContainer
        Dim tbV As UI.WebControls.TextBox = gvr.FindControl("CfNote")

        If (Double.TryParse(args.Value, value)) Then
            If ((args.Value > 20) Or (args.Value < 0)) Then
                args.IsValid = False
                tbV.CssClass = "ErrorControl"

            Else
                args.IsValid = True
                tbV.CssClass = ""
            End If
        Else
            args.IsValid = False
            tbV.CssClass = "ErrorControl"


        End If

    End Sub



    Private Sub Calcul_Click(sender As Object, e As EventArgs) Handles Calcul.Click
        Dim cp As Integer
        Dim CC As Double
        Dim TP As Double
        Dim CI As Double
        Dim CF As Double
        Dim coef As Double
        Dim coef1 As Double
        Dim coef2 As Double
        Dim coef3 As Double
        Double.TryParse(cccoef.Text, coef)
        Double.TryParse(cicoef.Text, coef1)
        Double.TryParse(cfcoef.Text, coef2)
        Double.TryParse(tpcoef.Text, coef3)


        cp = 0

        While (cp < GridView1.Rows.Count)
                Double.TryParse(CType(GridView1.Rows(cp).FindControl("CcNote"), TextBox).Text, CC)
                Double.TryParse(CType(GridView1.Rows(cp).FindControl("CfNote"), TextBox).Text, CF)
                Double.TryParse(CType(GridView1.Rows(cp).FindControl("CiNote"), TextBox).Text, CI)
                Double.TryParse(CType(GridView1.Rows(cp).FindControl("TpNote"), TextBox).Text, TP)
                Dim moy As Double = (CC * coef + CF * coef2 + CI * coef1 + TP * coef3) / (coef + coef1 + coef2 + coef3)
                moy = Int((moy * 100)) / 100
                CType(GridView1.Rows(cp).FindControl("MoyMod"), TextBox).Text = moy

            cp = cp + 1
        End While

    End Sub

    Private Sub btnPopup_Click(sender As Object, e As EventArgs) Handles btnPopup.Click
        'ModalPopupExtender1.Show()
    End Sub


    Protected Sub Buttonlogout_Click(sender As Object, e As EventArgs) Handles Buttonlogout.Click
        Session.RemoveAll()
        Response.Redirect("LoginOfficiel.aspx")

    End Sub

    Private Sub DDCodeMat_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDCodeMat.SelectedIndexChanged
        cnx1.Open()
        cmd1 = New SqlCommand(" SELECT [Promo] FROM [INSCRITMODULE] WHERE ([Code_Mat] ='" + DDCodeMat.SelectedValue.ToString + "' )", cnx1)
        dr1 = cmd1.ExecuteReader
        If (dr1.Read) Then
            Session("promocode") = dr1(0).ToString
        End If
        cnx1.Close()
        'divEGV.Visible = False
        If Not (tbt.Text Like "0") Then
            Dim a As Long
            a = MsgBox("Souhaitez-vous enregistrer avant de changer de matières ?", vbYesNo)
            If (a = 6) Then
                'moduleetude2 = moduleetude
                Session("msgboxacces") = True
                bt_enr_sais_Click(sender, e)
            Else
                Session("msgboxacces") = False
            End If
        End If
    End Sub


    Private Sub Bt_changermdp_Click(sender As Object, e As EventArgs) Handles Bt_changermdp.Click
        Response.Redirect("ChangerMDP.aspx")
    End Sub

    Private Sub DDGr_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDGr.SelectedIndexChanged
        cnx1.Open()
        cmd1 = New SqlCommand(" SELECT [Promo] FROM [INSCRITMODULE] WHERE ([Code_Mat] ='" + DDCodeMat.SelectedValue.ToString + "' )", cnx1)
        dr1 = cmd1.ExecuteReader
        If (dr1.Read) Then
            Session("promocode") = dr1(0).ToString
        End If
        cnx1.Close()
        'divEGV.Visible = False
        If Not (tbt.Text Like "0") Then
            Dim a As Long
            a = MsgBox("Souhaitez-vous enregistrer avant de changer de groupe ?", vbYesNo)
            If (a = 6) Then
                'moduleetude2 = moduleetude
                Session("msgboxacces") = True
                bt_enr_sais_Click(sender, e)
            Else
                Session("msgboxacces") = False
            End If
        End If
    End Sub

End Class