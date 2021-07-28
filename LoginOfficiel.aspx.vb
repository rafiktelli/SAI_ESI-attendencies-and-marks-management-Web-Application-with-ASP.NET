Imports System.Data.SqlClient
Imports System.Net.Mail




Public Class LoginOfficiel
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cnx1 As SqlConnection
    Dim cmd1 As SqlCommand
    Dim dr As SqlDataReader
    Dim Message As MailMessage
    Dim client As SmtpClient
    Dim the_Email As String
    Dim the_Password As String
    Dim notFound As Boolean
    Dim selecs As String = "select Semestre from Delai where ID=0"
    Dim drs As SqlDataReader
    Dim cmds As SqlCommand


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'connexion et l'ouverture de la BDD "saisienotes"

        con = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes;Integrated Security=True")
        con.Open()
        ' la commande de l'ouverture de le champ ETUDIANTS et le recherche
        cmd1 = New SqlCommand("SELECT * FROM ETUDIANTS WHERE NomUser='" + TextBox1.Text + "'", con)
        dr = cmd1.ExecuteReader
        ' aussi on fait notre algorithme
        If (dr.Read) Then
            dr.Close()
            cmd1 = New SqlCommand("SELECT * FROM ETUDIANTS WHERE NomUser='" + TextBox1.Text + "' and PassWord='" + TextBox2.Text + "'", con)
            dr = cmd1.ExecuteReader
            If (dr.Read) Then
                Session("user") = TextBox1.Text
                Session("password") = TextBox2.Text
                Session("ENS") = False              ' boolean ENS = 1 si enseignant, sinon étudiant 
                Session("Matricule") = dr.GetString(0)
                Session("name") = dr.GetString(1) + " " + dr.GetString(2)
                Response.Redirect("PageChoixEtudiant.aspx")
            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "showalert", "alertx(' Mot de passe incorrect ');", True)

            End If
        Else
            dr.Close()
            cmd1 = New SqlCommand("SELECT * FROM ENSEIGNANT WHERE NomUser='" + TextBox1.Text + "'", con)
            dr = cmd1.ExecuteReader
            If (dr.Read) Then
                dr.Close()
                cmd1 = New SqlCommand("SELECT * FROM ENSEIGNANT WHERE NomUser='" + TextBox1.Text + "' and Passwd='" + TextBox2.Text + "'", con)
                dr = cmd1.ExecuteReader
                If (dr.Read) Then
                    ' THIS '

                    Session("user") = TextBox1.Text
                    Session("ENS") = True
                    Session("password") = dr.GetString(4)
                    Session("CodeEns") = dr.GetInt16(0)
                    Session("name") = dr.GetString(1)
                    If Not (Session("CodeEns") Like 0) Then
                        Response.Redirect("PageChoixEnseignant.aspx")
                    Else
                        Response.Redirect("PageAbsencesJustification.aspx")
                    End If
                Else
                    ScriptManager.RegisterStartupScript(Me, Page.GetType, "showalert", "alertx(' Mot de passe incorrect ');", True)
                End If

            Else
                If (TextBox1.Text = "Admin") Then
                    If (TextBox2.Text = "azerty6esi") Then
                        Session("name") = "Admin"
                        Session("user") = "personel"
                        Response.Redirect("PageAbsencesJustification.aspx")

                    Else
                        ScriptManager.RegisterStartupScript(Me, Page.GetType, "showalert", "alertx(' Mot de passe incorrect ');", True)
                    End If

                Else
                    ScriptManager.RegisterStartupScript(Me, Page.GetType, "showalert", "alertx(' Utilisateur non trouvé ');", True)

                End If
            End If
        End If
        con.Close()
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click

        notFound = False
        If TextBox1.Text IsNot "" Then
            con = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes;Integrated Security=True")
            con.Open()
            cmd1 = New SqlCommand("SELECT * FROM ETUDIANTS WHERE NomUser='" + TextBox1.Text + "'", con)
            dr = cmd1.ExecuteReader
            If (dr.Read) Then

                the_Password = dr.GetString(4)
            Else
                dr.Close()
                cmd1 = New SqlCommand("SELECT * FROM ENSEIGNANT WHERE NomUser='" + TextBox1.Text + "'", con)
                dr = cmd1.ExecuteReader
                If (dr.Read) Then
                    the_Password = dr.GetString(4)
                Else
                    notFound = True
                End If
            End If
            If (notFound = False) Then
                client = New SmtpClient()
                client.Host = "smtp.gmail.com"
                client.Port = 587
                client.DeliveryMethod = SmtpDeliveryMethod.Network
                client.UseDefaultCredentials = False
                client.EnableSsl = True
                client.Credentials = New System.Net.NetworkCredential("saiesi.website1@gmail.com", "Asia2014")
                Message = New MailMessage()
                Message.From = New MailAddress("saiesi.website1@gmail.com")
                Message.To.Add(New MailAddress(TextBox1.Text + "@esi.dz"))
                Message.Subject = "Votre mot de passe du site web SAI-ESI"
                Message.Body = "Votre mot de passe est : " + the_Password
                client.Send(Message)
            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "showalert", "alertx(' Utilisateur non trouvé ');", True)

            End If
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "showalert", "alertx(' Entrez votre nom d'utilisateur ');", True)
        End If

    End Sub

    Private Sub LoginOfficiel_InitComplete(sender As Object, e As EventArgs) Handles Me.Load
        cnx1 = New SqlConnection("Data Source=DESKTOP-MN1JF5E\SQLEXPRESS;Initial Catalog=saisiedenotes; Integrated Security=True")

        cnx1.Open()
        cmds = New SqlCommand(selecs, cnx1)
        drs = cmds.ExecuteReader
        drs.Read()
        Session("semestre") = "S" + drs(0).ToString
        'Response.Write(DeadLine.ToString)
        cnx1.Close()
    End Sub
End Class
