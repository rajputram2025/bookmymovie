import React, { Component } from 'react'
import Nav from './navbar'
import Movies from './Movie/Movies';
import "./App.css";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';


class Home extends Component {

    constructor(props){
        super(props);
     }     

  render() {
    return (
         <div> 
            <p><ToastContainer /></p>
            <Nav link="Logout" />       
            <div className="container text-center title">
                <div className="mt-5">
                    <Movies />
                </div>
            </div>
          </div>   
    )
  }
}

export default Home