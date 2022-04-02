window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const Tax = 0.1;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * Tax)

    const addProfit = document.getElementById("profit");
    const taxDom = addTaxDom.value;
    addProfit.innerHTML = Math.floor(inputValue - Math.floor(priceInput.value * 0.1))
  })
})