document.addEventListener('DOMContentLoaded', function initializeForm() {
  const form = document.forms['myForm'];
  const emailInput = form.elements['email'];
  const passwordInput = form.elements['password'];
  const userNameInput = form.elements['userName'];
  const emailError = document.getElementById('emailError');
  const passwordError = document.getElementById('passwordError');
  const userNameError = document.getElementById('userNameError');
  let hasError = false;

  form.addEventListener('submit', function handleFormSubmission(event) {
    event.preventDefault();
    hideError(emailError);
    hideError(passwordError);
    hideError(userNameError);
    hasError = false;

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(emailInput.value)) {
      showError(emailError, 'Invalid email address');
    }

    const passwordRegex = /^[a-zA-Z0-9]{3,8}$/;
    if (!passwordRegex.test(passwordInput.value)) {
      showError(passwordError, 'Invalid password');
    }

    if (!hasError) {
      const formData = collectFormData(form);
      console.log('Form data:', formData);
    }
  });

  function showError(error, message) {
    error.textContent = message;
    error.classList.remove('hide');
    hasError = true;
  }

  function hideError(error) {
    error.classList.add('hide');
  }

  function collectFormData(form) {
    const formData = {};
    for (const input of form.elements) {
      if (input.name) {
        formData[input.name] = input.value;
      }
    }
    return formData;
  }
});
