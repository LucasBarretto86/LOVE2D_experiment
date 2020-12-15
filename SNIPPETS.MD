# SNIPPETS Worth to be saved

## OBJECTS 
#
### Centralized Anchors
#### !Notice that by standard every obj is drawed from top left corner, that's why it has to be translated!
#

This is a method to translate obj.x -50% to allow it to be centralized when it gets drawed

```
function getAnchorX(object)
    return object.x - (object.width / 2)
end
```
#
This is a method to translate obj.y -50% to allow it to be centralized when it gets drawed

```
function getAnchorY(object)
    return object.y - (object.height / 2)
end
```
## MATH
#
### Diference between two "points"
#
Method to check if two points(a point is a combination from coordinates x, y) have a delta between their positions
~~~
function distanceBetween(x1, y1, x2, y2)
   return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
~~~