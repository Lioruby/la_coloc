const initTabs = () => {
  const taskTab = document.querySelector('#taskTab');
  const colocTab = document.querySelector('#colocTab');

  if (taskTab == null)
    return

  taskTab.classList.remove('bg-gray-700');
  taskTab.classList.add('border-b-2', 'rounded-bl-md', 'border-yellow-500', 'bg-gray-800');

  function toggleTaskTab() {
    taskTab.classList.remove('bg-gray-700')
    taskTab.classList.add('border-b-2', 'rounded-bl-md', 'border-yellow-500', 'bg-gray-800')
    colocTab.classList.add('bg-gray-700')
    colocTab.classList.remove('border-b-2', 'rounded-bl-md', 'border-yellow-500', 'bg-gray-800')
  }

  taskTab.addEventListener('click', (event) => {
    toggleTaskTab();
  })

  function toggleColocTab() {
    colocTab.classList.remove('bg-gray-700')
    colocTab.classList.add('border-b-2', 'rounded-bl-md', 'border-yellow-500', 'bg-gray-800')
    taskTab.classList.add('bg-gray-700')
    taskTab.classList.remove('border-b-2', 'rounded-bl-md', 'border-yellow-500', 'bg-gray-800')
  }

  colocTab.addEventListener('click', (event) => {
    toggleColocTab();
  })

}

export default initTabs;


