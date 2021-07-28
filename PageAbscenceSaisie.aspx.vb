Imports System.Data.SqlClient
Imports System.Configuration

Public Class PageAbscenceSaisie
    Inherits System.Web.UI.Page

    Dim cnx1 As SqlConnection
    Dim cnx2 As SqlConnection
    Dim cnx3 As SqlConnection
    Dim cmd1 As SqlCommand
    Dim cmdrecherche As SqlCommand
    Dim cmdsuppression As SqlCommand
    Dim cmd2 As SqlCommand
    Dim cmd3 As SqlCommand
    Dim dr1 As SqlDataReader
    Dim dr2 As SqlDataReader
    Dim dr3 As SqlDataReader
    Dim cpt As Integer
    Protected promocode As String
    Public numgrp As String
    Protected semestre As String
    Public annee As String
    Protected moduleetude As String
    Dim textcell As String
    Dim postb As String
    Dim gvRow As GridViewRow
    Dim Abs As CheckBox
    Dim dateabs As Date
    Dim dateabsprvs As Date
    Public condition As Boolean = False
    Public unefois As Boolean
    Dim Re As Integer
    Dim DeadLine As Date '= #07/06/2019#
    Dim edit As Integer = 0
    Dim datenow As Date
    Dim moduleetude1 As String
    Dim moduleetude2 As String
    Dim selecs As String = "select Delai from Delai where ID=0"
    Dim drs As SqlDataReader
    Dim cmds As SqlCommand
    Dim chaineprvs As String
    Dim deleaidepasse As Boolean = False

    Dim mtrchng As Boolean
    Dim grpchng As Boolean
    Dim TabAbsPrvs(50) As Boolean
    Dim TabAbsav(50) As Boolean

    'La procedure suivante sert a afficher le délai sous toutes ces formes et tous ces cas
    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick

        Dele.Text = " Délai : " + DeadLine.ToString("dddd dd MMM yyy")
        Re = DateDiff(DateInterval.Day, Now, DeadLine)
        rest.Text = " Il vous reste " + Re.ToString + " jours "
        Dim cp As Integer
        cp = 0

        If (Re < 7) Then
            rest.Visible = True
            If (Re = 1) Then
                rest.Text = "Attention c'est le dernier jour pour remettre les liverables"
            Else
                If (Re <= 0) Then
                    rest.Text = " Délai dépassé "
                    deleaidepasse = True
                    Session("delaidps") = True
                    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "cellColor();", True)
                End If
            End If


        End If
    End Sub

    'La procedure suivante qui se produit en cliquant sur le bouton changer mot de passe pour le rediriger vers la page appropriée
    Private Sub Bt_changermdp_Click(sender As Object, e As EventArgs) Handles Bt_changermdp.Click
        Response.Redirect("ChangerMDP.aspx")
    End Sub

    'La procedure suivante se produit apres chaque accés à la page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Session("delaidps")) Then
            EtudiantGrid.Enabled = False
            ButtonSave.Enabled = False
        Else
            EtudiantGrid.Enabled = True
            ButtonSave.Enabled = True
        End If

        If Not (IsPostBack) Then
            'si on arrive pas a connaitre lutilisateur onn le bloque sur la page login donc on doit le valider on lui sauvgardant son usercode dans une variable session
            Dim cp As Integer = 0
            If (Session("user") = Nothing) Then
                Response.Redirect("loginOfficiel.aspx")
            End If
            Label1.Text = Session("name")

            Label2.Text = Label1.Text

        End If
        cnx1 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")
        'tut ce qui suit pour faire le binding de données et laffichage d inforamtions necessaires sur la page
        LabelMdl.Text = DDCodeMat.SelectedValue
        LabelGrp.Text = DDGr.SelectedValue
        datenow = Calendar1.SelectedDate


        cnx1.Open()
        cmds = New SqlCommand(selecs, cnx1)
        drs = cmds.ExecuteReader
        drs.Read()

        DeadLine = drs.GetDateTime(0)
        'Response.Write(DeadLine.ToString)
        cnx1.Close()

        If Not (Session("CodeMat") Like Nothing) Then
            moduleetude2 = Session("CodeMat")
        Else
            moduleetude2 = DDCodeMat.SelectedValue
        End If


        numgrp = DDGr.SelectedValue
        promocode = "2CP"
        semestre = "S1"
        moduleetude = DDCodeMat.SelectedValue
        annee = "2018"
        Session("CodeMat") = moduleetude
        Session("Gr") = numgrp
        If (Session("unefois") Like True) Then
            Session("CodeMat") = moduleetude
            Session("Gr") = numgrp
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



    End Sub


    'pour se deconnecter une fois il clique sur le bouton deconnecter et vider toutes les variables de session
    Protected Sub Buttonlogout_Click(sender As Object, e As EventArgs) Handles Buttonlogout.Click
        Session.RemoveAll()
        Response.Redirect("LoginOfficiel.aspx")

    End Sub

    Dim datepr As Date = #01/01/1900#

    Protected Sub Changement(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        Timer1_Tick(sender, e)
        'pour afficher le calendreire une fois il a choisie une matiere ou un groupe
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

        If (DateDiff(DateInterval.Day, Calendar1.SelectedDate, datepr) < 0) Then

            'pour laffichage de la date selectionnée
            LabelMsg.Text = "  Vous saisissez les absences du " + Calendar1.SelectedDate.ToString("dddd dd MMMM yyyy")

            LabelPrm.Text = Session("promocode")

            Session("CodeMat") = DDCodeMat.SelectedValue
            Session("Gr") = DDGr.SelectedValue
            Dim gridviewprov As GridView

            EtudiantGrid.DataBind()
            cpt = 0
            While (cpt < EtudiantGrid.Rows.Count)
                Abs = CType(EtudiantGrid.Rows(cpt).FindControl("AbsCheckBox"), CheckBox)
                Abs.Checked = False
                cpt = cpt + 1
            End While

            cnx1.Open()
            cmd3 = New SqlCommand(" SELECT Matricule,Jour,Matiere  
                                FROM ABSENCES
                                WHERE Jour ='" + Calendar1.SelectedDate.ToString("yyyy-MM-dd") + "' AND Matiere='" + moduleetude.ToString + "'", cnx1)
            dr2 = cmd3.ExecuteReader
            'Response.Write(Calendar1.SelectedDate.ToString)

            While (dr2.Read)
                'Response.Write(dr2(4).ToString)
                cpt = 0
                While (cpt < EtudiantGrid.Rows.Count)
                    Abs = CType(EtudiantGrid.Rows(cpt).FindControl("AbsCheckBox"), CheckBox)
                    textcell = EtudiantGrid.Rows(cpt).Cells(0).Text
                    If ((textcell Like dr2(0).ToString) And (moduleetude.ToString Like dr2(2).ToString)) Then
                        Abs.Checked = True
                        'TabAbsPrvs(cpt) = True
                    Else
                        'TabAbsPrvs(cpt) = False
                    End If
                    cpt = cpt + 1
                End While
            End While

            gridviewprov = EtudiantGrid

            Session("gvprov") = TabAbsPrvs

            cnx1.Close()


            cpt = 0
            While (cpt < EtudiantGrid.Rows.Count)
                Abs = CType(EtudiantGrid.Rows(cpt).FindControl("AbsCheckBox"), CheckBox)
                If (Abs.Checked) Then
                    TabAbsPrvs(cpt) = True
                Else
                    TabAbsPrvs(cpt) = False
                End If
                cpt = cpt + 1
            End While
            'TabAbsav = TabAbsPrvs



        Else
            'Session("montrerC1") = False
        End If



    End Sub



    Protected Sub ButtonSave_Click(sender As Object, e As EventArgs) Handles ButtonSave.Click


        If (Calendar1.SelectedDate Like Nothing) Then
            'Calendar1.SelectedDate = DateTime.Today
        End If
        'on doit dabord re confirmer si une date est bien choisie pour ne pas enregistrer une date invalide dans notre bdd
        If ((dateabs Like Calendar1.SelectedDate)) Then
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "showalert", "alertx(' Veuillez selectionner une date ');", True) 'quand aucune date nest selectionnée dans le calendrier
        Else
            If Not (datenow Like dateabs) Then
                Session("dejaenregistre") = True 'si il vient de cliquer sur enregistrer (ie qu il na pas oublié de sauvgarder) donc plus la peine de demander la confirmation
                cpt = 0
                cnx3 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")
                cnx2 = New SqlConnection("Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=saisiedenotes; Integrated Security=True")
                cnx2.Open()
                If Not (Session("msgboxacces")) Then 'ici pour savoir si lacces a cette procedure est fais par clique ou bien par le msgbox (acces forcé de la confirmation)
                    moduleetude1 = moduleetude
                Else
                    moduleetude1 = moduleetude2

                End If

                dateabs = datenow

                While (cpt < EtudiantGrid.Rows.Count)
                    Abs = CType(EtudiantGrid.Rows(cpt).FindControl("AbsCheckBox"), CheckBox)

                    If (Abs.Checked) Then 'si letudiant est marqué absent
                        cnx1.Open()
                        cmdrecherche = New SqlCommand("SELECT Matricule,Jour  
                                FROM ABSENCES
                                WHERE Matricule ='" + EtudiantGrid.Rows(cpt).Cells(0).Text + "' AND Matiere ='" + moduleetude1 + "' AND jour ='" + dateabs.ToString("yyyy-MM-dd") + "'", cnx1)
                        dr3 = cmdrecherche.ExecuteReader
                        If (dr3.Read) Then
                            'Response.Write("<div> matricule existe deja donc on insert pas </div>")
                        Else
                            'on insere letudiant si il existe aps deja avec toutes les infos requises
                            cmd2 = New SqlCommand("INSERT INTO ABSENCES (Anscol,Sem,Matricule,Matiere,Jour,justifie) VALUES (@AnneeScol,@SemestreScol,@MatriculeScol,@ModuleScol,@JourScol,@justifie)", cnx2)
                            cmd2.Parameters.AddWithValue("@AnneeScol", annee)
                            cmd2.Parameters.AddWithValue("@MatriculeScol", EtudiantGrid.Rows(cpt).Cells(0).Text)
                            cmd2.Parameters.AddWithValue("@ModuleScol", moduleetude1)
                            cmd2.Parameters.AddWithValue("@SemestreScol", Session("semestre"))
                            cmd2.Parameters.AddWithValue("@JourScol", dateabs)
                            cmd2.Parameters.AddWithValue("@justifie", "Non")
                            cmd2.ExecuteNonQuery()

                            'Response.Write("<div> Etudiant inseré avec succes </div>")
                        End If
                        cnx1.Close()
                    Else
                        cnx1.Open()
                        cmdrecherche = New SqlCommand("SELECT Matricule,Jour  
                                FROM ABSENCES
                                WHERE Matricule ='" + EtudiantGrid.Rows(cpt).Cells(0).Text + "' AND Matiere ='" + moduleetude1 + "' AND jour ='" + dateabs.ToString("yyyy-MM-dd") + "'", cnx1)
                        dr3 = cmdrecherche.ExecuteReader
                        If (dr3.Read) Then
                            cnx3.Open()
                            ' on le supprime si il existe et que il est declarer present donc pas moyen de faire une erreur
                            'Response.Write("<div> Etudiant supprimé avec succes </div>")
                            cmdsuppression = New SqlCommand("DELETE FROM ABSENCES WHERE Matricule ='" + EtudiantGrid.Rows(cpt).Cells(0).Text + "' AND Matiere ='" + moduleetude1 + "' AND jour = '" + dateabs.ToString("yyyy-MM-dd") + "'", cnx3)
                            cmdsuppression.ExecuteNonQuery()
                            cnx3.Close()
                        End If
                        cnx1.Close()
                    End If

                    cpt = cpt + 1
                End While
                cnx2.Close()
                cpt = 0
                While (cpt < EtudiantGrid.Rows.Count) 'cette boucle pour sauvgarder letat de la table avant le changement de page
                    Abs = CType(EtudiantGrid.Rows(cpt).FindControl("AbsCheckBox"), CheckBox)
                    TabAbsav(cpt) = Abs.Checked
                    cpt = cpt + 1
                End While

                TabAbsPrvs = TabAbsav
            End If
        End If
    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged

        'pour que la date ne soiot pas en dehors dur semestre et inferieur a la date daujourdhui
        cnx1.Open()
        cmds = New SqlCommand("select DateDebutSem,DateFinSem from Delai where ID=0", cnx1)
        drs = cmds.ExecuteReader
        drs.Read()
        Dim datedebutsem As Date = drs.GetDateTime(0)
        Dim datefinsem As Date = drs.GetDateTime(1)
        cnx1.Close()


        If (Not Session("delaidps")) And (DateDiff(DateInterval.Day, Calendar1.SelectedDate, datedebutsem) <= 0) And (DateDiff(DateInterval.Day, datefinsem, Calendar1.SelectedDate) <= 0) And Not (DateDiff(DateInterval.Day, Calendar1.SelectedDate, Today) < 0) Then
            ButtonSave.Visible = True
            EtudiantGrid.Enabled = True
            'tout ce qui suit est une procedure pour verifier si letat de la table a changé pour demander la confirmation de sauvegarde 
            cpt = 0
            While (cpt < EtudiantGrid.Rows.Count) 'cette boucle sert a savoir letat de la table juste avant le postback de la page
                Abs = CType(EtudiantGrid.Rows(cpt).FindControl("AbsCheckBox"), CheckBox)
                If (Abs.Checked) Then
                    TabAbsav(cpt) = True
                Else
                    TabAbsav(cpt) = False
                End If
                cpt = cpt + 1
            End While
            Dim conditiontab As Boolean = True
            cpt = 0
            While (cpt < TabAbsav.Count) 'cette boucle sert a verifier si les deux table sont identique si elles ne le sont pas la confirmation est declanchée
                If Not (TabAbsav(cpt) Like TabAbsPrvs(cpt)) Then
                    conditiontab = False
                End If
                cpt = cpt + 1
            End While
            If (TabAbsav.Equals(Session("gvprov"))) Then
                conditiontab = True
            End If
            If Not (conditiontab) Then
                If Not (Session("dejaenregistre")) Then
                    Dim a As Long 'donc ici la confirmation dans un msgbox est lancée
                    a = MsgBox("Souhaitez-vous enregistrer avant de changer de date ?", vbYesNo)
                    If (a = 6) Then '6 est le code aproprié a YES(Oui)
                        ButtonSave_Click(sender, e) ' ici on force lappel de la procedure qui enregistre si il a choisi denregistrer
                    End If

                End If
            End If
            Session("dejaenregistre") = False
        Else
            Dim c1 As String = Mid(datedebutsem.ToString, 1, 10)
            Dim c2 As String = Mid(datefinsem.ToString, 1, 10)
            ButtonSave.Visible = False
            EtudiantGrid.Enabled = False
            If ((DateDiff(DateInterval.Day, Calendar1.SelectedDate, Today) < 0)) Then
                ClientScript.RegisterClientScriptBlock(Me.Page.GetType(), "showalert", "alertx(' Vous avez selectionner une date supérieur à la date d'aujourd'hui !! ');", True)
            Else
                If Not Session("delaidps") Then
                    ClientScript.RegisterClientScriptBlock(Me.Page.GetType(), "showalert", "alertx(' Veuillez selectionner une date comprise entre '" + c1 + "' et '" + c2 + "'. ');", True)
                Else
                    ClientScript.RegisterClientScriptBlock(Me.Page.GetType(), "showalert", "alertx(' Le Délai est depassé plus besoin de changer ' );", True)

                End If
            End If
        End If


    End Sub


    Private Sub DDCodeMat_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDCodeMat.SelectedIndexChanged

        Session("montrerC1") = True

        cnx1.Open()
        cmd1 = New SqlCommand(" SELECT [Promo] FROM [INSCRITMODULE] WHERE ([Code_Mat] ='" + DDCodeMat.SelectedValue.ToString + "' )", cnx1)
        dr1 = cmd1.ExecuteReader
        If (dr1.Read) Then
            Session("promocode") = dr1(0).ToString
        End If
        cnx1.Close()

        cpt = 0
        While (cpt < EtudiantGrid.Rows.Count)
            Abs = CType(EtudiantGrid.Rows(cpt).FindControl("AbsCheckBox"), CheckBox)
            If (Abs.Checked) Then
                TabAbsav(cpt) = True
            Else
                TabAbsav(cpt) = False
            End If
            cpt = cpt + 1
        End While
        Dim conditiontab As Boolean = True
        cpt = 0
        While (cpt < TabAbsav.Count)
            If Not (TabAbsav(cpt) Like TabAbsPrvs(cpt)) Then
                conditiontab = False
            End If
            cpt = cpt + 1
        End While
        If Not (conditiontab) Then
            If Not (Session("dejaenregistre")) Then
                Dim a As Long
                a = MsgBox("Souhaitez-vous enregistrer avant de changer de matière ?", vbYesNo)
                If (a = 6) Then
                    'moduleetude2 = moduleetude
                    Session("msgboxacces") = True
                    ButtonSave_Click(datenow, e)
                Else
                    Session("msgboxacces") = False
                End If
            End If
        End If
        Session("dejaenregistre") = False

    End Sub


    Private Sub DDGr_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDGr.SelectedIndexChanged

        Session("montrerC1") = True

        cnx1.Open()
        cmd1 = New SqlCommand(" SELECT [Promo] FROM [INSCRITMODULE] WHERE ([Code_Mat] ='" + DDCodeMat.SelectedValue.ToString + "' )", cnx1)
        dr1 = cmd1.ExecuteReader
        If (dr1.Read) Then
            Session("promocode") = dr1(0).ToString
        End If
        cnx1.Close()

        cpt = 0
        While (cpt < EtudiantGrid.Rows.Count)
            Abs = CType(EtudiantGrid.Rows(cpt).FindControl("AbsCheckBox"), CheckBox)
            If (Abs.Checked) Then
                TabAbsav(cpt) = True
            Else
                TabAbsav(cpt) = False
            End If
            cpt = cpt + 1
        End While
        Dim conditiontab As Boolean = True
        cpt = 0
        While (cpt < TabAbsav.Count)
            If Not (TabAbsav(cpt) Like TabAbsPrvs(cpt)) Then
                conditiontab = False
            End If
            cpt = cpt + 1
        End While
        If Not (conditiontab) Then
            If Not (Session("dejaenregistre")) Then
                Dim a As Long
                a = MsgBox("Souhaitez-vous enregistrer avant de changer de groupe ?", vbYesNo)
                If (a = 6) Then
                    ButtonSave_Click(datenow, e)
                End If
            End If
        End If
        Session("dejaenregistre") = False
    End Sub


End Class