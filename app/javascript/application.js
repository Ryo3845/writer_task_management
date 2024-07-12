// Configure your import map in config/importmap.rb.
// Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "custom/menu"

document.addEventListener("turbo:before-fetch-request", (event) => {
  console.log("Turbo request method:", event.detail.fetchOptions.method);
});