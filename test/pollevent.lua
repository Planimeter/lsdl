--=========== Copyright © 2017, Planimeter, All rights reserved. =============--
--
-- Purpose:
--
--============================================================================--

-- Example program:
-- Using SDL2 to create an application window

local SDL = require( "../sdl" )
local ffi = require( "ffi" )

local window;                          -- Declare a pointer

SDL.SDL_Init(SDL.SDL_INIT_VIDEO);      -- Initialize SDL2

-- Create an application window with the following settings:
window = SDL.SDL_CreateWindow(
    "An SDL2 window",                  -- window title
    SDL.SDL_WINDOWPOS_UNDEFINED,       -- initial x position
    SDL.SDL_WINDOWPOS_UNDEFINED,       -- initial y position
    640,                               -- width, in pixels
    480,                               -- height, in pixels
    ffi.C.SDL_WINDOW_OPENGL            -- flags - see below
);

-- Check that the window was successfully created
if (window == nil) then
    -- In the case that the window could not be made...
    print("Could not create window: " .. ffi.string( SDL.SDL_GetError() ));
    os.exit(1);
end

while (1) do
    local event = ffi.new( "SDL_Event" );
    while (SDL.SDL_PollEvent(event)) do
        --[[ handle your event here ]]
    end
    --[[ do some other stuff here -- draw your app, etc. ]]
end

-- Close and destroy the window
SDL.SDL_DestroyWindow(window);

-- Clean up
SDL.SDL_Quit();
os.exit(0);
