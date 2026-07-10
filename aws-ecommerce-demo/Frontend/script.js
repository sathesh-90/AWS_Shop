const productsGrid = document.getElementById('productsGrid');
const loadingState = document.getElementById('loadingState');
const themeToggle = document.getElementById('themeToggle');

function renderProducts(products) {
  productsGrid.innerHTML = '';

  if (!products.length) {
    productsGrid.innerHTML = '<div class="error">No products available right now.</div>';
    return;
  }

  const fragment = document.createDocumentFragment();

  products.forEach((product) => {
    const card = document.createElement('article');
    card.className = 'product-card';
    card.innerHTML = `
      <img src="${product.image}" alt="${product.name}" />
      <h3>${product.name}</h3>
      <p>${product.description}</p>
      <p class="product-price">$${product.price.toFixed(2)}</p>
      <button class="button buy-btn" type="button">Buy Now</button>
    `;

    card.querySelector('.buy-btn').addEventListener('click', () => {
      window.alert(`Thanks for your interest in ${product.name}!`);
    });

    fragment.appendChild(card);
  });

  productsGrid.appendChild(fragment);
}

async function loadProducts() {
  try {
    const response = await fetch('/products');
    if (!response.ok) {
      throw new Error('Could not load products.');
    }

    const data = await response.json();
    renderProducts(data.products || []);
  } catch (error) {
    productsGrid.innerHTML = `<div class="error">${error.message}</div>`;
  }
}

function toggleTheme() {
  document.body.classList.toggle('dark');
  const isDark = document.body.classList.contains('dark');
  themeToggle.textContent = isDark ? '☀️' : '🌙';
  localStorage.setItem('theme', isDark ? 'dark' : 'light');
}

function initializeTheme() {
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    document.body.classList.add('dark');
    themeToggle.textContent = '☀️';
  }
}

document.addEventListener('DOMContentLoaded', () => {
  initializeTheme();
  loadingState.innerHTML = '<div class="spinner"></div><p>Loading products...</p>';
  loadProducts();

  themeToggle.addEventListener('click', toggleTheme);
});
