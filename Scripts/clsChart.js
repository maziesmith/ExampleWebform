function clsChart(labels, datasets, title) {
    this.labels = labels;
    this.datasets = datasets;
    this.title = title;
    this.backgroundColor = ["#e6194b", "#3cb44b", "#ffe119", "#4363d8", "#f58231", "#911eb4", "#46f0f0", "#f032e6", "#bcf60c", "#fabebe", "#008080", "#e6beff"];
}

clsChart.prototype = {
    constructer: clsChart,
    showBarChart: function (idName) {
        new Chart(document.getElementById(idName), {
            type: 'bar',
            data: {
                labels: this.labels,
                datasets: [
                    {
                        label: "Số Lượng",
                        backgroundColor: this.backgroundColor,
                        data: this.datasets
                    }
                ]
            },
            options: {
                legend: { display: false },
                title: {
                    display: true,
                    text: this.title
                }
            }
        });
    },
    showPieChart: function (idName) {
        new Chart(document.getElementById(idName), {
            type: 'pie',
            data: {
                labels: this.labels,
                datasets: [{
                    label: "Population (millions)",
                    backgroundColor: this.backgroundColor,
                    data: this.datasets
                }]
            },
            options: {
                title: {
                    display: true,
                    text: this.title
                }
            }
        });
    },
    showDoughnutChart: function (idName) {
        new Chart(document.getElementById(idName), {
            type: 'doughnut',
            data: {
                labels: this.labels,
                datasets: [
                  {
                      label: "Population (millions)",
                      backgroundColor: this.backgroundColor,
                      data: this.datasets
                  }
                ]
            },
            options: {
                title: {
                    display: true,
                    text: this.title
                }
            }
        });
    },
}