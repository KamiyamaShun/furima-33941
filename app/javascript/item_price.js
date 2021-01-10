function price(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1 ;
    const addGainDom = document.getElementById("profit");
    addGainDom.innerHTML = inputValue - (inputValue * 0.1);
  });
}
window.addEventListener('load',price);