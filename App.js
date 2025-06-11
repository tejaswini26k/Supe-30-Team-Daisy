import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Home from './pages/home';
import Login from "./pages/login";
import SignUp from "./pages/signup";
import Orders from './pages/orders';
import AddOrder from './pages/addOrders';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route path="/signup" element={<SignUp />} />
        <Route path="/orders" element={<Orders />} />
        <Route path="/orders/new" element={<AddOrder />} />
        {/* Add more routes here as needed */}
      </Routes>
    </Router>
  );
}

export default App;