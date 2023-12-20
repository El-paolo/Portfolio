import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["text", "card"];
  opennclose() {
    if (this.textTarget.classList.contains("hidden"))
      this.textTarget.classList.remove("hidden");
    else this.textTarget.classList.add("hidden");
  }


  mouseover() {
    const height = this.cardTarget.clientHeight;
    const width = this.cardTarget.clientWidth;

    this.cardTarget.addEventListener("mousemove", (e) => {
      const { layerX, layerY } = e;
      const yRotation = ((layerX - width / 2) / width) * 8;
      const xRotation = ((layerY - height / 2) / height) * 5;

      const string = `
            perspective(500px)
            scale(1.1)
            rotateX(${xRotation}deg)
            rotateY(${yRotation}deg)
            `;
      this.cardTarget.style.transform = string;
    });

    this.cardTarget.addEventListener('mouseout', () => {
        this.cardTarget.style.transform = `
        perspective(500px)
        scale(1)
        rotateX(0)
        rotateY(0)
        `;
    });

 
  }

}
