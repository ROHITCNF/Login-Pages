import React, { useState } from "react";

//import icons
import { BsGithub, BsGoogle, BsFacebook, BsLinkedin } from "react-icons/bs";

//mobile first approach
const LoginPage = () => {
  const [userName, setUserName] = useState("");
  const [password, setPassword] = useState("");

  const handleSignIn = () => {};
  return (
    <div className="h-full w-full items-center justify-center flex inset-0 fixed bg-yellow-50">
      {/*  parent container  for login stuffs  */}
      <div
        className="h-[75%] w-[75%]
       bg-white  rounded-xl shadow md:bg-blue-400"
      >
        {/* div which contain all the login stuffs inside it */}
        <div>
          {/* Title and greetings */}
          <div className="flex flex-col items-center">
            <p className="text-2xl font-bold py-2 flex">Welcome Back</p>
            <p className="text-gray-500 font-light flex">
              Please enter your details to get sign in
            </p>
          </div>
          {/* username & password */}
          <div>
            <div className="flex flex-col items-center py-4">
              <input
                type="email"
                placeholder="Email"
                value={userName}
                onChange={(e) => setUserName(e.target.value)}
                className="py-2 rounded-md 
                shadow text-center
                 hover:shadow-lg focus-visible:outline-gray-100"
              />
              <br />
              <input
                type="password"
                placeholder="Password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="py-2 rounded-md 
                shadow text-center
                 hover:shadow-lg focus-visible:outline-gray-100"
              />
            </div>
          </div>
          {/* Sign in button */}

          <div className="flex items-center justify-center ">
            <button
              onClick={handleSignIn()}
              className="rounded-md w-[53%] py-1.5 bg-yellow-200"
            >
              <span className="font-semibold text-sm">Sign in</span>
            </button>
          </div>

          {/* Api Sign in */}
          <div
            className=" flex flex-col items-center justify-center
            "
          >
            {/* or sign in with  */}
            <div className="py-2">
              <p className="text-sm text-gray-500 flex font-thin">— Or Sign in with —</p>
            </div>
            <div
              className="flex flex-row items-center justify-center
            my-2"
            >
              <div className="mx-3">
                <BsGoogle className="text-xl font-bold " />
              </div>
              <div className="mx-3">
                <BsFacebook className="text-xl font-bold " />
              </div>
              <div className="mx-3">
                <BsGithub className="text-xl font-bold " />
              </div>
              <div className="mx-3">
                <BsLinkedin className="text-xl font-bold " />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
export default LoginPage;
