<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="ASPNETCURD.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <asp:HiddenField ID="hfEmpID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="EmpName"></asp:Label>
                    </td>
                     <td colspan="2">
                         <asp:TextBox ID="txtEmpName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="EmpDesignation"></asp:Label>
                    </td>
                     <td colspan="2">
                         <asp:TextBox ID="txtEmpDesignation" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="EmpMobileno"></asp:Label>
                    </td>
                     <td colspan="2">
                         <asp:TextBox ID="txtEmpmobileno" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="EmpGender"></asp:Label>
                    </td>
                     <td colspan="2">
                         <asp:TextBox ID="txtEmpGender" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="EmpAddress"></asp:Label>
                    </td>
                     <td colspan="2">
                         <asp:TextBox ID="txtEmpAddress" runat="server" TextMode="MultiLine" ></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                     <td colspan="2">
                         <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                         <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                         <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />

                    </td>
                </tr>
                    <tr>
                     <td colspan="2">
                         <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>

                    &nbsp;

                    </td>
                </tr>
                   <tr>
                     <td colspan="2">
                         <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="red"></asp:Label>

                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="EmpName" HeaderText="EmpName" />
                    <asp:BoundField DataField="EmpDesignation" HeaderText="EmpDesignation" />
                    <asp:BoundField DataField="EmpMobileno" HeaderText="EmpMobileno" />
                    <asp:BoundField DataField="EmpGender" HeaderText="EmpGender" />
                    <asp:BoundField DataField="EmpAddress" HeaderText="EmpAddress" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkview" runat="server" CommandArgument='<%# Eval("EmpID")%>' OnClick="lnk_onClick">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
