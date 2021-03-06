import Chart from 'chart.js';
import { userArray } from './charts_helper'

const bestRoomateChart = () => {

  if (document.getElementById('best-roomate-chart') === null)
    return

    fetch('./roommates.json')
  .then((response) => {
    return response.json()
  })
  .then((data) => {
    // Work with JSON data here
    const allData = data['all_data'];
    chartBar(allData)
  })
};


const chartBar = (data) => {
  const ctx = document.getElementById('best-roomate-chart').getContext('2d');
  const chart = new Chart(ctx, {
      // The type of chart we want to create
      type: 'bar',

      // The data for our dataset
      data: {
          labels: userArray(data),
          datasets: [{
              label: 'Temps de travail en minute',
              backgroundColor: '#8EBFFC',
              borderColor: '#8EBFFC',
              data: workTimeArray(data),
              minBarLength: 5,
          }]
      },

      // Configuration options go here
      options: {
        scales: {
          yAxes: [{
            ticks: {
                beginAtZero:true
            }
          }]
        }
      }
  });

};

//<img class="-ml-4 w-12 rounded-full" src="http://res.cloudinary.com/dpoyktjoa/image/upload/kv6of7hn7y1n4w9u4keauns7pisd">
//Object.entries(students)


const workTimeArray = (data) => {
  const array = [];
  Object.entries(data['users']).forEach((user) => {
    array.push(user[1]['work_time']);
  });
  return array
};

export {
  bestRoomateChart
};
