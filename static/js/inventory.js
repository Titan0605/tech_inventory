document.addEventListener("DOMContentLoaded", function () {
  document
    .getElementById("getInventoryBtn")
    .addEventListener("click", getInventory);
});

function getInventory() {
  fetch("/get_inventory")
    .then((response) => response.json())
    .then((data) => {
      alert(data.message);
      console.log(data.data);
    })
    .catch((error) => console.error("Error:", error));
}
