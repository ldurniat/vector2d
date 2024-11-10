------------------------------------------------------------------------------------------------
-- The vector2d module.
--
-- @module  vector2d
-- @author Łukasz Durniat
-- @license MIT
-- @copyright Łukasz Durniat, Sep-2024
------------------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------------ --
--                                 REQUIRED MODULES 	                                      --						
-- ------------------------------------------------------------------------------------------ --

-- ------------------------------------------------------------------------------------------ --
--                                 MODULE DECLARATION	                                      --						
-- ------------------------------------------------------------------------------------------ --

local M = {}

-- ------------------------------------------------------------------------------------------ --
--                                 LOCALISED VARIABLES                                        --	
-- ------------------------------------------------------------------------------------------ --

local sqrt = math.sqrt
local cos  = math.cos
local sin  = math.sin

-- ------------------------------------------------------------------------------------------ --
--                                 PRIVATE METHODS                                            --	
-- ------------------------------------------------------------------------------------------ --

-- Constructor function of vector2d module.
--
-- @param `x`: The x-coordinate position.
-- @param `y`: The y-coordinate position.
--
-- @return The new new vector.
function M.new(x, y)
	-- Set default values 
	x = x or 0
	y = y or 0
	return {x = x, y = y}
end

-- Adds two vectors.
--
-- @param `vector1`: The first vector, represented as a table with `x` and `y` keys.
-- @param `vector2`: The second vector, represented as a table with `x` and `y` keys.
--
-- @return A new vector representing the sum of `vector1` and `vector2`.
function M.add(vector1, vector2)
    return {x = vector1.x + vector2.x, y = vector1.y + vector2.y}
end

-- Subtracts the second vector from the first.
--
-- @param `vector1`: The vector to subtract from, represented as a table with `x` and `y` keys.
-- @param `vector2`: The vector to subtract, represented as a table with `x` and `y` keys.
--
-- @return A new vector representing the difference between `vector1` and `vector2`.
function M.subtract(vector1, vector2)
    return {x = vector1.x - vector2.x, y = vector1.y - vector2.y}
end

-- Multiplies a vector by a scalar value.
--
-- @param `vector`: The vector to multiply, represented as a table with `x` and `y` keys.
-- @param `scalar`: The scalar value to multiply the vector by.
--
-- @return A new vector representing the product of the original vector and the scalar.
function M.multiply(vector, scalar)
    return {x = vector.x * scalar, y = vector.y * scalar}
end

-- Divides a vector by a scalar value.
--
-- @param `vector`: The vector to divide, represented as a table with `x` and `y` keys.
-- @param `scalar`: The scalar value to divide the vector by.
--
-- @return A new vector representing the quotient of the original vector divided by the scalar.
function M.divide(vector, scalar)
    return {x = vector.x / scalar, y = vector.y / scalar}
end

-- Calculates the magnitude of a vector.
--
-- @param `vector`: The vector whose magnitude is to be calculated, represented as a table with `x` and `y` keys.
--
-- @return A floating-point number representing the magnitude of the vector.
function M.magnitude(vector)
    return sqrt(vector.x * vector.x + vector.y * vector.y)
end

-- Normalizes a vector to a unit vector (magnitude of 1).
--
-- @param `vector`: The vector to normalize, represented as a table with `x` and `y` keys.
--
-- @return A normalized vector with the same direction as the original vector. If the vector is zero-length, it returns the original vector.
function M.normalize(vector)
    local mag = M.magnitude(vector)
    if mag == 0 then
        return vector  -- Return the original vector if its magnitude is 0.
    else
        return {x = vector.x / mag, y = vector.y / mag}
    end
end

-- Converts an angle (in degrees) to a unit vector in the Cartesian coordinate system.
--
-- @param `angle`: The angle in degrees to convert to a unit vector.
--
-- @return A new unit vector represented as a table with `x` and `y` keys.
function M.fromAngle(angle)
    local radians = angle * (math.pi / 180)  -- Convert degrees to radians
    return {x = cos(radians), y = sin(radians)}
end

--- Calculates the distance between two vectors in the Cartesian coordinate system.
-- 
-- @param `vectorA`: The first vector, represented as a table with `x` and `y` keys.
-- @param `vectorB`: The second vector, represented as a table with `x` and `y` keys.
--
-- @return The distance between `vectorA` and `vectorB` as a number.
function M.distance(vectorA, vectorB)
    local dx = vectorB.x - vectorA.x
    local dy = vectorB.y - vectorA.y
    return sqrt(dx * dx + dy * dy)
end

-- Calculates the dot product of two vectors.
--
-- @param `vectorA`: The first vector, represented as a table with `x` and `y` keys.
-- @param `vectorB`: The second vector, represented as a table with `x` and `y` keys.
--
-- @return A number representing the dot product of `vectorA` and `vectorB`.
function M.dot(vectorA, vectorB)
    return vectorA.x * vectorB.x + vectorA.y * vectorB.y
end

-- Negates a vector, reversing its direction in place.
--
-- @param `vector`: The vector to negate, represented as a table with `x` and `y` keys.
--
-- @return The original vector with both `x` and `y` components negated.
function M.negate(vector)
    vector.x = -vector.x
    vector.y = -vector.y
    return vector
end

-- Rotates a vector by a given angle and returns a new vector.
--
-- @param `vector`: The vector to rotate, represented as a table with `x` and `y` keys.
-- @param `angle`: The angle in degrees by which to rotate the vector.
--
-- @return A new vector with `x` and `y` components representing the rotated vector.
function M.rotate(vector, angle)
    local radians = math.rad(angle)
    local cosAngle = cos(radians)
    local sinAngle = sin(radians)

    local rotatedX = vector.x * cosAngle - vector.y * sinAngle
    local rotatedY = vector.x * sinAngle + vector.y * cosAngle

    return {x = rotatedX, y = rotatedY}
end

return M