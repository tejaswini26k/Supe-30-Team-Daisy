import React, { useState } from 'react';
import axios from 'axios';
import './add-product.css'; // optional for styling

const AddProduct = () => {
  const [product, setProduct] = useState({
    product_name: '',
    description: '',
    price: '',
    image_url: '',
    product_category: '',
  });

  const handleChange = (e) => {
    setProduct({ ...product, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post('http://localhost:5000/api/products', product);
      alert('Product added successfully!');
      setProduct({ product_name: '', description: '', price: '', image_url: '', product_category: '' });
    } catch (error) {
      console.error('Error adding product:', error);
      alert('Error adding product.');
    }
  };

  return (
    <div className="add-product">
      <h2>Add New Product</h2>
      <form onSubmit={handleSubmit} className="product-form">
        <input type="text" name="product_name" placeholder="Product Name" value={product.product_name} onChange={handleChange} required />
        <textarea name="description" placeholder="Description" value={product.description} onChange={handleChange} required />
        <input type="number" name="price" placeholder="Price" value={product.price} onChange={handleChange} required />
        <input type="text" name="image_url" placeholder="Image URL" value={product.image_url} onChange={handleChange} required />
        <input type="text" name="product_category" placeholder="Category" value={product.product_category} onChange={handleChange} required />
        <button type="submit" className="btn primary">Add Product</button>
      </form>
    </div>
  );
};

export default AddProduct;
