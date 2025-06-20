import React, { useState, useEffect } from "react";
import './stores.css';


export default function Stores() {
  const [storeName, setStoreName] = useState("");
  const [slug, setSlug] = useState("");
  const [description, setDescription] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [facebook, setFacebook] = useState("");
  const [instagram, setInstagram] = useState("");
  const [theme, setTheme] = useState("light");
  const [primaryColor, setPrimaryColor] = useState("#3b82f6");
  const [logo, setLogo] = useState(null);
  const [logoPreview, setLogoPreview] = useState(null);
  const [currency, setCurrency] = useState("USD");
  const [timezone, setTimezone] = useState("UTC");
  const [businessType, setBusinessType] = useState("Retail");
  const [showSuccessModal, setShowSuccessModal] = useState(false);
  const [currentTime, setCurrentTime] = useState(new Date());

  // Auto-generate slug
  useEffect(() => {
    setSlug(storeName.trim().toLowerCase().replace(/\s+/g, "-"));
  }, [storeName]);
  useEffect(() => {
  const interval = setInterval(() => {
    setCurrentTime(new Date());
  }, 1000);

  return () => clearInterval(interval); // cleanup on unmount
}, []);





  const handleLogoChange = (e) => {
    const file = e.target.files[0];
    setLogo(file);
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => setLogoPreview(reader.result);
      reader.readAsDataURL(file);
    }
  };

  const handleSubmit = async (e) => {
  e.preventDefault();

  const formData = new FormData();
  formData.append('store_name', storeName);
  formData.append('slug', slug);
  formData.append('description', description);
  formData.append('store_email', email);
  formData.append('password', password);
  formData.append('facebook', facebook);
  formData.append('instagram', instagram);
  formData.append('theme', theme);
  formData.append('primary_color', primaryColor);
  formData.append('currency', currency);
  formData.append('timezone', timezone);
  formData.append('business_type', businessType);

  if (logo) {
    formData.append('logo', logo);
  }

  try {
    const res = await fetch('http://localhost:5000/api/stores', {
      method: 'POST',
      body: formData,
    });

    const result = await res.json();

    if (res.ok) {
      setShowSuccessModal(true); // ✅ Show popup here
    } else {
      console.error(result);
      alert("❌ Failed to create store.");
    }
  } catch (err) {
    console.error("Error submitting form:", err);
    alert("An error occurred. Check console for details.");
  }
};


// Generate a darker/lighter shade of primary color
function shadeColor(color, percent) {
  let R = parseInt(color.substring(1, 3), 16);
  let G = parseInt(color.substring(3, 5), 16);
  let B = parseInt(color.substring(5, 7), 16);

  R = parseInt((R * (100 + percent)) / 100);
  G = parseInt((G * (100 + percent)) / 100);
  B = parseInt((B * (100 + percent)) / 100);

  R = R < 255 ? R : 255;
  G = G < 255 ? G : 255;
  B = B < 255 ? B : 255;

  const RR = R.toString(16).padStart(2, "0");
  const GG = G.toString(16).padStart(2, "0");
  const BB = B.toString(16).padStart(2, "0");

  return `#${RR}${GG}${BB}`;
}


  return (
   <div className="store-setup-wrapper max-w-4xl mx-auto px-4">

      <form
        onSubmit={handleSubmit}
        form className="store-form"

      >
        <h2 className="text-3xl font-bold text-center">🛍️ Store Setup</h2>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Store Name */}
          <div>
            <label className="block font-medium mb-1">Store Name</label>
            <input
              type="text"
              value={storeName}
              onChange={(e) => setStoreName(e.target.value)}
              required
              className="w-full p-2 border rounded"
            />
          </div>

          {/* Slug */}
          <div>
            <label className="block font-medium mb-1">Store Slug (URL)</label>
            <input
              type="text"
              value={slug}
              readOnly
              className="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-400 focus:outline-none"

            />
          </div>

          {/* Description */}
          <div className="md:col-span-2">
            <label className="block font-medium mb-1">Store Description</label>
            <textarea
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              rows="3"
              className="w-full p-2 border rounded"
              placeholder="What does your store sell?"
            />
          </div>

          {/* Contact Email */}
          <div>
            <label className="block font-medium mb-1">Contact Email</label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="w-full p-2 border rounded"
            />
          </div>

          <div>
  <label className="block font-medium mb-1">Password</label>
  <input
    type="password"
    value={password}
    onChange={(e) => setPassword(e.target.value)}
    required
    className="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-400 focus:outline-none"
    placeholder="Enter a secure password"
  />
</div>




          {/* Business Type */}
          <div>
            <label className="block font-medium mb-1">Business Type</label>
            <select
              value={businessType}
              onChange={(e) => setBusinessType(e.target.value)}
              className="w-full p-2 border rounded"
            >
              <option>Retail</option>
              <option>Wholesale</option>
              <option>Digital Products</option>
              <option>Services</option>
              <option>Other</option>
            </select>
          </div>

          {/* Currency */}
          <div>
            <label className="block font-medium mb-1">Currency</label>
            <select
              value={currency}
              onChange={(e) => setCurrency(e.target.value)}
              className="w-full p-2 border rounded"
            >
              <option value="USD">USD</option>
              <option value="EUR">EUR</option>
              <option value="INR">INR</option>
              <option value="GBP">GBP</option>
            </select>
          </div>

          {/* Timezone */}
          <div>
            <label className="block font-medium mb-1">Time Zone</label>
            <select
              value={timezone}
              onChange={(e) => setTimezone(e.target.value)}
              className="w-full p-2 border rounded"
            >
              <option value="UTC">UTC</option>
              <option value="America/New_York">New York</option>
              <option value="Europe/London">London</option>
              <option value="Asia/Kolkata">India</option>
              <option value="Asia/Tokyo">Japan</option>
            </select>
          </div>
          {/* Timezone Display */}
<div className="col-span-2">
  <p className="text-sm text-gray-600 mt-2">
    🕒 Current Time in {timezone}:{" "}
    {currentTime.toLocaleString("en-US", { timeZone: timezone })}
  </p>
</div>
          
  





          {/* Social Links */}
          <div>
            <label className="block font-medium mb-1">Facebook URL</label>
            <input
              type="url"
              value={facebook}
              onChange={(e) => setFacebook(e.target.value)}
              className="w-full p-2 border rounded"
            />
          </div>
          <div>
            <label className="block font-medium mb-1">Instagram URL</label>
            <input
              type="url"
              value={instagram}
              onChange={(e) => setInstagram(e.target.value)}
              className="w-full p-2 border rounded"
            />
          </div>

          {/* Logo */}
          <div>
            <label className="block font-medium mb-1">Store Logo</label>
            <input
  type="file"
  accept="image/*"
  onChange={handleLogoChange}
  className="w-full p-2 border rounded bg-white"
/>

            <img
  src={logoPreview}
  alt="Logo"
  className="mt-2 h-20 rounded shadow-md"
/>

          </div>

          {/* Theme Selection */}
          <div>
            <label className="block font-medium mb-1">Theme</label>
            <select
              value={theme}
              onChange={(e) => setTheme(e.target.value)}
              className="w-full p-2 border rounded"
            >
              <option value="light">Light</option>
              <option value="dark">Dark</option>
            </select>
          </div>

          {/* Color Picker */}
          <div>
            <label className="block font-medium mb-1">Primary Color</label>
            <input
              type="color"
              value={primaryColor}
              onChange={(e) => setPrimaryColor(e.target.value)}
              className="w-16 h-10 p-0 border rounded cursor-pointer"
            />
          </div>

          {/* Theme Preview */}
          {/* Theme Preview */}
{/* Theme Preview */}
<div>
  <h3 className="text-lg font-semibold mb-2 text-gray-700 dark:text-gray-300">
    Live Theme Preview
  </h3>
</div>

<div
  className="md:col-span-2 mt-2 border rounded shadow p-6 relative"
  style={{
    backgroundColor: theme === "light" ? "#ffffff" : "#1f2937",
    color: theme === "light" ? "#111827" : "#f9fafb",
    transition: "all 0.3s ease",
    position: "relative",
    overflow: "hidden",
    minHeight: "150px"
  }}
>
  {/* Logo in Top Right */}
  {logoPreview && (
    <img
      src={logoPreview}
      alt="Logo"
      className="absolute top-4 right-4 h-12 w-auto object-contain rounded shadow"
      style={{
        maxHeight: "60px",
        maxWidth: "120px"
      }}
    />
  )}

  {/* Centered Store Name */}
  <div className="flex justify-center items-center h-full">
    <h1
      className="text-3xl font-bold text-center"
      style={{
        color: primaryColor,
        textShadow: "1px 1px 3px rgba(0,0,0,0.2)"
      }}
    >
      {storeName || "Your Store Name"}
    </h1>
  </div>

  {/* Bottom gradient for style */}
  <div
    className="absolute bottom-0 left-0 w-full h-2"
    style={{
      background: `linear-gradient(to right, ${primaryColor}, ${shadeColor(
        primaryColor,
        -20
      )})`
    }}
  ></div>
</div>

</div>


        {/* Submit Button */}
        <button type="submit" className="submit-btn">
  ✅ Save Store Setup
</button>

   </form>
   {showSuccessModal && (
  <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
    <div className="bg-white rounded-lg shadow-lg p-6 w-96 text-center">
      <h3 className="text-xl font-bold mb-4">🎉 Store Setup Complete</h3>
      <p>Your store has been successfully created!</p>
      <button
        onClick={() => setShowSuccessModal(false)}
        className="mt-4 px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
      >
        Close
      </button>
    </div>
  </div>
)}




    </div>
  );
}
