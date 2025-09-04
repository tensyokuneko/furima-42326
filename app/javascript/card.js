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

    const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(number).then((response) => {
      if (response.error) {
        alert(response.error.message);
      } else {
        const token = response.id;

        const tokenObj = `<input value="${token}" type="hidden" name="token">`;
        form.insertAdjacentHTML("beforeend", tokenObj);
      
        
      }
    });
  });



  
};

window.addEventListener("turbo:load", pay);
