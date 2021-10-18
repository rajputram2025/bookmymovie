import React, { Component } from 'react';
import MovieList from './MovieList';
import axios from 'axios';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

let theatres = [
   'GIP Mall Noida'
];

export default class Movies extends Component {

    notify = () => toast("Wow so easy !");

    constructor(props) {
        super(props);

        this.state = {
            movies: [],
            selectedMovie:theatres[0],
        };
    }

    componentDidMount() {
        axios.get('/api/listoftheatres')
          .then(response=> {
            if(response.data.status == "FAILURE"){
               window.location.assign("./")
            }
            theatres = response.data.response;
          })
          .catch(error=> {
            console.log(error);
          });

        axios.post('/api/getallmovie',{user_id:localStorage.getItem('userdetails'),theatres:this.state.selectedMovie})
          .then(response=> {
            if(response.data.status == "FAILURE"){
               window.location.assign("./")
            }
            this.setState(() => ({ movies: response.data.response }));
          })
          .catch(error=> {
            console.log(error);
          });
        
    }

    onChange(movie){
        this.setState({selectedMovie: movie});
        axios.post('/api/getallmovie',{user_id:localStorage.getItem('userdetails'),theatres:movie})
          .then(response=> {
            if(response.data.status == "FAILURE"){
               window.location.assign("./")
            }
            this.setState(() => ({ movies: response.data.response }));
          })
          .catch(error=> {
            console.log(error);
          });
     }

    render() {
        return (
            <div className="container-fluid" style={{marginLeft: '-15px'}}>
                <p><ToastContainer /></p>
                <MovieSelect
                        movie={this.state.selectedMovie}
                        onChange={this.onChange.bind(this)}
                      />
                <div className="d-flex flex-row">                    
                    <div className="col-sm-12">
                        <MovieList movies={this.state.movies} />
                    </div>
                </div>
            </div>
        );
    }
}


function MovieSelect({ movie, onChange }) {

  return (
    <div className="Movies">
      <label htmlFor="movie">Pick a theatre</label>
      <select
        id="movie"
        value={movie}
        onChange={e => {
          onChange(theatres.find(movie => movie === e.target.value))
        }}
      >
        {theatres.map(movie => (
          <option key={movie} value={movie}>
            {movie}
          </option>
        ))}
      </select>
    </div>
  )
}