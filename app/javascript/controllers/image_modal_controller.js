import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"
import anime from 'animejs'

// Connects to data-controller="image-modal"
export default class extends Controller {
  connect() {
    this.modal = new Modal(this.element);
    this.modal.show();
    this.animeImage();
  }

  animeImage(){
    const imageGood = this.element.querySelector('.image-good');
    anime({
      targets: imageGood,
      clipPath: ['polygon(0 0, 100% 0, 100% 0, 0 0)', 'polygon(0px 0px, 100% 0px, 100% 100%, 0% 100%)'],
      opacity: [0, 1],
      delay: 1000,
      duration: 3000,
      easing: 'easeInOutQuad',
      complete: function() {
        anime({
          targets: imageGood,
          scale: [1, 1.1, 1],
          duration: 2000,
          easing: 'easeInOutQuad',
          complete: function() {
            setTimeout(() => {
              const url = window.location.href;
              window.location.href = url + '/page_change';
            }, 2000);
          }
        });
      }
    });
  };
};
