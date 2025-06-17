import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './admin-products.css';

const AdminProducts = () => {
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState(['All']); // Default category

  useEffect(() => {
    // Fetch products
    axios.get('http://localhost:5000/api/products')
      .then((res) => setProducts(res.data))
      .catch((err) => console.error('Error fetching products:', err));

    // Fetch categories
    axios.get('http://localhost:5000/api/categories')
      .then((res) => {
        // Extract string names from array of objects
        const categoryNames = res.data.map(c => c.product_category);
        setCategories(['All', ...categoryNames]); // Add "All" at the top
      })
      .catch((err) => console.error('Error fetching categories:', err));
  }, []);

  return (
    <div className="admin-products">
      <h1 className="page-title">Products</h1>

      <div className="search-controls">
        <input type="text" placeholder="Search or type" className="search" />
        <div className="controls">
          <button className="btn">Delete</button>
          <button className="btn">Filter</button>
          <button className="btn primary">+ Add new product</button>
        </div>
      </div>

      <div className="categories">
        {categories.map((category, index) => (
          <button key={index} className="category">{category}</button>
        ))}
        <button className="btn">+ Add category</button>
      </div>

      <div className="product-grid">
        {products.map(product => (
          <div className="product-card" key={product.product_id}>
            {product.product_category === 'Top selling' && (
              <span className="badge">⭐ Top selling</span>
            )}
            <img src={product.image_url} alt={product.product_name} className="product-image" />
            <h2 className="product-name">{product.product_name}</h2>
            <p className="product-desc">{product.description}</p>
            <p className="product-price">Rs. {product.price.toLocaleString()}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default AdminProducts;
