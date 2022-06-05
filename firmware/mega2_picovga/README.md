This is the partial project to build the VGA code for the RP2040 in Visual Studio Code.

You need the entire contents of [geekbozu's fork](https://github.com/geekbozu/PicoVGA) of [PicoVGA by Panda381](https://github.com/Panda381/PicoVGA).

The original repo contains many examples and other unnecessary files. However, I don't have time to cull the project and I am uncertain which elements are re-sharable and which are not. 

Sorry if this is confusing. Reach out to me if you need help. I'll do what I can.


## Notes
* Debugger doesn't work because it halts one of the cores. 
* Programming from within VSCode does not upload new code. Have to use J-Flash Lite to upload the `HEX` or `BIN` file.