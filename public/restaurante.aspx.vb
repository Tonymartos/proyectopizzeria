
Partial Class codigopostal
    Inherits System.Web.UI.Page

    Private Sub codigopostal_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Dim cp As String = TBcpostal.Text
            Dim bpostal As String = cp(0) & cp(1)
            SqlDataSource1.SelectParameters.Item("cPostal2").DefaultValue = bpostal
            SqlDataSource1.DataBind()
        End If
    End Sub

    Protected Sub Rbltiendas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Rbltiendas.SelectedIndexChanged
        Dim nombreTienda = Rbltiendas.SelectedItem.Text
        Session("tienda") = nombreTienda
        Response.Redirect("tienda.aspx")
    End Sub


    Protected Sub BTNbuscar_Click(sender As Object, e As EventArgs) Handles BTNbuscar.Click

    End Sub
End Class
