Imports System.Data.SqlClient
Imports System.Configuration

Public Class PageAbsenceAffichage
    Inherits System.Web.UI.Page

    Dim cpt As Integer
    Dim TabMtrPrvs(20) As String
    Dim labelinter As Label
    Dim cnx1 As SqlConnection
    Dim cmd1 As SqlCommand
    Dim dr1 As SqlDataReader
    Dim cnx2 As SqlConnection
    Dim cmd2 As SqlCommand
    Dim dr2 As SqlDataReader

    Private Sub Bt_changermdp_Click(sender As Object, e As EventArgs) Handles Bt_changermdp.Click
        Response.Redirect("ChangerMDP.aspx")
    End Sub

    Protected Sub Buttonlogout_Click(sender As Object, e As EventArgs) Handles Buttonlogout.Click
        Session.RemoveAll()
        Response.Redirect("LoginOfficiel.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not (IsPostBack) Then

            Dim cp As Integer = 0
            If (Session("user") = Nothing) Then
                Response.Redirect("loginOfficiel.aspx")
            End If
            Label1.Text = Session("name")
            Label2.Text = Label1.Text
            Session("unefoispage") = True

        End If

        cnx1 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")
        cnx2 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")



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

        cnx1.Open()
        cmd1 = New SqlCommand(" SELECT [Matiere], [Jour], [justifie] FROM [ABSENCES] WHERE ([Matricule] ='" + Session("MATRICULE").ToString + "' )", cnx1)
        dr1 = cmd1.ExecuteReader
        If Not (dr1.Read) Then
            LabelMsg.Text = " Vous n'avez aucune abscence pour l'instant. "
            LabelMsg2.Text = ""
        End If
        cnx1.Close()
        cpt = 0
        Dim chaine As String
        Dim nvchaine As String
        While (cpt < MatiereAbsGridView.Rows.Count)

            labelinter = CType(MatiereAbsGridView.Rows(cpt).FindControl("JourLabel"), Label)
            chaine = labelinter.Text
            nvchaine = chaine

            labelinter.Text = Date.Parse(nvchaine).ToString("dddd dd MMMM yyyy")

            cpt = cpt + 1
        End While
    End Sub

End Class