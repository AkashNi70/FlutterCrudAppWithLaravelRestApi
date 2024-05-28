<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    //
    function index(){
        $items = Item::all();
        return $items;
    }

    public function store(Request $request)
    {
        $request->validate(['name' => 'required|string']);
        $item = Item::create($request->only('name'));
        return response()->json($item, 201);
    }

    public function update(Request $request, Item $item)
    {
        $request->validate(['name' => 'required']);
        $updated = $item->update(['name' => $request->name]);

        if ($updated) {
            return response()->json($item, 200);
        } else {
            return response()->json(['error' => 'Failed to update item'], 500);
        }
    }


    public function destroy($id)
    {
        Item::findOrFail($id)->delete();
        return response()->json(null, 204);
    }
}
