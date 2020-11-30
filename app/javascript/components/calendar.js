import flatpickr from "flatpickr";

const dynamicCalendar = () => {
  const calendar = document.querySelector(".calendar")
  if (calendar == null)
    return

  flatpickr(calendar, {
    minDate: "today",
  })
}

export default dynamicCalendar;
