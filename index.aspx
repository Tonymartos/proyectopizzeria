<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="codigopostal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Telefood</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Codigo Postal:
        <asp:TextBox ID="TBcpostal" runat="server" Height="27px"></asp:TextBox>
        <asp:Button ID="BTNbuscar" runat="server" Text="Buscar" />
        <asp:RadioButtonList ID="Rbltiendas" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="valor" DataValueField="idTienda">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Telefood %>" SelectCommand="SELECT [idTienda], ([domicilio]+' '+[poblacion]+' '+[provincia]+' '+[telefono]+' '+[apertura]+' '+[cierre]) as valor FROM [Tiendas] WHERE ([cPostal] = @cPostal) UNION all SELECT [idTienda], ([domicilio]+' '+[poblacion]+' '+[provincia]+' '+[telefono]+' '+[apertura]+' '+[cierre]) as valor FROM [Tiendas] WHERE ([cPostal] LIKE @cPostal2 + '%') and not ([cPostal] = @cPostal)">
            <SelectParameters>t
                <asp:ControlParameter ControlID="TBcpostal" Name="cPostal" PropertyName="Text" Type="String" />
                <asp:Parameter Name="cPostal2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
