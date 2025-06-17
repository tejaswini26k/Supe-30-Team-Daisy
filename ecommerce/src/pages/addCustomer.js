import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import './add-order.css'; // Reusing styles from AddOrder for consistency

const AddCustomer = () => {
  const [name, setName] = useState('');
  const [phone, setPhone] = useState('');
  const [email, setEmail] = useState('');
  const [address, setAddress] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();

    const payload = {
      customer_name: name,
      phone_number: phone,
      email,
      address,
    };

    try {
      const token = localStorage.getItem('token');
      await axios.post('http://localhost:5000/api/customers_add', payload, {
        headers: { Authorization: `Bearer ${token}` }
      });

      alert('✅ Customer added successfully');
      navigate('/'); // or navigate('/customers') based on your routes
    } catch (err) {
      console.error('❌ Error adding customer:', err);
      alert('Error: ' + (err.response?.data?.error || err.message));
    }
  };

  return (
    <div className="add-order-page">
      <div className="add-order-card">
        <h1>Add New Customer</h1>
        <form onSubmit={handleSubmit} className="order-form">
          <label>Name:</label>
          <input type="text" value={name} onChange={e => setName(e.target.value)} required />

          <label>Phone Number:</label>
          <input type="text" value={phone} onChange={e => setPhone(e.target.value)} required />

          <label>Email:</label>
          <input type="email" value={email} onChange={e => setEmail(e.target.value)} required />

          <label>Address:</label>
          <textarea value={address} onChange={e => setAddress(e.target.value)} required />

          <button type="submit" className="add-order-btn">Submit</button>
        </form>
      </div>
    </div>
  );
};

export default AddCustomer;
