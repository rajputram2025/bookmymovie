<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\APIBaseController as APIBaseController;
use App\User;
use App\Movie;
use App\Booking;
use Validator;
use Mail;
use Image;
use Intervention\Image\ImageServiceProvider;
use DB;
use Carbon\Carbon;
use DateTime;
use Auth;


class ServiceController extends APIBaseController
{

    public function allMovie(Request $request)
    {
        $input = $request->all();

        $finduser = User::find($input['user_id']);

        if(empty($finduser)){
            return $this->sendError($request->path(),"Please login");  
        }
        $details = Movie::where('theatres',$input['theatres'])->get()->toArray();

        return $this->sendResponse($details, 'All movie retrieved successfully',$request->path()); 
    }

    public function getAlltimeAndSheat(Request $request)
    {
        $input = $request->all();

        $finduser = User::find($input['user_id']);

        if(empty($finduser)){
            return $this->sendError($request->path(),"Please login");  
        }

       $movie_details = Movie::where('id',$input['movie_id'])->first();

        $ocupied_sheet1 = Booking::where(['movie_id'=>$input['movie_id'],'time_slot'=>'09:00:00-12:00:00','booking_watch_date'=>date('Y-m-d')])->pluck('sheet_numbers');

        $ocupied_sheet2 = Booking::where(['movie_id'=>$input['movie_id'],'time_slot'=>'15:00:00-18:00:00','booking_watch_date'=>date('Y-m-d')])->pluck('sheet_numbers');

        $ocupied_sheet3 = Booking::where(['movie_id'=>$input['movie_id'],'time_slot'=>'19:00:00-22:00:00','booking_watch_date'=>date('Y-m-d')])->pluck('sheet_numbers');

        $slots = ['09:00:00-12:00:00','15:00:00-18:00:00','19:00:00-22:00:00'];
        // date_default_timezone_set('Asia/Kolkata');
        // $startTime = new DateTime('now');
        // $endTime = new DateTime('tomorrow midnight');

        // while ($startTime < $endTime) {
        //     array_push($slots, $startTime->format('H:i:s').'-'.$startTime->modify('+180 minutes')->format('H:i:s'));
        // }

        $ocupied_sheet_final1 = array();

        foreach ($ocupied_sheet1 as $value) {
            $ocupied_sheet_final1 = array_merge($ocupied_sheet_final1,explode(",", $value));
        }

        $ocupied_sheet_final2 = array();

        foreach ($ocupied_sheet2 as $value) {
            $ocupied_sheet_final2 = array_merge($ocupied_sheet_final2,explode(",", $value));
        }

        $ocupied_sheet_final3 = array();

        foreach ($ocupied_sheet3 as $value) {
            $ocupied_sheet_final3 = array_merge($ocupied_sheet_final3,explode(",", $value));
        }

        $movie_array = array(array("theatres"=>$movie_details->theatres,"title"=>$movie_details->title,"name"=>"09:00:00-12:00:00","price"=>$movie_details->price,"occupied"=>array_map('intval',$ocupied_sheet_final1)),array("theatres"=>$movie_details->theatres,"title"=>$movie_details->title,"name"=>"15:00:00-18:00:00","price"=>$movie_details->price,"occupied"=>array_map('intval',$ocupied_sheet_final2)),array("theatres"=>$movie_details->theatres,"title"=>$movie_details->title,"name"=>"19:00:00-22:00:00","price"=>$movie_details->price,"occupied"=>array_map('intval',$ocupied_sheet_final3)));

        return $this->sendResponse($movie_array, 'Seat and time slot retrieved successfully',$request->path());

         
    }

    public function booking(Request $request)
    {
       $input = $request->all();

       $finduser = User::find($input['user_id']);

        if(empty($finduser)){
            return $this->sendError($request->path(),"Please login");  
        }
       
       $input['booking_watch_date'] = date('Y-m-d');
       $input['sheet_numbers'] = implode(",",$input['sheet_numbers']);

       $details = Booking::create($input);

       return $this->sendResponse($details, 'Your Booking created successfully',$request->path());
      
    }


    public function userregister(Request $request)
    {
        $data = $request->all();

        $validator = Validator::make($data, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);

        if($validator->fails()){
            return $this->sendError($request->path(),$validator->errors()->first());       
        }

        $details = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => $data['password'],
        ]);

        return $this->sendResponse($details, 'User register successfully',$request->path());
    }

    public function login(Request $request)
    {
       $input = $request->all();

       $validator = Validator::make($input, [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:6',
        ]);


        if($validator->fails()){
            return $this->sendError($request->path(),$validator->errors()->first());       
        }

     

     $details = User::whereRaw(" password = '".$input['password']."' and  email = '".$input['email']."'")->first();

      //dd($details);

        if (empty($details)) {
            return $this->sendError($request->path(),"username or password  is incorrect");
        }


       return $this->sendResponse($details, 'User login successfully.',$request->path());
    }

    public function listoftheatres(Request $request)
    {
        $details = Movie::groupBy('theatres')->pluck('theatres');

        return $this->sendResponse($details, 'All movie retrieved successfully',$request->path());
    }


}
