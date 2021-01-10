function price(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const priceCalc = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = priceCalc ;
    const addGainDom = document.getElementById("profit");
    addGainDom.innerHTML = inputValue - priceCalc;
  });
}
window.addEventListener('load',price);