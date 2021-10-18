<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    //

     protected $fillable = [
        'user_id','movie_id','time_slot','sheet_numbers','booking_watch_date','total_amt'];
}
