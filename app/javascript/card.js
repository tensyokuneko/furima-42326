const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();


  const numberElement = document.getElementById("number-form");
  const expiryElement = document.getElementById("expiry-form");
  const cvcElement = document.getElementById("cvc-form");

 
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
         form.submit();  
      } else {
        const token = response.id;

        const tokenObj = `<input 
        value="${token}" 
        type="hidden" 
        name="token"
        >`;
        form.insertAdjacentHTML("beforeend", tokenObj);

        number.clear();
        expiry.clear();
        cvc.clear();

        form.submit();   
        
      }
    });
  });
  
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);

