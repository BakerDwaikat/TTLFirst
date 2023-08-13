<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="TestingProject.WebForm1" %>

<asp:Content ID="Content" ContentPlaceHolderID="HeadContent" runat="server">
    <title>جدول الزيارات</title>
    <!-- Daterangepicker css -->
    <link rel="stylesheet" href="assets/vendor/daterangepicker/daterangepicker.css" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-page" dir="rtl">
        <div class="content">
            <div class="card shadow m-2 p-2">
                <form runat="server">
                    <div class="row mb-3">
                        <div class="col-lg-4">
                            <label class="form-label">من</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="mdi mdi-calendar"></i>&nbsp;
                                </span>
                                <asp:TextBox ID="fromDatePicker" runat="server" Text="" CssClass="form-control date" data-toggle="date-picker" data-single-date-picker="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label">الى</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="mdi mdi-calendar"></i>&nbsp;
                                </span>
                                <asp:TextBox ID="toDatePicker" runat="server" CssClass="form-control date" data-toggle="date-picker" data-single-date-picker="true"></asp:TextBox>
                            </div>
                        </div>
                    
                    <div class="col-lg-4 ">
                        <div class="container-fluid d-flex">
                            <div class="btn-group">
                                <asp:Button ID="all" runat="server" CssClass="btn btn-outline-primary m-1" Text="الكل" OnClick="all_Click" />
                                <asp:Button ID="visited" runat="server" CssClass="btn btn-outline-primary m-1" Text="تمت الزيارة" OnClick="visited_Click" />
                                <asp:Button ID="certain" runat="server" CssClass="btn btn-outline-primary m-1" Text="حجز مؤكد" OnClick="certain_Click"/>
                                <asp:Button ID="initial" runat="server" CssClass="btn btn-outline-primary m-1" Text="حجز مبدئي" OnClick="initial_Click" />
                                </div>
                        </div>
                    </div>
                    </div>
                    <div class="row mb-3">

                        <div class="col-lg-4 d-flex">
                            <div class="container-fluid mt-3">
                                <div class="dropdown">
                                    <label class="">نوع الجلسة</label>
                                    <asp:DropDownList ID="ServicesDropList" runat="server" aria-labelledby="dropdownMenuButton" CssClass="btn btn-light dropdown-toggle">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 d-flex">
                            <div class="container-fluid mt-3">
                                <div class="dropdown">
                                    <label class="">المعالج/ة</label>
                                    <asp:DropDownList ID="EmployeeDropList" runat="server" aria-labelledby="dropdownMenuButton" CssClass="btn btn-light dropdown-toggle">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <asp:LinkButton ID="refreshTable" runat="server" OnClick="refreshTable_Click"><i class="ri ri-refresh-line h3 me-3"></i>
                        </asp:LinkButton>

                    </div>
                    <div class="row mb-3">
                        <asp:GridView ID="GridView1" CssClass="table table-striped dt-responsive nowrap w-100" runat="server" AutoGenerateColumns="false" AllowPaging="true" EmptyDataText="لا توجد زيارات" OnPageIndexChanging="GridView1_PageIndexChanging" PagerStyle-CssClass="pagination pagination-rounded mb-0" PagerSettings-Position="Bottom">
                            <PagerSettings Mode="Numeric" Position="Bottom" PageButtonCount="25" />
                            <PagerStyle CssClass="" HorizontalAlign="Center" Width="100" />
                            <Columns>
                                <asp:BoundField DataField="Customer" HeaderText="الزبون" />
                                <asp:BoundField DataField="Date" HeaderText="التاريخ" />
                                <asp:BoundField DataField="time" HeaderText="الساعة" />
                                <asp:BoundField DataField="Service" HeaderText="الخدمة" />
                                <asp:BoundField DataField="employee" HeaderText="المعالج/ة" />
                                <asp:BoundField DataField="Notes" HeaderText="ملاحظات" />
                                <asp:BoundField DataField="price" HeaderText="المبلغ" />
                                <asp:BoundField DataField="paid" HeaderText="الدفعة" />
                                <asp:BoundField DataField="rest" HeaderText="الرصيد" />
                                <asp:BoundField DataField="picture" HeaderText="صورة" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </form>
                <asp:Panel ID="alert" CssClass="alert alert-success alert-dismissible bg-success text-light border-0 fade hide" runat="server">
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    <strong>تمت العملية بنجاح - </strong>تمت اضافة الزيارة بنجاح
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
