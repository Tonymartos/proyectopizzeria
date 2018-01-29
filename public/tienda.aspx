<%@ Page Language="VB" AutoEventWireup="false" CodeFile="tienda.aspx.vb" Inherits="tienda" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Telefood - Tienda</title>
        <link rel="stylesheet" href="css/tienda_style.css">
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
                    <div class="carrito">

                    </div>
                    <div class="menucarta">
                        <asp:DataList ID="DLmenu" runat="server" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                            Font-Strikeout="False" Font-Underline="False" RepeatDirection="Horizontal" Height="57px" Width="364px"
                            DataKeyField="idCat">
                            <ItemTemplate>
                                &nbsp;
                                <asp:Button ID="Bcategoria" BackColor="#00000" class="btnCategoria" Font-Size="Medium" runat="server" Text='<%# Eval("categoria") %>' CommandName="Select"
                                />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Telefood %>" SelectCommand="SELECT [categoria], [idCat] FROM [Categorías]"></asp:SqlDataSource>
                    </div>
                    <div class="tactual">
                        <h2>Restaurante actual</h2>
                        <asp:Label ID="Ltactual" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="carta">
                        <asp:ListView ID="lvCarta" runat="server" DataKeyNames="idProducto" DataSourceID="SQLDSproductos" GroupItemCount="3">
                            <ItemTemplate>
                                <td runat="server" style="border:2px solid black; border-radius: 1em; padding: 0.5em; text-align: center;">
                                    <asp:ImageButton ID="imgButton" runat="server" ImageUrl='<%# Eval("imagen", "~/public/img/carta/{0}") %>' />
                                    <br />
                                    <asp:Label ID="productoLabel" runat="server" Text='<%# Eval("producto") %>' />
                                    <br />Precio:
                                    <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />$
                                    <br />
                                    <asp:TextBox ID="txbCantidad" runat="server" Type="number" min="1" value="1"/>
                                    <br />
                                    <asp:Button ID="btnBoton" runat="server" style="padding: 0.5em;" CommandName="Select" Text="Añadir al carrito" />
                                </td>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/public/img/carta/proximamente.png"/>
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
                                <td runat="server" />
                            </EmptyItemTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server" style="border-bottom">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                                <tr id="groupPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style=""></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SQLDSproductos" runat="server" ConnectionString="<%$ ConnectionStrings:Telefood %>" SelectCommand="SELECT * FROM [Productos] WHERE ([idCat] = @idCat)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DLmenu" Name="idCat" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
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