import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './dashboard.css';

const Dashboard = () => {
  const [data, setData] = useState({
    users: [],
    customers: [],
    orders: [],
    order_items: [],
    products: [],
    feedback: [],
    sales: [],
    stores: []
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const endpoints = [
          'users',
          'customers',
          'orders',
          'order_items',
          'products',
          'feedback',
          'sales',
          'stores'
        ];

        const results = await Promise.all(
          endpoints.map(endpoint => axios.get(`http://localhost:5000/api/${endpoint}`))
        );

        const newData = {};
        endpoints.forEach((key, i) => newData[key] = results[i].data);

        setData(newData);
        setLoading(false);
      } catch (err) {
        setError(err.message);
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  if (loading) return <div className="loading">Loading...</div>;
  if (error) return <div className="error">Error: {error}</div>;

  return (
    <div className="dashboard">
      <h1>Admin Dashboard</h1>

      {Object.entries(data).map(([key, items]) => (
        <div className="section" key={key}>
          <h2>{key.replace('_', ' ').toUpperCase()}</h2>
          <table>
            <thead>
              <tr>
                {items[0] && Object.keys(items[0]).map(col => (
                  <th key={col}>{col}</th>
                ))}
              </tr>
            </thead>
            <tbody>
              {items.map((item, idx) => (
                <tr key={idx}>
                  {Object.values(item).map((val, i) => (
                    <td key={i}>{val === null ? 'N/A' : val.toString()}</td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ))}
    </div>
  );
};

export default Dashboard;
