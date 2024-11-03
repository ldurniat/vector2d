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


return M