
Partial Class tienda
    Inherits System.Web.UI.Page

    Private Sub tienda_Load(sender As Object, e As EventArgs) Handles Me.Load
        Ltactual.Text = Session("Tienda")
        DLmenu.SelectedIndex = 0
    End Sub


End Class
