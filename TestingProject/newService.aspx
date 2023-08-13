<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="newService.aspx.cs" Inherits="TestingProject.newService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>اضافة خدمة جديدة</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-page" dir="rtl">
        <div class="content">
            <div class="card shadow m-2 p-2">
                <form runat="server">
                    <div class="row mb-3">
                        <div class="col-lg-6 d-flex">
                            <label class="ps-3">الخدمة</label>
                            <div class="container-fluid">
                                <asp:TextBox ID="serviceName" CssClass="form-control text" placeholder="ادخل اسم الخدمة" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-6 d-flex">
                            <label class="ps-3">السعر</label>
                            <div class="container-fluid">
                                <asp:TextBox ID="servicePrice" CssClass="form-control text" placeholder="ادخل سعر الخدمة" TextMode="Number" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-6 d-flex">
                            <label class="ps-2">ملاحظة</label>
                            <div class="container-fluid">
                                <div class="mb-3">
                                    <asp:TextBox ID="serviceNotes" CssClass="form-control" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3 d-flex justify-content-around">
                        <asp:Button ID="save" CssClass="btn btn-primary align-self-lg-center w-25" Text="حفظ" runat="server" OnClick="save_Click" />
                    </div>
                </form>
                <asp:Panel ID="alert" CssClass="alert alert-success alert-dismissible bg-success text-light border-0 fade hide" runat="server">
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    <strong>تمت العملية بنجاح - </strong> تمت اضافة الخدمة بنجاح
                </asp:Panel>
                </div>
            </div>
        </div>
</asp:Content>
