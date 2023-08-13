<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestingProject._Default" %>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>تسجيل الدخول</title>

    
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- Datatable css -->
    <link href="assets/vendor/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendor/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />

    <!-- Theme Config Js -->
    <script src="assets/js/hyper-config.js"></script>

    <!-- Icons css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

    <!-- App css -->
    <link href="assets/css/app-modern-rtl.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <link href='https://fonts.googleapis.com/css?family=Cairo' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script>
        $(window).load(function () {
            $("#pageprocess").fadeOut(1000);
        }
    </script>
    
    <style>
        body {
            font-family: 'Cairo';
            font-size: 14px;
        }
    </style>
</head>
<body class="authentication-bg" dir="rtl">
    <div id="preloader">
            <div id="status">
                <div class="bouncing-loader"><div ></div><div ></div><div ></div></div>
            </div>
        </div>
        <div class="account-pages pt-2 pt-sm-5 pb-4 pb-sm-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xxl-4 col-lg-5">
                        <div class="card">
                            <!-- Logo -->
                            <div class="card-header py-4 text-center bg-primary">
                                <a href="index.html">
                                    <span><img src="assets/images/logo.png" alt="logo" height="22"></span>
                                </a>
                            </div>

                            <div class="card-body p-4">
                                
                                <div class="text-center w-75 m-auto">
                                    <h4 class="text-dark-50 text-center pb-0 fw-bold">تسجيل الدخول</h4>
                                    <p class="text-muted mb-4">أدخل اسم المستخدم وكلمة المرور للوصول إلى لوحة الإدارة.</p>
                                </div>

                                <form action="#" runat="server">

                                    <div class="mb-3">
                                        <label for="username" class="form-label">اسم المستخدم</label>
                                            <asp:TextBox ID="username" CssClass="form-control text-right" placeholder="أدخل اسم المستخدم" runat="server">
                                            </asp:TextBox>
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">كلمة المرور</label>
                                        <div class="input-group input-group-merge">
                                            <asp:TextBox ID="password" type="password" runat="server" CssClass="form-control" placeholder="أدخل رقمك السري">
                                            </asp:TextBox>
                                            <div class="input-group-text" data-password="false">
                                                <span class="password-eye"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mb-3 mb-0 text-center">
                                        <asp:Button ID="loginBtn" OnClick="LoginBtn_Click" CssClass="btn btn-primary" UseSubmitBehavior="true" runat="server" Text=" تسجيل الدخول " />
                                    </div>

                                </form>
                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
                <asp:Panel ID="alert" runat="server" CssClass="alert alert-danger alert-dismissible bg-danger text-white border-0 fade hide" role="alert">
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                    <strong>خطأ - </strong> اسم المستخدم او كلمة السر خاطئة
                </asp:Panel>
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->
    <!-- App js -->
        <script src="assets/js/app.min.js"></script>
    </body>
</html>
