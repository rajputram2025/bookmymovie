<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class APIBaseController extends Controller
{
    

    public function sendResponse($result, $message,$requestkey)
    {
        $response = [
            'status' => 'SUCCESS',
            'response'    => $result,
            'message' => $message,
            'requestKey'=>$requestkey,
        ];


        return response()->json($response, 200,[],JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    }



    public function sendError($requestkey,$errorMessages)
    {
    	$response = [
            'status' => 'FAILURE',
            'message' => $errorMessages,
            'requestKey'=>$requestkey,
        ];


        return response()->json($response, 200);
    }
}
