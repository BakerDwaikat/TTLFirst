<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="newEmployee.aspx.cs" Inherits="TestingProject.newEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>اضافة معالج جديد</title>
    <!-- Daterangepicker css -->
    <link rel="stylesheet" href="assets/vendor/daterangepicker/daterangepicker.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-page" dir="rtl">
        <div class="content">
            <div class="card shadow m-2 p-2">
                <form runat="server">

                    <div class="row mb-3">
                        <div class="col-lg-8 d-flex">
                            <label class="ps-3">الأسم</label>
                            <div class="container-fluid ms-sm-5">
                                <asp:TextBox ID="empName" CssClass="form-control" placeholder="اسم المعالج/ة" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4 d-flex">
                            <div class="form-check">
                                <label class="form-check-label" for="customCheck1">فعال</label>
                                <asp:CheckBox ID="empActive" CssClass="form-check-input" runat="server"/>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-8 d-flex">
                            <div class="row">
                                <div class="col-lg-2">
                                    <label class="ps-1">رقم الدخول للنظام</label>
                                </div>
                                <div class="col-lg-6">
                                    <div class="container-fluid ms-sm-5">
                                <asp:TextBox ID="loginNumber" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                                </div>
                                <div class="col-lg-4 d-flex">
                                    <div class="container-fluid">
                                        <asp:Button ID="sendsms" CssClass="btn btn-success" runat="server" OnClick="sendsms_Click" Text="أرسل كلمة المرور"/>
                                    </div>
                                    <div class="container-fluid">
                                        <i class="ri-whatsapp-line h2 text-success"></i>
                                    </div>
                                </div>
                            </div>
                            
                            
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-8 d-flex">
                            <label class="ps-1">متنقل1</label>
                            <div class="container-fluid ms-sm-5">
                                <asp:TextBox ID="cellular1" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-8 d-flex">
                            <label class="ps-1">متنقل2</label>
                            <div class="container-fluid ms-sm-5">
                                <asp:TextBox ID="cellular2" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-8 d-flex">
                            <label class="ps-1">العنوان</label>
                            <div class="container-fluid ms-sm-5">
                                <asp:TextBox ID="empAddress" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-8 d-flex">
                            <label class="ps-1">التخصص</label>
                            <div class="container-fluid ms-sm-5">
                                <asp:TextBox ID="speciality" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-8 d-flex">
                            <label>تاريخ الميلاد</label>
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
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-8 d-flex">
                            <label class="ps-2">ملاحظة</label>
                            <div class="container-fluid ms-sm-5">
                                <div class="mb-3">
                                    <asp:TextBox ID="empNotes" CssClass="form-control" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
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
                    <strong>تمت العملية بنجاح - </strong>تمت اضافة المعالج بنجاح
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
