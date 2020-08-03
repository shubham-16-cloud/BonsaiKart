<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="adminhome.aspx.cs" Inherits="Admin_adminhome" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .btn-info {
            width: 100%;
        }

        .btn {
            padding: 20px 0px 0px 0px;
        }

        .glyphicon1 {
            top: -7px !important;
            right: -32px !important;
            font-size: 60px !important;
        }

        .fontsize {
            font-size: 20px;
            text-align: center !important;
            float: none !important;
        }

        .fontline {
            width: 100%;
            background-color: red;
            margin: 0px;
            text-align: left !important;
            margin-top: 10px;
        }
        .chart{
            margin :auto;
        }

        .dropdown-header {
            background-color: #5598f1 !important;
            color: #bf2929 !important;
            padding: 10px !important;
        }
        .viwebtn{
            padding: 10px !important;
            border:0px !important;
            border-color:none !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="alert alert-info">
                    Admin DashBord
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <a href="new_orderview.aspx">
                            <div class="btn btn-info">
                                <div class="col-md-2">
                                    <i class="glyphicon1 glyphicon glyphicon-shopping-cart"></i>
                                </div>
                                <div class="col-md-12 fontsize">
                                    <asp:Label ID="lblordercount" runat="server" Text="200"></asp:Label><br />
                                    Total Order
                                </div>
                                <p style="background-color: #30b5dc" class="fontline">
                                    Total Order<span style="padding-right: 10px;" class="glyphicon glyphicon-circle-arrow-right pull-right"></span>
                                </p>

                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#">
                            <div style="background-color: #84f555" class="btn btn-info">
                                <div class="col-md-2">
                                    <i class="glyphicon1 glyphicon glyphicon-user"></i>
                                </div>
                                <div class="col-md-12 fontsize">
                                    <asp:Label ID="lblusercoint" runat="server" Text="200"></asp:Label><br />
                                    Total User
                                </div>
                                <p style="background-color: #5edc29" class="fontline">
                                    Total User<span style="padding-right: 10px;" class="glyphicon glyphicon-circle-arrow-right pull-right"></span></p>
                                

                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="addvetisementconfirm.aspx">
                            <div style="background-color: #7639b3" class="btn btn-info">
                                <div class="col-md-2">
                                    <i class="glyphicon1 glyphicon glyphicon-expand"></i>
                                </div>
                                <div class="col-md-12 fontsize">
                                    <asp:Label ID="lbladdvetisementcount" runat="server" Text="200"></asp:Label><br />
                                    Total Advetisement
                                </div>
                                <p style="background-color: #592190" class="fontline">
                                    Total Advetisement<span style="padding-right: 10px;" class="glyphicon glyphicon-circle-arrow-right pull-right"></span>
                                </p>

                            </div>
                        </a>
                    </div>

                </div>

                <!-- chart-->
                <br />
                <asp:DropDownList ID="ddlcharttype" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlcharttype_SelectedIndexChanged" CssClass="dropdown dropdown-header pull-right"></asp:DropDownList>
                <div style ="Width:100% ">
                    <asp:Chart ID="chart1" runat="server" CssClass=" chart container" Width="1000px" >
                        <Legends>
                            <asp:Legend Name="Legend1">
                            </asp:Legend>
                        </Legends>
                        <Titles>
                            <asp:Title Text="Admin Chart" Name="any"></asp:Title>

                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" ChartArea="ChartArea1" Legend="Legend1">
                                <%--<Points>
                                    <asp:DataPoint AxisLabel="any" YValues="10" />
                                    <asp:DataPoint AxisLabel="any" YValues="20" />
                                    <asp:DataPoint AxisLabel="any" YValues="30" />
                                    <asp:DataPoint AxisLabel="any" YValues="40" />
                                    <asp:DataPoint AxisLabel="any" YValues="50" />
                                    <asp:DataPoint AxisLabel="any" YValues="60" />
                                    <asp:DataPoint AxisLabel="any" YValues="70" />
                                    <asp:DataPoint AxisLabel="any" YValues="80" />
                                </Points>--%>
                            </asp:Series>

                            <%--<asp:Series BorderColor="Red" ChartArea="ChartArea1" LabelForeColor="Maroon" Name="any" Legend="Legend1">
                                <Points>
                                    <asp:DataPoint AxisLabel="any" YValues="10" />
                                    <asp:DataPoint AxisLabel="any" YValues="20" />
                                    <asp:DataPoint AxisLabel="any" YValues="30" />
                                    <asp:DataPoint AxisLabel="any" YValues="40" />
                                    <asp:DataPoint AxisLabel="any" YValues="50" />
                                    <asp:DataPoint AxisLabel="any" YValues="60" />
                                    <asp:DataPoint AxisLabel="any" YValues="70" />
                                    <asp:DataPoint AxisLabel="any" YValues="80" />
                                </Points>
                            </asp:Series>--%>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle Enable3D="true" LightStyle="Realistic" Perspective="2" WallWidth="20" />
                                <AxisX Title="oderid"></AxisX>
                                <AxisY Title="date"></AxisY>
                            </asp:ChartArea>
                        </ChartAreas>

                    </asp:Chart>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <a href="plant_viwe.aspx" style="background-color:#fbad1e" class=" viwebtn btn btn-sm btn-info"> Viwe PLant </a>
                    </div>
                    <div class="col-md-3">
                        <a href="seedlist_viwe.aspx" style="background-color:#84f555" class=" viwebtn btn btn-sm btn-info"> Viwe Seed </a>
                    </div>
                    <div class="col-md-3">
                        <a href="pot_viwe.aspx" style="background-color:#2bc1ab" class=" viwebtn btn btn-sm btn-info"> Viwe Pot </a>
                    </div>
                    <div class="col-md-3">
                        <a href="pebbles_viwe.aspx" style="background-color:#124398" class=" viwebtn btn btn-sm btn-info"> Viwe Pebbles </a>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <a href="fertilizer_viwe.aspx" style="background-color:#5bc0de" class=" viwebtn btn btn-sm btn-info"> Viwe Fertilizer </a>
                    </div>
                    <div class="col-md-6">
                        <a href="Add_sliderimg.aspx" style="background-color:#7639b3" class=" viwebtn btn btn-sm btn-info"> Viwe Slider Image </a>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <a href="viwe_discount.aspx" style="background-color:#b339b1" class=" viwebtn btn btn-sm btn-info"> Viwe Product Discount </a>
                        <br />
                        <br />
                    </div>

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

