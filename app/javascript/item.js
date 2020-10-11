function price() {  
  const priceInput = document.getElementById("item-price")  
  const priceParents = document.querySelectorAll(".item")  
  const addTaxPrice = document.getElementById("add-tax-price")  
  const profit = document.getElementById("profit")    

  priceInput.addEventListener('input', function() {      
    value1 = priceInput.value      
    addTaxPrice.innerHTML = value1 * 0.1    

    value2 = priceInput.value      
    profit.innerHTML = value2 - value1 * 0.1  
  })
}
window.addEventListener('load', price)