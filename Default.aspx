<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebTes._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="container">
        

        <asp:Panel ID="pnlGrid" runat="server" >
            <h1>Client</h1>
            <br />
            <asp:LinkButton ID="btnNew" 
                runat="server" 
                CssClass="btn btn-primary"    
                OnClick="btnAddClient">
                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span> Create New
            </asp:LinkButton>
            <br />
            <panel class="panel panel-default">
                <asp:GridView ID="dgvData" runat="server"
                    AutoGenerateColumns="false"
                    CellPadding="5" CellSpacing="0" BorderWidth="0"
                    UseAccessibleHeader="true" Width="100%"
                    CssClass="table"
                    OnRowCommand="dgv_RowCommand"
                    GridLines="None"
                    AllowPaging="true"
                    AllowCustomPaging="true"
                    PagerSettings-Visible="true">

                    <RowStyle BackColor="White"
                    ForeColor="Black" />
                    <AlternatingRowStyle BackColor="WhiteSmoke"
                        ForeColor="Black" />

                    <Columns>
                        <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Center" SortExpression="client_id">
                            <ItemTemplate>
                                <asp:Label ID="lblClientId" runat="server" Text='<%# Bind("client_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Full Name" SortExpression="full_name"> 
                            <ItemTemplate>
                                <asp:Label ID="lblFullName" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender" SortExpression="gender"> 
                            <ItemTemplate>
                                <asp:Label ID="lblGender" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Of Birth" SortExpression="date_of_birth"> 
                            <ItemTemplate>
                                <asp:Label ID="lblDateOfBirth" runat="server" Text='<%# Bind("date_of_birth", "{0:dd, MMM yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-light"
                                 CommandArgument='<%# Eval("client_id") %>' CommandName="UpdateRow">
                                <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span> Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDetail" runat="server" CssClass="btn btn-light"
                                CommandArgument='<%# Eval("client_id") %>' CommandName="DetailsRow">
                                <span aria-hidden="true" class="glyphicon glyphicon-file"></span> Details
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-light"
                                CommandArgument='<%# Eval("client_id") %>' CommandName="DeleteRow">
                                <span aria-hidden="true" class="glyphicon glyphicon-trash"></span> Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </panel>
        </asp:Panel>
        <asp:Panel ID="pnlForm" runat="server">
            <asp:Panel ID="pnlAdd" runat="server">
                <h3>Create Client</h3>
            </asp:Panel>
            <asp:Panel ID="pnlUpdate" runat="server">
                <h3>Edit Client</h3>
            </asp:Panel>
            <panel class="panel panel-default">
                <asp:Panel ID="pnlErrorForm" runat="server">
                    <div class="alert alert-danger" role="alert">The field must be filled!!</div>
                </asp:Panel>
                <form>
                    <asp:TextBox ID="txId" runat="server" Visible="false" ReadOnly="true"/>
                    <div class="form-group row">
                        <label for="txFullName">Full Name</label> 
                         <asp:TextBox ID="txFullName" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group row">
                        <label for="ddlGender">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group row">
                        <label for="txDateOfBirth">Date Of Birth</label>
                         <asp:TextBox ID="txDateOfBirth" CssClass="form-control" runat="server"  />
                    </div>
                    <div class="form-group row">
                        <asp:Button ID="btnSimpan" CssClass="btn btn-primary" Width="100%" Text="Save" runat="server" OnClick="btnSaveClient"/>
                    </div>
                    <div class="form-group row">
                        <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-light" OnClick="btnCancelClient" >
                            <span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span> Back
                        </asp:LinkButton>
                    </div>
                </form>
            </panel>
        </asp:Panel>
        <asp:Panel ID ="pnlDetails" runat="server">
            <h3>Details</h3>
            <panel class="panel panel-default">

                <div class="form-group row">
                    <label for="lblFullName" class="row">Full Name</label>
                    <h4><asp:Label ID="lblFullName" runat="server" CssClass="row"/></h4>
                </div>
                <div class="form-group row">
                    <label for="lblGender" class="row">Gender</label>
                    <h4><asp:Label ID="lblGender" runat="server" CssClass="row" /></h4>
                </div>
                <div class="form-group row">
                    <label for="lblDateOfBirth" class="row">Date Of Birth</label>
                    <h4><asp:Label ID="lblDateOfBirth" runat="server" CssClass="row" /></h4>
                    
                </div>
                <div class="form-group row">
                    <asp:LinkButton ID="btnCancel2" runat="server" CssClass="btn btn-light" OnClick="btnCancelClient" >
                        <span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span> Back
                    </asp:LinkButton>
                </div>
                
            </panel>
        </asp:Panel>
        <asp:Panel ID="pnlDelete" runat="server">
            <h3>Delete Client</h3>
            <br />
            <h5>Are you sure you want delete this?</h5>
            <panel class="panel panel-default">
                <asp:Label ID="lblIdClient" runat="server" readonly="true" visible="false"></asp:Label>
                <div class="form-group row">
                    <label for="lblFullName2" class="row">Full Name</label>
                    <h4><asp:Label ID="lblFullName2" runat="server" CssClass="row"/></h4>
                </div>
                <div class="form-group row">
                    <label for="lblGender2" class="row">Gender</label>
                    <h4><asp:Label ID="lblGender2" runat="server" CssClass="row" /></h4>
                </div>
                <div class="form-group row">
                    <label for="lblDateOfBirth2" class="row">Date Of Birth</label>
                    <h4><asp:Label ID="lblDateOfBirth2" runat="server" CssClass="row" /></h4>
                    
                </div>
            </panel>
            <div class="col-md-5">
                <asp:Button ID="btnYes" runat="server" Text="Yes" Width="100%" CssClass="btn btn-primary" OnClick="btnDeleteClient"/>
            </div>
            <div class="col-md-5">
                <asp:Button ID="btnNo" runat="server" Text="No" Width="100%" CssClass="btn btn-light" OnClick="btnCancelClient" />
            </div>
        </asp:Panel>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#MainContent_txDateOfBirth').datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });
        
    </script>
    <style>
        .row{
            margin-left : 0px
        }
    </style>

</asp:Content>
