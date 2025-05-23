import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close() {
    const modalElement = document.getElementById("modalFrame");
    if (modalElement) {
      const modal = bootstrap.Modal.getInstance(modalElement);
      if (modal) {
        modalElement.addEventListener('hidden.bs.modal', () => {
          // Após o modal fechar, envia um Turbo Stream para limpar o frame
          this.element.innerHTML = "";
        }, { once: true });
        modal.hide();
      }
    }
  }
}

// Sem funcionar ainda