import { Controller } from 'stimulus'
import Sortable from 'sortablejs'



export default class extends Controller {

  connect() {
    this.sortable =  Sortable.create(this.element, {
      easing: "cubic-bezier(1, 0, 0, 1)",
      swapThreshold: 1,
      onEnd: this.end.bind(this)

    })
  }
  end(event) {


    let id = event.item.dataset.id


    const changePosition = (event) => {
      fetch(`/users/${id}/move`, {
        method: "POST",
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        credentials: 'same-origin',
        body: JSON.stringify({ all_names: event.from.innerText.replace(/\n/g, '-') })
      })
    };
    changePosition(event);
  }
}

