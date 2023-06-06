//here all component title name render as a parent

import React from "react";
import LoginPage from "./Pages/login_page";

const App = () => {
  return (
    <div className="overflow-hidden">
    <LoginPage/>
    </div>
  );
};

export default App;
