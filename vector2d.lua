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
	
	return {x: x, y:y}
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



return M