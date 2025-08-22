// item_price.js
const price = () => {
  const priceInput = document.getElementById("item-price");       // 金額入力
  const feeDom    = document.getElementById("add-tax-price");     // 販売手数料表示
  const profitDom = document.getElementById("profit");            // 販売利益表示

  if (!priceInput || !feeDom || !profitDom) {
    console.log("[price] elements missing", {
      priceInput: !!priceInput, feeDom: !!feeDom, profitDom: !!profitDom
    });
    return;
  }

  const render = () => {
    const value = priceInput.value.trim();
    if (value === "") {
      feeDom.innerHTML = "";
      profitDom.innerHTML = "";
      console.log("[price] empty");
      return;
    }
    const amount = Number(value);
    if (Number.isNaN(amount)) {
      feeDom.innerHTML = "";
      profitDom.innerHTML = "";
      console.log("[price] NaN", value);
      return;
    }
    const fee = Math.floor(amount * 0.1); // 10%の販売手数料
    const profit = amount - fee;

    feeDom.innerHTML = fee.toLocaleString();
    profitDom.innerHTML = profit.toLocaleString();

    console.log("[price] input:", amount, "fee:", fee, "profit:", profit);
  };

  render(); // 初期描画（バリデーション失敗後の再表示にも対応）
  priceInput.addEventListener("input", render); // 手順3: 入力のたびに計算
};

window.addEventListener("turbo:load", () => {    // 手順1: 読み込み確認
  console.log("[item_price] OK");
  price();
});
window.addEventListener("turbo:render", price);  // 手順6: render後も動かす

