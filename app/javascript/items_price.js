window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const profitNumber = document.getElementById("profit")

  priceInput.addEventListener('keyup', function(){
    const inputValue = priceInput.value;
    const value_result = inputValue * 0.1

    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

    profitNumber.innerHTML = (Math.floor(inputValue - value_result));

  });
});