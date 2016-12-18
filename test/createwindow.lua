--=========== Copyright © 2016, Planimeter, All rights reserved. =============--
--
-- Purpose:
--
--============================================================================--

-- Example program:
-- Using SDL2 to create an application window

local SDL = require( "../sdl" )

local window;                          -- Declare a pointer

SDL_INIT_VIDEO = 0x00000020
SDL.SDL_Init(SDL_INIT_VIDEO);          -- Initialize SDL2

-- Create an application window with the following settings:
SDL_WINDOWPOS_UNDEFINED = 0x1FFF0000
SDL_WINDOW_OPENGL = 0x00000002
window = SDL.SDL_CreateWindow(
    "An SDL2 window",                  -- window title
    SDL_WINDOWPOS_UNDEFINED,           -- initial x position
    SDL_WINDOWPOS_UNDEFINED,           -- initial y position
    640,                               -- width, in pixels
    480,                               -- height, in pixels
    SDL_WINDOW_OPENGL                  -- flags - see below
);

-- Check that the window was successfully created
if (window == nil) then
    -- In the case that the window could not be made...
    print("Could not create window: " .. ffi.string( SDL.SDL_GetError() ));
    os.exit(1);
end

-- The window is open: could enter program loop here (see SDL_PollEvent())

SDL.SDL_Delay(3000);  -- Pause execution for 3000 milliseconds, for example

-- Close and destroy the window
SDL.SDL_DestroyWindow(window);

-- Clean up
SDL.SDL_Quit();
os.exit(0);
