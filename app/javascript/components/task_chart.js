import Chart from 'chart.js';
import { userArray } from './charts_helper'



const tasksChart = () => {

  if (document.getElementById('task-chart-0') === null)
    return

  fetch('./roommates.json')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
      const allData = data['all_data'];
      allData.users.forEach((user, i) => {
        taskChart(allData, i)
      })
    })
};


const taskChart = (data, i) => {
  const ctx = document.getElementById(`task-chart-${i}`).getContext('2d');
  const chart = new Chart(ctx, {
      // The type of chart we want to create
      type: 'pie',

      // The data for our dataset
      data: {
          labels: taskArray(data, i),
          datasets: [{
                      backgroundColor: data.time_reference[0].color,
                      data: taskDataPerUsers(data, i),
                      weight: 5
                    }]
      },

      // Configuration options go here
      options: {
        legend: {
          display: false
        }
      }
  }
  );

};

const colorArray = (data) => {
  const array = []
  data.time_reference.forEach((hash) => {
    array.push(hash.color)
  })
  return array
};


const taskDataPerUsers = (data, i) => {
  const data_info = []
  Object.entries(data.time_reference[i].tasks).forEach((infoArray) => {
    data_info.push(infoArray[1])
  });

  return data_info
};

const taskArray = (data, i) => {
  const array = [];
  Object.entries(data.time_reference[i].tasks).forEach((infoArray) => {
    array.push(infoArray[0])
  });

  return array
};



export {
  tasksChart
};
