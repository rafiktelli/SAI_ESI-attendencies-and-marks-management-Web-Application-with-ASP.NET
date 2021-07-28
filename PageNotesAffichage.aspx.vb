Imports System
Imports System.Data.SqlClient
Imports System.Web.UI
Imports System.Web.Security
Imports System.Web.Services.Description
Imports System.Net.Mail
Imports System.Collections
Imports System.Configuration
Imports System.Web.UI.WebControls

Public Class PageNotesAffichage
    Inherits System.Web.UI.Page

    Dim Re As Integer
    Dim edit As Integer = 0
    Dim test As String
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim x As Integer
    Public mail_prof As String
    Dim client As SmtpClient
    Dim Message As MailMessage
    Dim groupe As String
    Dim matiere As String
    Dim promo As String
    Dim code_ens As String
    Dim nom_prof As String
    Dim password As String
    Dim cnx2 As SqlConnection
    Dim cmd2 As SqlCommand
    Dim dr2 As SqlDataReader


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cnx2 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")


        If Not (IsPostBack) Then

            Dim cp As Integer = 0
            If (Session("user") = Nothing) Then
                Response.Redirect("loginOfficiel.aspx")
            End If
            Label1.Text = Session("name")
            test = Session("name")
            Label2.Text = Label1.Text
            Session("unefoispage") = True
        End If

        cnx2.Open()
        cmd2 = New SqlCommand("SELECT [Promo], [Sect], [Gr] FROM [INSCRITS] WHERE [Matricule]='" + Session("MATRICULE").ToString + "'", cnx2)
        dr2 = cmd2.ExecuteReader
        If (dr2.Read) Then
            PrmLabel.Text = dr2(0).ToString
            SecLabel.Text = dr2(1).ToString
            GrpLabel.Text = dr2(2).ToString
            If ((Session("semestre") Like "S1") And (Session("unefoispage"))) Then
                LabelMsg2.Text = LabelMsg2.Text + "le premier semestre. "
                Session("unefoispage") = False
            End If
            If ((Session("semestre") Like "S2") And (Session("unefoispage"))) Then
                LabelMsg2.Text = LabelMsg2.Text + "le deuxième semestre. "
                Session("unefoispage") = False
            End If
        End If
        cnx2.Close()
    End Sub



    Private Sub Bt_changermdp_Click(sender As Object, e As EventArgs) Handles Bt_changermdp.Click
        Response.Redirect("ChangerMDP.aspx")
    End Sub

    Protected Sub Buttonlogout_Click(sender As Object, e As EventArgs) Handles Buttonlogout.Click
        Session.RemoveAll()
        Response.Redirect("LoginOfficiel.aspx")
    End Sub



    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim rowIndex As Integer
        Dim row As GridViewRow


        con = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes;Integrated Security=True")
        con.Open()
        cmd = New SqlCommand("SELECT * FROM INSCRITS WHERE Matricule='" + Session("MATRICULE") + "'", con)
        dr = cmd.ExecuteReader
        dr.Read()
        groupe = dr.GetString(4)
        promo = dr.GetString(2)
        dr.Close()
        rowIndex = Convert.ToInt32(e.CommandArgument)
        row = GridView1.Rows(rowIndex)
        matiere = row.Cells(0).Text

        cmd = New SqlCommand("SELECT * FROM ENSEIGNEMENTS WHERE Code_Mat='" + matiere + "' and Gr='" + groupe + "'", con)
        dr = cmd.ExecuteReader
        dr.Read()
        code_ens = dr.GetInt32(0)
        dr.Close()
        cmd = New SqlCommand("SELECT * FROM ENSEIGNANT WHERE Code_Ens='" + code_ens + "'", con)
        dr = cmd.ExecuteReader
        dr.Read()
        nom_prof = dr.GetString(3)
        dr.Close()
        mail_prof = nom_prof + "@esi.dz"
        Session("mail_prof") = mail_prof
        TextBox5.Text = Session("user") + "@esi.dz"
        Panel2_ModalPopupExtender.Show()
        ' Response.Write(mail_prof)
        TextBox6.Text = mail_prof

    End Sub


    Protected Sub Button5_Click1(sender As Object, e As EventArgs) Handles Button5.Click
        If TextBox4.Text IsNot "" Then
            Session("pp") = TextBox4.Text.ToString
            ModalPopupExtender1.Show()
        Else
            'ScriptManager.RegisterStartupScript(Me, Page.GetType, "showalert", "alertx(' Veuillez saisir votre mot de passe de l'Email de l'ESI ');", True)
            Panel2_ModalPopupExtender.Show()
        End If
    End Sub



    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click

        client = New SmtpClient("smtp.gmail.com")
        client.Port = 587
        client.DeliveryMethod = SmtpDeliveryMethod.Network
        client.UseDefaultCredentials = False
        client.EnableSsl = True
        password = Session("pp")
        client.Credentials = New System.Net.NetworkCredential(TextBox5.Text, password)
        Message = New MailMessage()

        Message.From = New MailAddress(TextBox5.Text)

        'Message.From = New MailAddress(Session("user") + "@esi.dz")
        Message.To.Add(New MailAddress(TextBox6.Text))
        'Message.To.Add(New MailAddress(Session("mail_prof")))
        Message.Subject = TextBox1.Text
        Message.Body = TextBox2.Text
        If TextBox5.Text IsNot "" And TextBox6.Text IsNot "" And password IsNot "" Then
            
            'Response.Write(TextBox5.Text + TextBox6.Text + password)
            client.Send(Message)
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "showalert", "alertx(' Veuillez remplir tous les champs ');", True)
        End If
    End Sub

    Protected Sub ButtonAnnuler_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Panel2_ModalPopupExtender.Show()
    End Sub

End Class
