import './App.css'
import React, { useState, useEffect } from 'react'
import clsx from 'clsx'
import Nav from './navbar'
import axios from 'axios';
import {
  useParams
} from "react-router-dom";
import { Link } from 'react-router-dom'
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';


let movies = [
  {
    name: '09:00:00-12:00:00',
    price: 0,
    occupied: [],
  },
];

const seats = Array.from({ length: 8 * 8 }, (_, i) => i)

export default function App(props) {
  const notify = () => toast("Wow so easy!");
  const [movie1,updateMovie1] = useState("");
  const [selectedMovie, setSelectedMovie] = useState(movies[0])
  const [selectedSeats, setSelectedSeats] = useState([])
  const [hidden, setHidden] = useState("hidden")
  const  movie_id = useParams();
  
  useEffect(() => {
    // Update the document title using the browser API
    console.log(movie_id.movieid);
    
     axios.post('/api/timeAndSheat',{movie_id:movie_id.movieid,user_id:localStorage.getItem('userdetails')})
          .then(response=> {
            if(response.data.status == "FAILURE"){
              props.history.push('/login');
            }
            console.log(response.data);
            movies = response.data.response;
            setHidden("");
            updateMovie1(movies['0'].title+"("+movies['0'].theatres+")");
            setSelectedMovie(movies['0']);
            console.log(movies);
          })
          .catch(error=> {
            console.log(error);
          });
  },[movie_id]);

  const bookingCheckout = (e) => {
     axios.post('/api/booking',{user_id:localStorage.getItem('userdetails'),total_amt:selectedSeats.length * selectedMovie.price,movie_id:movie_id.movieid,time_slot:selectedMovie.name,sheet_numbers:selectedSeats})
          .then(response=> {
            if(response.data.status == "FAILURE"){
              props.history.push('/login');
              toast.error("Please login");
            }
            console.log(response.data.response);
            toast.success("Your Booking created successfully");
            setTimeout(function() {
              props.history.push('/home');
            }, 2000);
            
          })
          .catch(error=> {
            console.log(error);
          });
  }

  return (
    <>
    <Nav link="Logout" />
    <div className={hidden}>
    <div className="App">
      <h1>{movie1}</h1>
      <p><ToastContainer /></p>
      <Movies
        movie={selectedMovie}
        onChange={movie => {
          setSelectedSeats([])
          setSelectedMovie(movie)
        }}
      />
      <ShowCase />
      <Cinema
        movie={selectedMovie}
        selectedSeats={selectedSeats}
        onSelectedSeatsChange={selectedSeats => setSelectedSeats(selectedSeats)}
      />

      <p className="info">
        You have selected <span className="count">{selectedSeats.length}</span>{' '}
        seats for the price of{' '}
        <span className="total">
          {selectedSeats.length * selectedMovie.price}$
        </span>
      </p>
      <Link to="/home/" className="btn btn-primary" >Back</Link>
      {
        (selectedSeats.length != 0)?
       <button type="button" className="btn btn-primary" onClick={bookingCheckout}>
                                                  Checkout  
                                                </button>:''                                      
      }

    </div>
    </div>
    </>
  )
}

function Movies({ movie, onChange }) {

  return (
    <div className="Movies">
      <label htmlFor="movie">Pick a time slot</label>
      <select
        id="movie"
        value={movie.name}
        onChange={e => {
          onChange(movies.find(movie => movie.name === e.target.value))
        }}
      >
        {movies.map(movie => (
          <option key={movie.name} value={movie.name}>
            {movie.name} (${movie.price})
          </option>
        ))}
      </select>
    </div>
  )
}

function ShowCase() {
  return (
    <ul className="ShowCase">
      <li>
        <span className="seat" /> <small>N/A</small>
      </li>
      <li>
        <span className="seat selected" /> <small>Selected</small>
      </li>
      <li>
        <span className="seat occupied" /> <small>Occupied</small>
      </li>
    </ul>
  )
}

function Cinema({ movie, selectedSeats, onSelectedSeatsChange }) {
  function handleSelectedState(seat) {
    const isSelected = selectedSeats.includes(seat)
    if (isSelected) {
      onSelectedSeatsChange(
        selectedSeats.filter(selectedSeat => selectedSeat !== seat),
      )
    } else {
      onSelectedSeatsChange([...selectedSeats, seat])
    }
  }

  return (
    <div className="Cinema">
      <div className="screen" />

      <div className="seats">
        {seats.map(seat => {
          const isSelected = selectedSeats.includes(seat)
          const isOccupied = movie.occupied.includes(seat)
          return (
            <span
              tabIndex="0"
              key={seat}
              className={clsx(
                'seat',
                isSelected && 'selected',
                isOccupied && 'occupied',
              )}
              onClick={isOccupied ? null : () => handleSelectedState(seat)}
              onKeyPress={
                isOccupied
                  ? null
                  : e => {
                      if (e.key === 'Enter') {
                        handleSelectedState(seat)
                      }
                    }
              }
            />
          )
        })}
      </div>
    </div>
  )
}
