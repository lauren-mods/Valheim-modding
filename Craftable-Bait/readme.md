This is a Fishing Bait recipe.json for Additional Recipes mod (required). You can configure ingredients and amount by editing the baitrecipe.json file in any text editor.

I have never fished irl but did a quick web search and it seems they like meat and sugary foods which is why I chose the ingredients below. Also added one piece of fish to make it less cheaty. Feel free to edit the file however you like!

Note: if you are editing .json files be careful with commas!
e.g. if you want to delete one ingredient, delete whole entry including parentheses and any comma.
Whole ingredient entry example:
﻿            ﻿{
                    "item" : "FishRaw",
                    "amount" : 1
                },


Here is the baitrecipe.json file contents:


{
    "customrecipes" : [
        {
            "name" : "Recipe_Bait",
            "item" : "FishingBait",
            "amount" : 100,
            "craftingStation" : "piece_cauldron",
            "minStationLevel" : 1,
            "enabled"         : true,
            "repairStation"   : "",
            "resources"       : [
                {
                    "item" : "FishRaw",
                    "amount" : 1
                },
                {
                    "item": "RawMeat",
                    "amount": 5
                },
                {
                    "item": "Honey",
                    "amount": 10
                }
            ]
        }
    ]
}
