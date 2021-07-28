Imports System.Data.SqlClient
Imports System.Configuration

Public Class ChangerMDP
    Inherits System.Web.UI.Page

    Dim con As SqlConnection
    Dim cmd2 As SqlCommand
    Dim table As String
    Dim password As String

    Dim Re As Integer
    Dim DeadLine As Date = #06/07/2019#

    Dim edit As Integer = 0


    Dim test As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (IsPostBack) Then

            Dim cp As Integer = 0
            If (Session("user") = Nothing) Then
                Response.Redirect("LoginOfficiel.aspx")
            End If
            Label1.Text = Session("name")
            Label2.Text = Label1.Text
        End If
        If (Session("ENS")) Then
            If (Session("CodeEns") Like 0) Then
                labelEE.Text = "Personel"
            Else
                labelEE.Text = "Enseignant"
            End If
        Else
            labelEE.Text = "Etudiant"
        End If
    End Sub



    Private Sub Buttonlogout_Click(sender As Object, e As EventArgs) Handles Buttonlogout.Click
        Session.RemoveAll()
        Response.Redirect("LoginOfficiel.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (Session("ENS")) Then
            table = "ENSEIGNANT"
            password = "Passwd"
        Else
            table = "ETUDIANTS"
            password = "PassWord"
        End If

        con = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes;Integrated Security=True")
        con.Open()

        If TextBox1.Text = Session("password") Then

            If TextBox2.Text = TextBox3.Text Then

                If TextBox2.Text <> "" Then
                    'Response.Write("if 3eme")
                    cmd2 = New SqlCommand("update " + table + " set " + password + "='" + TextBox2.Text + "' where NomUser='" + Session("user") + "'")
                    cmd2.Connection = con
                    cmd2.ExecuteNonQuery()
                    'Response.Write("Tout est fait")
                    Session("tef") = True
                    Session("password") = TextBox2.Text
                    If Session("ENS") Then
                        If (Session("CodeEns") Like 0) Then
                            Response.Redirect("PageAbsencesJustification.aspx")
                        Else
                            Response.Redirect("PageChoixEnseignant.aspx")
                        End If
                    Else
                            Response.Redirect("PageChoixEtudiant.aspx")
                    End If
                Else



                    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alertx('VEUILLEZ ENTRER VOTRE NOUVEAU MOT DE PASSE !');", True)
                End If
            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alertx('VEUILLEZ CONFIRMER VOTRE MOT DE PASSE');", True)
            End If

        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alertx('MOT DE PASSE INCORRECT REESSAYER S IL VOUS PLAIT');", True)

        End If

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If Session("ENS") Then
            If (Session("CodeEns") Like 0) Then
                Response.Redirect("PageAbsencesJustification.aspx")
            Else
                Response.Redirect("PageChoixEnseignant.aspx")
            End If
        Else
            Response.Redirect("PageChoixEtudiant.aspx")
        End If
    End Sub


End Class