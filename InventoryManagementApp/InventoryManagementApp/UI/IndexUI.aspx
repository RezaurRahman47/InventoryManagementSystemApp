<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="InventoryManagementApp.UI.IndexUI" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title of the document</title>
    <style type="text/css">
        .auto-style1 {
            width: 294px;
        }
        .auto-style2 {
            width: 91px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width: 100%;">
             <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Product Category"></asp:Label>
                <td class="auto-style1">
                    <asp:DropDownList ID="productCategoryDropDownList" runat="server"></asp:DropDownList>
                </td>
            </tr>
           <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                <td class="auto-style1">
                    <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="idHiddenField" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Code"></asp:Label>
                <td class="auto-style1">
                    <asp:TextBox ID="codeTextBox" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Quantity"></asp:Label>
                <td class="auto-style1">
                    <asp:TextBox ID="quantityTextBox" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Unit Price"></asp:Label>
                <td class="auto-style1">
                    <asp:TextBox ID="unitPriceTextBox" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td class="auto-style2">
                    <asp:Button ID="saveButton" runat="server"  Text="Save" OnClick="saveButton_Click" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="messageLabel" runat="server" Text=""  ></asp:Label>
                </td>
            </tr>
        </table>
        <div>
            <asp:GridView ID="productGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("Name")%>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Code">
                        <ItemTemplate>                                                           
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("Code")%>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("Quantity")%>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Price">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("UnitPrice")%>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Category">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("ProductCategoryName")%>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl='<%# String.Format("IndexUI.aspx?code={0}",Eval("Code")) %>'>Edit</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
