import React, { Component } from 'react'
import Nav from './navbar'
import SimpleImageSlider from "react-simple-image-slider";


const images = [
  { url: "/images/Resident_Evil_Vendetta.jpg" },
  { url: "/images/Kingsglaive_Final_Fantasy_XV.jpg" },
  { url: "/images/Final_Fantasy_Spirits_Within.jpg" },
  { url: "/images/Ghost_In_The_Shell_2_0.jpg" },
  { url: "/images/Appleseed_Alpha.jpg" },
];


class Index extends Component {

  render() {
    return (
       <div> 
          <Nav />       
          <SimpleImageSlider
                    width={896}
                    height={504}
                    images={images}
                    showBullets={true}
                    showNavs={true}
                  />
       </div>   
    )
  }

}

export default Index