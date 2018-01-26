<%@ Page Language="VB" AutoEventWireup="false" CodeFile="restaurante.aspx.vb" Inherits="codigopostal" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Telefood</title>
        <link rel="stylesheet" href="css/index_style.css">
    </head>

    <body>
        <form id="form1" runat="server">
            <div>
                <header>
                    <div class="rsociales"></div>
                    <div class="logo">
                        <img src="img/header/logo.jpg" />
                    </div>
                    <div class="menu">
                        <a href="index.html">Inicio</a>
                        <a href="restaurante.aspx">Restaurante</a>
                        <a href="nosotros.html">Sobre Nosotros</a>
                        <a href="contacto.html">Contacto</a>
                    </div>
                </header>
                <main>
                    <div class="codigopostal">
                        <p>¡Encuentra tu restaurante!</p>
                        <br />
                        <asp:TextBox ID="TBcpostal" runat="server" Height="42px" Width="227px"></asp:TextBox>
                        <asp:Button ID="BTNbuscar" class="buscador" runat="server" Text="Buscar" Width="105px" />
                    </div>

                    <asp:RadioButtonList ID="Rbltiendas" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="valor"
                        DataValueField="idTienda">
                    </asp:RadioButtonList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Telefood %>" SelectCommand="SELECT [idTienda], ([domicilio]+' '+[poblacion]+' '+[provincia]+' '+[telefono]+' '+[apertura]+' '+[cierre]) as valor FROM [Tiendas] WHERE ([cPostal] = @cPostal) UNION all SELECT [idTienda], ([domicilio]+' '+[poblacion]+' '+[provincia]+' '+[telefono]+' '+[apertura]+' '+[cierre]) as valor FROM [Tiendas] WHERE ([cPostal] LIKE @cPostal2 + '%') and not ([cPostal] = @cPostal)">

                        <SelectParameters>
                            <asp:ControlParameter ControlID="TBcpostal" Name="cPostal" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="cPostal2" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </main>
                <footer>
                    <div class="copyr">
                        <h3>©Pizzeria - This is a education material</h3>
                    </div>
                    <div class="rsociales"></div>
                </footer>
            </div>
        </form>
    </body>

    </html>