function calculate_tax (){
  const item_price = document.getElementById("item-price")

  item_price.addEventListener("keyup", () => {

    const price = item_price.value

    const add_tax_price = document.getElementById("add-tax-price")
    let price_tax = price * 0.1
    price_tax = Math.floor(price_tax)
    add_tax_price.innerHTML = price_tax

    const profit = document.getElementById("profit")
    let price_profit = price - price_tax
    price_profit = Math.floor(price_profit)
    profit.innerHTML = price_profit
  })
}

setInterval(calculate_tax, 1000)