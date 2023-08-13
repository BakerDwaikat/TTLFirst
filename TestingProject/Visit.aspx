<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Visit.aspx.cs" Inherits="TestingProject.WebForm2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content" ContentPlaceHolderID="HeadContent" runat="server">
    <title>اضافة زيارة جديدة</title>
    <!-- Daterangepicker css -->
    <link rel="stylesheet" href="assets/vendor/daterangepicker/daterangepicker.css" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-page" dir="rtl">
        <div class="content">
            <div class="card shadow m-2 p-2">
                <form runat="server">
                    <div class="row mb-3">
                        <div class="col-lg-4 d-flex">
                            <div class="container-fluid">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="mdi mdi-magnify search-icon"></i>
                                </span>
                                <asp:DropDownList ID="customerDropList" runat="server" aria-labelledby="dropdownMenuButton" CssClass="btn btn-light dropdown-toggle w-75">
                                </asp:DropDownList>
                            </div>
                                </div>
                            <a href="newCustomer.aspx" class="m-2">
                                <i class="ri ri-add-circle-line h3"></i>
                            </a>
                        </div>
                    </div>
                    <div class="border border-2 p-2">
                        <div class="row mb-3">
                            <div class="col-lg-4 d-flex">
                                <div class="container-fluid">
                                    <div class="btn-group">
                                        <asp:Button ID="visited" runat="server" CssClass="btn btn-outline-primary m-1" Text="تمت الزيارة" OnClick="visited_Click" />
                                        <asp:Button ID="certain" runat="server" CssClass="btn btn-outline-primary m-1" Text="حجز مؤكد" OnClick="certain_Click" />
                                        <asp:Button ID="initial" runat="server" CssClass="btn btn-outline-primary m-1" Text="حجز مبدئي" OnClick="initial_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-4">
                                <label class="form-label">التاريخ</label>
                                <div class="container-fluid ms-sm-5">
                                    <div class="mb-3 position-relative" id="birthdatepicker1">
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="mdi mdi-calendar"></i>&nbsp;
                                            </span>
                                            <asp:TextBox ID="birthDate" runat="server" Text="" CssClass="form-control date" data-toggle="date-picker" data-single-date-picker="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <label class="form-label">اليوم</label>
                                <div class="input-group">
                                    <asp:TextBox ID="dayInput" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <label class="form-label">الساعة</label>
                                <div class="input-group" id="timepicker-input-group2">
                                    <span class="input-group-text"><i class="ri-time-line"></i></span>
                                    <asp:TextBox ID="timepicker2" CssClass="form-control" data-provide="timepicker" placeholder="اختر الوقت" runat="server" data-show-meridian="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">

                            <div class="col-lg-6 d-flex">
                                <div class="container-fluid mt-3">
                                    <div class="dropdown">
                                        <label class="ms-1">نوع الجلسة</label>
                                        <asp:DropDownList ID="ServicesDropList" runat="server" aria-labelledby="dropdownMenuButton" CssClass="btn btn-light dropdown-toggle w-75" OnSelectedIndexChanged="ServicesDropList_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 d-flex">
                                <div class="container-fluid mt-3">
                                    <div class="dropdown">
                                        <label class="ms-1">المعالج/ة</label>
                                        <asp:DropDownList ID="EmployeeDropList" runat="server" aria-labelledby="dropdownMenuButton" CssClass="btn btn-light dropdown-toggle w-75" OnSelectedIndexChanged="EmployeeDropList_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="">
                                <label class="form-label">ملاحظة</label>
                                <div class="input-group">
                                    <asp:TextBox ID="visitNotes" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-4">
                                <label class="form-label">المبلغ</label>
                                <div class="input-group">
                                    <asp:TextBox ID="priceInput" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <label class="form-label">مسدد</label>
                                <div class="input-group">
                                    <asp:TextBox ID="paidInput" CssClass="form-control" runat="server" TextMode="Number" OnTextChanged="paidInput_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <label class="form-label">متبقي</label>
                                <div class="input-group">
                                    <asp:TextBox ID="leftInput" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row mb-3">
                            <label class="form-label h3">الموعد القادم</label>
                            <div class="col-lg-4">
                                <label class="form-label">التاريخ</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="mdi mdi-calendar"></i>&nbsp;
                                    </span>
                                    <asp:TextBox ID="datepicker" runat="server" Text="" CssClass="form-control date" data-toggle="date-picker" data-single-date-picker="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <label class="form-label">الساعة</label>
                                <div class="input-group" id="timepicker-input-group1">
                                    <span class="input-group-text"><i class="ri-time-line"></i></span>
                                    <asp:TextBox ID="timepicker" CssClass="form-control" data-provide="timepicker" placeholder="اختر الوقت" runat="server" data-show-meridian="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4 d-flex">
                                <div class="container-fluid mt-3">
                                    <div class="dropdown">
                                        <label class="ms-1">المعالج/ة</label>
                                        <asp:DropDownList ID="EmployeeDropList2" runat="server" aria-labelledby="dropdownMenuButton" CssClass="btn btn-light dropdown-toggle w-75">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3 mx-1">
                            <label for="example-fileinput" class="form-label">الصور المرفقة</label>
                            <asp:FileUpload runat="server" ID="fileUpload" CssClass="form-control" />
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-6 mb-3 d-flex justify-content-center">
                                <asp:Button ID="save" CssClass="btn btn-primary align-self-lg-center w-75" Text="حفظ" runat="server" OnClick="save_Click" />
                            </div>
                            <div class="col-lg-6 mb-3 d-flex justify-content-center">
                                <asp:Button ID="Previous" CssClass="btn btn-primary align-self-lg-center w-75" Text="اظهار الزيارات السابقة" runat="server" OnClick="Previous_Click" />
                            </div>
                        </div>
                    </div>
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
                </form>
                <asp:Panel ID="alert" CssClass="alert alert-success alert-dismissible bg-success text-light border-0 fade hide" runat="server">
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    <strong>تمت العملية بنجاح - </strong>تمت اضافة الزبون بنجاح
                </asp:Panel>
            </div>
        </div>
    </div>

</asp:Content>
