import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const convertDate = (inputFormat) => {
  function pad(s) { return (s < 10) ? '0' + s : s; }
  var d = new Date(inputFormat)
  return [pad(d.getDate()), pad(d.getMonth()+1), d.getFullYear()].join('/')
}

const toggleDateInputs = () => {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  if (startDateInput && endDateInput) {
    flatpickr(startDateInput, {
      disableMobile: true,
      minDate: 'today',
      dateFormat: 'd/m/Y',
      plugins: [new rangePlugin({ input: endDateInput})],
      onClose: function(selectedDates) {
        sessionStorage.setItem("startDate", convertDate(selectedDates[0]));
        sessionStorage.setItem("endDate", convertDate(selectedDates[1]));
      }
    });
  }

}

export { toggleDateInputs }
