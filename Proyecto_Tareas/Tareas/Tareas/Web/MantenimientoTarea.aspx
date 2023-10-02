<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MantenimientoTarea.aspx.cs" Inherits="Tareas.Web.MantenimientoTareaaspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Mantenimiento de Tareas
    </title>

    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
    <script>
        WebFont.load({
            google: {
                "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]
            },
            active: function () {
                sessionStorage.fonts = true;
            }
        });
    </script>

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

    <link href="../assets/vendors/general/tether/dist/css/tether.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/bootstrap-datetime-picker/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/bootstrap-select/dist/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/select2/dist/css/select2.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/ion-rangeslider/css/ion.rangeSlider.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/nouislider/distribute/nouislider.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/owl.carousel/dist/assets/owl.carousel.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/owl.carousel/dist/assets/owl.theme.default.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/dropzone/dist/dropzone.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/summernote/dist/summernote.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/animate.css/animate.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/toastr/build/toastr.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/morris.js/morris.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/sweetalert2/dist/sweetalert2.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/socicon/css/socicon.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/custom/vendors/line-awesome/css/line-awesome.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/custom/vendors/flaticon/flaticon.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/custom/vendors/flaticon2/flaticon.css" rel="stylesheet" type="text/css" />
    <link href="../assets/vendors/general/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Registro de Tareas
                            </h3>
                        </div>
                    </div>
                    <!--begin::Form-->

                    <div class="kt-portlet__body">
                        <div class="kt-form kt-form--label-right kt-margin-t-20 kt-margin-b-10">
                            <div class="row align-items-center">
                                <div class="col-xl-8 order-2 order-xl-1">
                                    <div class="row align-items-center">
                                        <div class="col-md-4 kt-margin-b-20-tablet-and-mobile">
                                            <div class="kt-input-icon kt-input-icon--left">
                                                <asp:TextBox ID="generalSearch" runat="server" placeholder="Buscar..." CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                                <span class="kt-input-icon__icon kt-input-icon__icon--left">
                                                    <span><i class="la la-search"></i></span>
                                                </span>
                                            </div>

                                        </div>
                                        <div class="col-md-4 kt-margin-b-20-tablet-and-mobile">
                                            <div class="kt-form__group kt-form__group--inline">
                                                <div class="kt-form__control">
                                                    <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">Agregar</button>--%>
                                                    <asp:Button ID="btnAgregar" CssClass="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <%--END row align-items-center--%>
                                </div>
                                <div class="col-xl-8 order-2 order-xl-1">
                                    <div class="row align-items-center">
                                        <div class="col-md-12 kt-margin-b-20-tablet-and-mobile">
                                            <div class="kt-section">
                                                <div class="kt-section__info"></div>
                                                <div class="kt-section__content">

                                                    <div id="divMensajeInfo" runat="server" class="alert alert-info fade show" role="alert">
                                                        <div class="alert-icon"><i class="flaticon-information"></i></div>
                                                        <div class="alert-text">
                                                            <asp:Label ID="lblMensajeInfo" runat="server" Text=""></asp:Label>
                                                        </div>

                                                        <div class="alert-close">
                                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                <span aria-hidden="true"><i class="la la-close"></i></span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div id="divMensajeSuccess" runat="server" class="alert alert-success fade show" role="alert">
                                                        <div class="alert-icon"><i class="flaticon-interface-10"></i></div>
                                                        <div class="alert-text">
                                                            <asp:Label ID="lblMensajeSuccess" runat="server" Text=""></asp:Label>
                                                        </div>

                                                        <div class="alert-close">
                                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                <span aria-hidden="true"><i class="la la-close"></i></span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div id="divMensajeError" runat="server" class="alert alert-danger fade show" role="alert">
                                                        <div class="alert-icon"><i class="flaticon-warning"></i></div>
                                                        <div class="alert-text">
                                                            <asp:Label ID="lblMensajeError" runat="server" Text=""></asp:Label>
                                                        </div>

                                                        <div class="alert-close">
                                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                <span aria-hidden="true"><i class="la la-close"></i></span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--END col-xl-8 order-2 order-xl-1 del Mensaje--%>
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="upCrudGrid" runat="server">
            <ContentTemplate>
                <div class="container">
                    <div class="table-responsive">
                        <%--END Contenedor filtros--%>
                        <asp:GridView PageSize="100" AllowPaging="True" OnRowCommand="dgvTareas_RowCommand" OnRowDataBound="dgvTareas_RowDataBound" EmptyDataText="No hay tareas registradas" class="table table-striped table-bordered table-hover" ID="dgvTareas" runat="server" AutoGenerateColumns="False" DataSourceID="tarea">
                            <Columns>
                                <asp:ButtonField CommandName="editRow" Text="<i aria-hidden='true' class='flaticon-edit'></i>" HeaderText="Editar" ImageUrl="~/assets/forms/img/edit.png">
                                    <ControlStyle></ControlStyle>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRow" Text="<i aria-hidden='true' class='flaticon-delete'></i>" HeaderText="Eliminar" ImageUrl="~/assets/forms/img/edit.png">
                                    <ControlStyle></ControlStyle>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>                            
                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                                <asp:BoundField DataField="Titulo" HeaderText="Título" SortExpression="Titulo" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripcion" />
                                <asp:BoundField DataField="FechaRegistro" HeaderText="Fecha de registro" SortExpression="FechaRegistro" DataFormatString="{0:dd-MM-yyyy}" />
                                <asp:BoundField DataField="Completada" HeaderText="Completada" SortExpression="Completada" />
                                <asp:BoundField DataField="FechaFinalizacion" HeaderText="Fecha de finalización" SortExpression="FechaFinalizacion" DataFormatString="{0:dd-MM-yyyy}"/>
                            </Columns>

                            <PagerStyle HorizontalAlign="Center" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="tarea" runat="server" SelectMethod="ListarTareas" TypeName="Tareas.Business.TareaLO">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="generalSearch" DefaultValue=" " Name="filtro" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>

        <div id="addModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class='modal-header'>
                        <h4 class='modal-title' id='myModal'>Agregar registro</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    </div>
                    <div class="col-md-12 modal-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:HiddenField ID="HfCreateID" runat="server" />
                                <div class="col-md-12" style="padding-bottom: 20px;">
                                    <div class="col-md-12">
                                        <div class="m-portlet__body">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-6">
                                                    <label>
                                                        <i class="flaticon2-information"></i>Título:
                                                    </label>
                                                    <asp:TextBox ID="txtTitulo" CssClass="form-control" runat="server" class="form-control m-input" Enabled="true"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-6">
                                                    <label>
                                                        Descripción:
                                                    </label>
                                                    <asp:TextBox ID="txtDescripcion" CssClass="form-control" runat="server" class="form-control m-input" Enabled="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="m-portlet__body">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-6" style="width: 160px">
                                                    <label>
                                                        Estado de la tarea
                                                    </label>
                                                    <asp:DropDownList CssClass="form-control" ID="ddlCompletadaAdd" runat="server">
                                                        <asp:ListItem Text="Completada" Value="Completada" />
                                                        <asp:ListItem Text="En proceso" Value="En Proceso" />
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <!--FIN DEL MODAL BODY-->
                    <div class="modal-footer">
                        <asp:Button ID="btnGuardar" CssClass="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                        <button class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    </div>

                </div>

            </div>

        </div>

          <div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class='modal-header'>
                        <h4 class='modal-title' id='modalEdit'>Editar registro</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    </div>
                    <div class="col-md-12 modal-body">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <div class="col-md-12" style="padding-bottom: 20px;">
                                    <div class="col-md-12">
                                        <div class="m-portlet__body">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-6">
                                                    <label>
                                                       Id
                                                    </label>
                                                    <asp:TextBox ID="txtId_Edit" CssClass="form-control" runat="server" class="form-control m-input" Enabled="false"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-6">
                                                    <label>
                                                       Título
                                                    </label>
                                                    <asp:TextBox ID="txtTitulo_Edit" CssClass="form-control" runat="server" class="form-control m-input" Enabled="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="m-portlet__body">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-6">
                                                    <label>
                                                        Descripción
                                                    </label>
                                                    <asp:TextBox ID="txtDescripcion_Edit" CssClass="form-control" runat="server" class="form-control m-input" Enabled="true"></asp:TextBox>
                                                </div>
                                                 <div class="col-lg-6">
                                                    <label>
                                                        Fecha finalización
                                                    </label>
                                                    <asp:TextBox ID="txtFechaFinalizacion_Edit" CssClass="form-control" runat="server" TextMode = "Date" class="form-control m-input" Enabled="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="m-portlet__body">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-6" style="width: 160px">
                                                    <label>
                                                        Estado de la tarea
                                                    </label>
                                                    <asp:DropDownList CssClass="form-control" ID="ddlCompletadaEdit" runat="server">
                                                        <asp:ListItem Text="Completada" Value="Completada" />
                                                        <asp:ListItem Text="En proceso" Value="En Proceso" />
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <!--FIN DEL MODAL BODY-->
                    <div class="modal-footer">
                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardarEdit_Click" />
                        <button class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    </div>

                </div>

            </div>

        </div>


        <div id="deleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class='modal-header'>
                        <h4 class='modal-title' id='mydeleteModal'>Eliminar registro</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <div class="col-md-12 modal-body">
                                <asp:HiddenField ID="HfDeleteID" runat="server" />
                                <div class="col-md-12" style="padding-bottom: 20px;">
                                    <div class="col-md-12">
                                        <div class="m-portlet__body">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-6">
                                                    <label>
                                                        <i class="flaticon-delete"></i>¿Está seguro que desea eliminar este registro?
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--FIN DEL MODAL BODY-->
                            <div class="modal-footer">
                                <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
                                <button class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <!-- modal-content END -->
            </div>
            <!-- modal-dialog END -->
        </div>
    </form>
    <script src="../assets/js/demo12/scripts.bundle.js" type="text/javascript"></script>
    <link href="../assets/css/demo12/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/demo12/pages/dashboard.js" type="text/javascript"></script>

</body>
</html>
