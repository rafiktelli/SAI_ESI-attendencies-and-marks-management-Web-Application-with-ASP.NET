Public Class PageChoixEnseignant
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (IsPostBack) Then

            Dim cp As Integer = 0
            If (Session("user") = Nothing) Then
                Response.Redirect("loginOfficiel.aspx")
            End If
            Label1.Text = Session("name")

        End If
        Session.Remove("promocode")
        Session.Remove("unefois2")
        Session.Remove("unefois")
        Session.Remove("dkhelafficher")
        Session.Remove("montrerC1")
    End Sub

    Private Sub Bt_changermdp_Click(sender As Object, e As EventArgs) Handles Bt_changermdp.Click
        Response.Redirect("ChangerMDP.aspx")
    End Sub

    Protected Sub Buttonlogout_Click(sender As Object, e As EventArgs) Handles Buttonlogout.Click
        Session.RemoveAll()
        Response.Redirect("LoginOfficiel.aspx")

    End Sub

End Class