// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
// import "modal_controller";
// import "bootstrap"
// import "./controllers"
// import "controllers";

document.addEventListener("turbo:frame-load", (event) => {
  if (event.target.id === "modal") {
    // Aguarda o próximo tick para garantir que o modal está no DOM
    setTimeout(() => {
      const modalElement = document.getElementById("modalFrame");
      if (modalElement) {
        const modal = new bootstrap.Modal(modalElement);
        modal.show();
      }
    }, 0);
  }
});
