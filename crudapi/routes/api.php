<?php

use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\Api\ItemController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('login',[ApiController::class,'login']);
Route::post('register',[ApiController::class,'register']);

Route::get('items',[ItemController::class,'index']);
Route::post('/add-item', [ItemController::class, 'store']);
Route::put('/items/update/{item}', [ItemController::class, 'update']);
Route::get('/items/delete/{id}', [ItemController::class, 'destroy']);


