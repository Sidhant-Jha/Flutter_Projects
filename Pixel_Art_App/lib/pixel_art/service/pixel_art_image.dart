class PixelArtImage
{
    static List<String> pinkBird = [
    '#FF0000', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF','#FF0000', '#FF0000', '#FF0000', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FF0000', '#FF0000', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FF0000', '#FFC0CB', '#FFC0CB', '#FFC0CB', '#FF0000', '#FFFFFF', '#FFFFFF',
    '#FF0000', '#FF0000', '#FF0000', '#FFFFFF', '#FFFFFF', '#FF0000', '#FFC0CB', '#FFC0CB', '#FFFFFF', '#FFFFFF', '#FF0000', '#FFFFFF', '#FFFFFF',
    '#FF0000', '#FFC0CB', '#FF0000', '#FFFFFF', '#FF0000', '#FFC0CB', '#FFFFFF', '#FFFFFF', '#000000', '#FFFFFF', '#FF0000', '#FFFFFF', '#FFFFFF',
    '#FF0000', '#FFC0CB', '#FFC0CB', '#FF0000', '#FF0000', '#FFC0CB', '#FFFFFF', '#FFC0CB', '#FFFFFF', '#FFFFFF', '#FFFF00', '#FFFF00', '#FFFFFF',
    '#FF0000', '#FFC0CB', '#FFC0CB', '#FFC0CB', '#FF0000', '#FFC0CB', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FF0000', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FF0000', '#FFC0CB', '#FFC0CB', '#FFC0CB', '#FFC0CB', '#FFC0CB', '#FFC0CB', '#FF0000', '#FF0000', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', 
    '#FFFFFF', '#FF0000', '#FF0000', '#FFC0CB', '#FFC0CB', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#FF0000', '#FFC0CB', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FF0000', '#FF0000', '#FF0000', '#FFC0CB', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FF0000', '#FFC0CB', '#FFC0CB', '#FF0000', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FF0000', '#FF0000', '#FF0000', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF'
    ];

    static List<String> brownBird = [
    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#8B4513', '#8B4513', '#8B4513', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#8B4513', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#8B4513', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#8B4513', '#FFFF00', '#FFE4C4', '#000000', '#FFE4C4', '#A0522D', '#8B4513', '#FFFFFF', '#FFFFFF', '#8B4513', '#8B4513',
    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#8B4513', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#A0522D', '#8B4513', '#FFFFFF', '#8B4513', '#A0522D', '#8B4513',
    '#FFFFFF', '#FFFFFF', '#8B4513', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#A0522D', '#8B4513', '#A0522D', '#8B4513', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#8B4513', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#8B4513', '#FFE4C4', '#A0522D', '#8B4513', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#8B4513', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#FFE4C4', '#8B4513', '#A0522D', '#8B4513', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#8B4513', '#A0522D', '#8B4513', '#A0522D', '#8B4513', '#A0522D', '#A0522D', '#8B4513', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#8B4513', '#FFFF00', '#8B4513', '#FFFF00', '#8B4513', '#8B4513', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF'
    ];


    static List<String> dog = [

    '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', 
 '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#D2B48C', 
 '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', 
 '#FFFFFF', '#A52A2A', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', 
 '#A52A2A', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#A52A2A', '#A52A2A', '#D2B48C', '#D2B48C', '#D2B48C', 
 '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#A52A2A', '#A52A2A', '#FFFFFF', '#A52A2A', '#A52A2A', 
 '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', 
 '#A52A2A', '#A52A2A', '#A52A2A', '#A52A2A', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', 
 '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#A52A2A', '#A52A2A', '#A52A2A', '#A52A2A', '#D2B48C', 
 '#D2B48C', '#000000', '#D2B48C', '#D2B48C', '#D2B48C', '#000000', '#D2B48C', '#D2B48C', '#A52A2A', 
 '#A52A2A', '#FFFFFF', '#A52A2A', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', 
 '#D2B48C', '#D2B48C', '#D2B48C', '#A52A2A', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#D2B48C', 
 '#D2B48C', '#000000', '#000000', '#000000', '#D2B48C', '#D2B48C', '#FFFFFF', '#FFFFFF', '#FFFFFF', 
 '#FFFFFF', '#FFFFFF', '#FFFFFF', '#D2B48C', '#D2B48C', '#D2B48C', '#000000', '#D2B48C', '#D2B48C', 
 '#D2B48C', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#D2B48C', 
 '#D2B48C', '#D2B48C', '#D2B48C', '#D2B48C', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', 
 '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', 
 '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', 
 '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF'
    ];

}