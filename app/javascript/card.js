const pay = () => {
  const numberElement = document.getElementById("number-form");
  const expiryElement = document.getElementById("expiry-form");
  const cvcElement = document.getElementById("cvc-form");

  const payjp = Payjp('pk_test_0438cdf36f0cfef1388612d7');
  const elements = payjp.elements();

  const number = elements.create("cardNumber");
  number.mount("#number-form");

  const expiry = elements.create("cardExpiry");
  expiry.mount("#expiry-form");

  const cvc = elements.create("cardCvc");
  cvc.mount("#cvc-form");


  
};

window.addEventListener("turbo:load", pay);
