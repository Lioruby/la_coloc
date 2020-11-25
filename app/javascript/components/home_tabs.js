const initTabs = () => {
  const activeTab = document.querySelector('.tab .active')
  const tabs = document.querySelectorAll('.tabs')

  tabs.forEach((tab) => {
    tab.addEventListener('click', function(event) {
      if (tab != activeTab) {
        tab.classList.add('active', 'border-b-2', 'rounded-bl-md' 'border-yellow-500', 'bg-gray-800')
        tab.classList.remove('bg-gray-700')
      }
    })
  })
}

export default initTabs;


