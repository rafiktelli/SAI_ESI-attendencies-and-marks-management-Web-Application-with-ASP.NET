Imports System.Data.SqlClient
Imports System.Configuration

Public Class PageAbsencesJustification
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd2 As SqlCommand
    Dim table As String
    Dim password As String

    Dim Re As Integer
    Dim DeadLine As Date '= #06/07/2019#

    Dim edit As Integer = 0
    Dim selecs As String = "select Delai from Delai where ID=0"
    Dim drs As SqlDataReader
    Dim cmds As SqlCommand

    Dim test As String
    Dim cnx1 As SqlConnection
    Dim cnx2 As SqlConnection
    Dim cnx3 As SqlConnection
    Dim cmd1 As SqlCommand
    Dim cmdup As SqlCommand
    Dim cmdsuppression As SqlCommand
    Dim cmd3 As SqlCommand
    Dim dr1 As SqlDataReader
    Dim dr2 As SqlDataReader
    Dim dr3 As SqlDataReader
    Dim cpt As Integer
    Dim chaine As String
    Dim chaine1 As String
    Protected promocode As String
    Public numgrp As String
    Public numPromo As String
    Protected semestre As String
    Public annee As String
    Protected moduleetude As String
    Dim textcell As String
    Dim postb As String
    Dim gvRow As GridViewRow
    Dim Abs As CheckBox
    Dim dateabs As Date
    Dim dateabsprvs As Date
    Dim row As GridViewRow
    Dim matr As String
    Dim mati As String
    Dim dd As String
    Public condition As Boolean = False
    Public unefois As Boolean
    Dim mtrchng As Boolean
    Dim grpchng As Boolean
    Dim deleaidepasse As Boolean = False

    Class Enregistrement
        Public matriculeabs As String
        Public dateabs As Date
        Public moduleabs As String
        Public semestreabs As String
        Public anneeabs As String
    End Class

    Dim TabAbsPrvs As ArraySegment(Of Enregistrement)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (deleaidepasse) Then
            EtudiantGrid.Enabled = False
            ButtonSave.Enabled = False
        Else
            EtudiantGrid.Enabled = True
            ButtonSave.Enabled = True
        End If

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
                Response.Redirect("loginOfficiel.aspx")
            End If
            If (Session("name") Like "") Then
                Label1.Text = "Personel Admin"
                Label2.Text = Label1.Text

            Else
                Label1.Text = Session("name")
                test = Session("name")
                Label2.Text = Label1.Text
            End If
        End If

            LabelPrm.Text = DDPrm.SelectedValue
        LabelGrp.Text = DDGr.SelectedValue

        numgrp = DDGr.SelectedValue
        promocode = DDPrm.SelectedValue
        semestre = "S1"
        'Session("promocode") = DDPrm.SelectedValue
        annee = "2018"
        'Session("Gr") = numgrp
        Session("semestre") = "S1"

        If (Session("unefois") Like True) Then
            Session("promocode") = promocode
            Session("Gr") = numgrp

            'Session("promocode") = "1CP"
        End If
        Session("promocode") = promocode
        Session("Gr") = numgrp


    End Sub

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
                rest.Text = "Attention C'est le dernier jours pour remettre les liverables"
            Else
                If (Re <= 0) Then
                    rest.Text = " Délai dépassé "
                    deleaidepasse = True
                End If
            End If


        End If
    End Sub




    Protected Sub Changement(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender


        If ((dateabs Like Calendar1.SelectedDate)) Then
            'ClientScript.RegisterClientScriptBlock(Me.GetType(), "showalert", "alert(' Veuillez selectionner la date ');", True)
            'Session("unefois") = True
        Else
            LabelMsg2.Text = "  Vous justifiez les abscences du " + Calendar1.SelectedDate.ToString("dddd dd MMMM yyyy")

            Session("promocode") = DDPrm.SelectedValue
            Session("Gr") = DDGr.SelectedValue
            cnx1 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")

            cnx1.Open()
            cmd1 = New SqlCommand("SELECT DISTINCT absence.Matricule, etudiant.NomEtud, etudiant.Prenoms, absence.Matiere FROM ABSENCES AS absence INNER JOIN ETUDIANTS AS etudiant ON absence.Matricule = etudiant.Matricule INNER JOIN INSCRITS AS inscrit ON absence.Matricule = inscrit.Matricule AND absence.Matricule = inscrit.Matricule WHERE (inscrit.Gr = '" + DDGr.SelectedValue.ToString + "') AND (inscrit.Promo = '" + DDPrm.SelectedValue.ToString + "') AND (absence.Jour = '" + Calendar1.SelectedDate.ToString("yyyy-MM-dd") + "') ORDER BY etudiant.NomEtud", cnx1)
            dr1 = cmd1.ExecuteReader
            If Not (dr1.Read) Then
                LabelMsg.Text = " Aucune abscence enregistrée dans ce jour là pour ce groupe. "
                LabelMsg2.Text = ""
            Else
                LabelMsg.Text = ""
            End If
            cnx1.Close()

            Session("dT") = Calendar1.SelectedDate
            EtudiantGrid.DataBind()
            cpt = 0
            While (cpt < EtudiantGrid.Rows.Count)
                Abs = CType(EtudiantGrid.Rows(cpt).FindControl("JustfCheckBox"), CheckBox)
                Abs.Checked = False
                cpt = cpt + 1
            End While

            cnx1.Open()
            cmd3 = New SqlCommand(" SELECT Matricule,Jour,justifie  
                                FROM ABSENCES
                                WHERE Jour ='" + Calendar1.SelectedDate.ToString("yyyy-MM-dd") + "'", cnx1)
            dr2 = cmd3.ExecuteReader
            While (dr2.Read)
                cpt = 0
                While (cpt < EtudiantGrid.Rows.Count)
                    Abs = CType(EtudiantGrid.Rows(cpt).FindControl("JustfCheckBox"), CheckBox)
                    textcell = EtudiantGrid.Rows(cpt).Cells(0).Text
                    If ((textcell Like dr2(0).ToString) And ((dr2(2).ToString Like "1") Or (dr2(2).ToString Like "Oui"))) Then
                        Abs.Checked = True
                    End If
                    cpt = cpt + 1
                End While
            End While
            'Response.Write("<div> Etudiant ooooooooooooooooooooooooooooooooooooooooo </div>")

            cnx1.Close()
        End If


        If (Session("montrerC1") Like True) Then
            Calendar1.Enabled = True
            spanCalendrier.Visible = True
            'Calendar1.Visible = True
            Calendar1.Style.Add(HtmlTextWriterStyle.Color, "None")
        Else
            Calendar1.Enabled = False
            spanCalendrier.Visible = False
            'Calendar1.Visible = False
            Calendar1.Style.Add(HtmlTextWriterStyle.Color, "red")
            Calendar1.Style.Add(HtmlTextWriterStyle.Visibility, "False")
        End If
        If (Session("unefois") Like True) Then
            Calendar1.Enabled = True
            spanCalendrier.Visible = True
            Calendar1.Style.Add(HtmlTextWriterStyle.Color, "None")
        End If
    End Sub

    Protected Sub ButtonSave_Click(sender As Object, e As EventArgs) Handles ButtonSave.Click
        If ((dateabs Like Calendar1.SelectedDate)) Then
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "showalert", "alertx(' Veuillez selectionner la date ');", True)
        Else
            cnx3 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes;Integrated Security=True")
            cnx2 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes;Integrated Security=True")
            cnx2.Open()
            dateabs = Calendar1.SelectedDate
            cpt = 0
            While (cpt < EtudiantGrid.Rows.Count)
                Abs = CType(EtudiantGrid.Rows(cpt).FindControl("JustfCheckBox"), CheckBox)

                If (Abs.Checked = True) Then
                    cnx3.Open()
                    row = EtudiantGrid.Rows(cpt)
                    matr = row.Cells(0).Text
                    'mati = row.Cells(3).Text
                    dd = Calendar1.SelectedDate.ToString()
                    dd = Calendar1.SelectedDate.Year.ToString() + "-" + Calendar1.SelectedDate.Month.ToString() + "-" + Calendar1.SelectedDate.Day.ToString() + " 00:00:00.000"
                    'Response.Write(dd)
                    Dim jstf As Boolean = True
                    cmdup = New SqlCommand("UPDATE ABSENCES set justifie=@abscond where Matricule='" + matr + "' and Jour=@jourabs", cnx3)
                    cmdup.Parameters.AddWithValue("@abscond", "Oui")
                    cmdup.Parameters.AddWithValue("@jourabs", Calendar1.SelectedDate)
                    cmdup.ExecuteNonQuery()
                    cnx3.Close()
                Else
                    cnx3.Open()
                    row = EtudiantGrid.Rows(cpt)
                    matr = row.Cells(0).Text
                    'mati = row.Cells(3).Text
                    dd = Calendar1.SelectedDate.ToString()
                    dd = Calendar1.SelectedDate.Year.ToString() + "-" + Calendar1.SelectedDate.Month.ToString() + "-" + Calendar1.SelectedDate.Day.ToString() + " 00:00:00.000"
                    'Response.Write(dd)
                    Dim jstf As Boolean = False
                    cmdup = New SqlCommand("UPDATE ABSENCES set justifie=@abscond where Matricule='" + matr + "' and Jour=@jourabs", cnx3)
                    cmdup.Parameters.AddWithValue("@abscond", "Non")
                    cmdup.Parameters.AddWithValue("@jourabs", Calendar1.SelectedDate)
                    cmdup.ExecuteNonQuery()
                    cnx3.Close()

                End If

                cpt = cpt + 1
            End While
            cnx2.Close()
        End If

    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        Session("promocode") = DDPrm.SelectedValue
        Session("Gr") = DDGr.SelectedValue
    End Sub


    Private Sub DDGr_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDGr.SelectedIndexChanged

        Session("montrerC1") = True
        If (Session("dkhelafficher") Like True) Then

            Session("dkhelafficher") = False

        End If

    End Sub

    Private Sub Bt_changermdp_Click(sender As Object, e As EventArgs) Handles Bt_changermdp.Click
        If Not (Session("name") Like "Admin") Then
            Response.Redirect("ChangerMDP.aspx")
        Else
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "showalert", "alertx(' Vous ne pouvez pas changer de mot de passe avec un compte admin ');", True)
        End If
    End Sub


    Private Sub DDPrm_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDPrm.SelectedIndexChanged

        Session("montrerC1") = True
        If (Session("dkhelafficher") Like True) Then

            Session("dkhelafficher") = False

        End If
        Session("promocode") = DDPrm.SelectedValue

        DDGr.AppendDataBoundItems = False
    End Sub


    Protected Sub Buttonlogout_Click(sender As Object, e As EventArgs) Handles Buttonlogout.Click
        Session.RemoveAll()
        Response.Redirect("LoginOfficiel.aspx")

    End Sub

End Class