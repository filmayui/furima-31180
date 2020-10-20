function calculate_tax (){
  const item_price = document.getElementById("item-price")

  item_price.addEventListener("keyup", () => {

    const price = item_price.value

    const add_tax_price = document.getElementById("add-tax-price")
    const price_tax = price * 0.1
    add_tax_price.innerHTML = price_tax

    const profit = document.getElementById("profit")
    const price_profit = price - price_tax
    profit.innerHTML = price_profit
  })
}

window.addEventListener('load', calculate_tax);