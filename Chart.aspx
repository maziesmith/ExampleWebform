<%@ Page MasterPageFile="~/MasterPage.master" Language="VB" AutoEventWireup="false" CodeFile="Chart.aspx.vb" Inherits="Chart" %>

<asp:content id="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        canvas{
            margin-bottom: 50px
        }
    </style>
    <div class="row">
        <div class="col-md-7">
            <canvas id="bar-chart"></canvas>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <canvas id="pie-chart"></canvas>
        </div>
        <div class="col-md-6">
            <canvas id="doughnut-chart"></canvas>
        </div>
    </div>

</asp:content>

<asp:content id="Content1" ContentPlaceHolderID="bottom" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

    <script>

        // Vehicle - superclass
        function Vehicle(name) {
            this.name = name;
        }

        Vehicle.prototype.start = function () {
            return "engine of " + this.name + " starting...";
        };

        // Car - subclass
        function Car(name) {
            Vehicle.call(this,name); // call super constructor.
        }

        // subclass extends superclass
        Car.prototype = Object.create(Vehicle.prototype);

        // subclass method
        Car.prototype.run = function () {
            console.log("Hello " + this.start());
        };

        // instances of subclass
        var c1 = new Car("Fiesta");
        var c2 = new Car("Baleno");

        // accessing the subclass method which internally access superclass method
        c1.run();   // "Hello engine of Fiesta starting..."
        c2.run();   // "Hello engine of Baleno starting..."


        $.ajax({
            type: "POST",
            url: "/CommonHandler.ashx",
            data: { typepost: "arrayShowByMon" },
            dataType: 'json',
            success: function OnSuccess(result) {
                var labels = [];
                var datasets = [];
                var length = result.aaData[0].count;
                var title = "Số lượng Văn bản theo tháng trong Năm";

                for (var i = 0; i < length; i++) {
                    labels.push('Tháng '+ result.aaData[i].month);
                    datasets.push(parseInt(result.aaData[i].countt));
                }

                firstChart = new clsChart(labels, datasets, title);
                firstChart.showBarChart("bar-chart")
                firstChart.showPieChart("pie-chart")
                firstChart.showDoughnutChart("doughnut-chart")

            }
        });




    </script>
</asp:content>